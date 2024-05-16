.PHONY: environment prettier lint flush up down restart logs shell delete-dsstore upgrades deploy help synco-server synco-import synco-import-resources synco-import-db

## Output envirmnent information
environment:
	@ddev version
	@echo "${GREEN}mkcert${RESET} version ${YELLOW}$$(mkcert -version)${RESET}"
	@ddev exec composer --version
	@echo "${GREEN}Node (ddev)${RESET} version ${YELLOW}$$(ddev exec node --version)${RESET}"
	@echo "${GREEN}Node (local)${RESET} version ${YELLOW}$$(node --version)${RESET}"

## Prettier files
prettier:
	@pnpm prettier --write --no-error-on-unmatched-pattern 'DistributionPackages/**/*.{js,ts,mjs,mts,php,yaml,pcss,md}'

## Lint files
lint:
	@pnpm eslint DistributionPackages/**/*.{ts,mts}
	@ddev composer lint

## Flush cache
flush:
	@make delete-dsstore
	@ddev composer flush

## Start the development server
up:
	@ddev start

## Stop the development server
down:
	@ddev stop --unlist

## Restart the development server
restart:
	@ddev restart

## Show logs from the development server
logs:
	@ddev logs -f

## Start a shell on the development server
shell:
	@ddev ssh

## Delete all .DS_Store files in DistributionPackages
delete-dsstore:
	@cd DistributionPackages && find . -name '.DS_Store' -type f -delete
	@cd Packages && find . -name '.DS_Store' -type f -delete

## Deploy website
deploy:
	gh workflow run deploy.yaml
	@sleep 5
	gh run watch

## Commit Upgrades
upgrades:
	git add *.lock package.json pnpm-lock.yaml
	git commit -m "Upgrade: Update packages"
	git push

## Start Synco server
synco-server:
	curl https://sandstorm.github.io/synco/serve | sh -s -

## Import data from Synco
synco-import: synco-import-db synco-import-resources

## Import resources from Synco
synco-import-resources:
	ddev exec mkdir -pv ./Data/Persistent/Resources
	ddev import-files --source=dump/Resources --target=../Data/Persistent/Resources
	ddev flow resource:publish

## Import database from Synco
synco-import-db:
	ddev exec mkdir -pv ./Data/Logs
	ddev import-db --file=dump/dbDump.sql
	ddev flow doctrine:migrate
	ddev flow flow:package:rescan
	ddev flow domain:deleteall
	ddev flow startup:init
	pnpm dev


# Define colors
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

# define indention for descriptions
TARGET_MAX_CHAR_NUM=22

help:
	@echo ''
	@echo '${GREEN}CLI command list:${RESET}'
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	@echo ''

.DEFAULT_GOAL := help
