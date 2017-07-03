function f_path {
  echo "[$i] Modifying paths"

  sed -i 's/PATH=.*/PATH=\"\/usr\/local\/bin:\/usr\/bin:\/bin"/' /etc/environment
  cp ./config/initpath.sh /etc/profile.d/initpath.sh

  chown root:root /etc/profile.d/initpath.sh
  chmod 0644 /etc/profile.d/initpath.sh

  ((i++))
}
