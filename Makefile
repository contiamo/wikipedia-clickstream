.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

.PHONY: help
help: ## print this help info
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

.PHONY: build-docker
build-docker: ## build Editor docker image
	docker build -t wikipedia-clickstream:latest -f Dockerfile .

.PHONY: push-docker
push-docker: ## push image to Staging
	docker tag wikipedia-clickstream:latest eu.gcr.io/staging-205711/wikipedia-clickstream:latest
	docker push eu.gcr.io/staging-205711/wikipedia-clickstream:latest

.PHONY: download-data
download-data: ## download data required for functions
	aws s3 cp s3://contiamo-datascience/wikipedia-clickstream/processed/curr.parquet data/processed/
	aws s3 cp s3://contiamo-datascience/wikipedia-clickstream/processed/prev.parquet data/processed/

.PHONY: cp-data
cp-data: ## copy data from data folder to common folder
	cp data/processed/curr.parquet common/
	cp data/processed/prev.parquet common/
