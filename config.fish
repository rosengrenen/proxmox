set -x PATH $PATH /snap/bin

if status is-interactive
  startship init fish | source
end
