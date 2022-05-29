set -x PATH $PATH /snap/bin

if status is-interactive
  starship init fish | source
end
