FROM koalaman/shellcheck-alpine:stable@sha256:f73b035c8ebfc8a66ba54e07af5cc41e790cf41fff45317914b1ce677dd9cada

LABEL "com.github.actions.name"="Konstruktoid ShellCheck"
LABEL "com.github.actions.description"="ShellCheck for multiple files"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/konstruktoid/hardening"
LABEL "homepage"="https://github.com/konstruktoid/hardening"
LABEL "maintainer"="Thomas Sjögren <konstruktoid@users.noreply.github.com>"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
