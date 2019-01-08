FROM koalaman/shellcheck-alpine

LABEL "com.github.actions.name"="Konstruktoid ShellCheck"
LABEL "com.github.actions.description"="ShellCheck for multiple files"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/konstruktoid/hardening"
LABEL "homepage"="https://github.com/konstruktoid/hardening"
LABEL "maintainer"="Thomas Sjögren <konstruktoid@users.noreply.github.com>"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
