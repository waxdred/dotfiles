function gcl
    if test (count $argv) -lt 2
        echo "Usage: gcl <host> <repo>"
        return 1
    end

    set host $argv[1]
    set repo $argv[2]
    # Clone le dépôt avec la configuration correcte
    git clone "git@$host:$repo"
end

function git-profile
  if test -z $argv 
    echo "Usage: git-profile <profile-name>"
    echo "Available profiles:"
    yq '.profiles | keys' $GITPROFILE_CONFIG
    return 1
  end
  set profile $argv[1]
  set user (yq ".profiles.$profile.user" $GITPROFILE_CONFIG)
  set email (yq ".profiles.$profile.email" $GITPROFILE_CONFIG)

  if test -z $user
    echo "Profile $profile not found"
    return 1
  end
  git config --global user.name $user
  git config --global user.email $email
  echo "Profile $profile set as user.name=$user and user.email=$email"
end
