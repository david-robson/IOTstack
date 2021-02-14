
#!/bin/bash

# IOTstack build installer
# Build: 2021-02-14T09-18-39
# API Version: 0.0.1

# This script is automatically generated during build time
# To be executed at install time.

FROM_NET="false"
PREREQ_CHECK="true"
OVERWRITE_EXISTING_ASK="true"
CLEAN_CURRENT="false"
DISPLAY_WARNINGS="true"
BAD_OPTION_TRIGGER="false"

# Process input args
while test $# -gt 0
do
	case "$1" in
    --from-net) FROM_NET="true"
			;;
    --no-check) PREREQ_CHECK="false"
      ;;
    --overwrite) OVERWRITE_EXISTING_ASK="false"
      ;;
    --clean-current) CLEAN_CURRENT="true"
      ;;
    --no-warnings) DISPLAY_WARNINGS="false"
      ;;
		--*) echo "bad option $1" && BAD_OPTION_TRIGGER="true"
			;;
	esac
	shift
done

if [[ $BAD_OPTION_TRIGGER == "true" ]]; then
  if [[ $DISPLAY_WARNINGS == "true" ]]; then
    echo "Bad option detected."
    read -n 1 -t 5 -s -r -p "Press any key within 5 seconds to cancel build and exit " READIN
    if [[ ! -z "$READIN" ]]; then
      echo ""
      echo "Exiting..."
      exit 0
    fi
  else
    # Automatically exit if bad option detected and warnings are disabled.
    exit 1
  fi
fi

if [[ ! -f ./menu.sh ]]; then
  echo "Couldn't detect menu.sh file for IOTstack. Ensure you are in the correct directory:"
  pwd
  exit 2
fi

#### Prebuild service scripts

# Prebuild Service script:
# Injected by: gitea
# Comment: Create required service directory exists for first launch

mkdir -p ./volumes/gitea/data


# End script (gitea)

#### End prebuild service scripts


# Merge docker-compose and docker-compose-overrides


#### Postbuild service scripts

# Postbuild Service script:
# Injected by: gitea
# Comment: Ensure required service directory exists for launch

if [[ ! -d ./volumes/gitea/data ]]; then
  echo "Gitea data directory is missing!"
  sleep 2
fi


# End script (gitea)

#### End postbuild service scripts

cp docker-compose-base.yml docker-compose.yml

echo "Setup complete. You can start the stack with: "
echo "  docker-compose up"
echo "or"
echo "  docker-compose up -d"

