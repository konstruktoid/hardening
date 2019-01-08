workflow "New workflow" {
  on = "push"
  resolves = ["Konstruktoid ShellCheck"]
}

action "Konstruktoid ShellCheck" {
  uses = "./action-shellcheck"
}
