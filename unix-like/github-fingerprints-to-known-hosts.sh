#!/usr/bin/env bash
# Add GitHub's SSH key fingerprints to known_hosts
# Worst-case if these expire then you'll get asked the next time you pull from GitHub, at which time the new key will be added to known_hosts.
# 
# $ source <(curl -s https://raw.githubusercontent.com/ChrisSimmons/scripts/main/unix-like/github-fingerprints-to-known-hosts.sh)

KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"

touch $KNOWN_HOSTS_FILE

# Adapted from:
# https://serverfault.com/a/971922
add_fingerprint () {
  if ! grep "$1" $KNOWN_HOSTS_FILE > /dev/null
  then
      echo "$1" >> $KNOWN_HOSTS_FILE
  else
    echo "Fingerprint already known: $1"
  fi
}

echo "Adding GitHub fingerprints to known_hosts ..."

# These were pulled on 2024-03-30 from:
# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints

add_fingerprint "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"
add_fingerprint "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
add_fingerprint "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk="
