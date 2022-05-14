variable "region" {
  type    = string
  default = "eu-west-3"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "hardening" {
  ami_name      = "hardening-packer-${local.timestamp}"
  instance_type = "t3.small"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/*ubuntu-focal-20.04-amd64-server*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username            = "ubuntu"
  ssh_timeout             = "10m"
  ssh_keep_alive_interval = "15s"
  ssh_pty                 = "true"
}

build {
  sources = ["source.amazon-ebs.hardening"]
  provisioner "shell" {
    script = "./aws_configure.sh"
  }
}
