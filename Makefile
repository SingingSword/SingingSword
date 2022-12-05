ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Inspired by https://github.com/rbogle/example_api_lambda_powertools/blob/main/Makefile

# this will list all the targets in this makefile by default or by make list
# putting a '## comment on a target line will add a description to output
.DEFAUL_GOAL := list
.PHONY: list

# Vars
NOW := $(shell date +"%Y-%m-%d %H:%M:%S")

# Targets
list: ## -- list all the targets in this file with a description
	@ grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' Makefile \
	|  sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1\3/p' 

clean: ## -- empty the output directory
	@ echo "Cleaning the public directory"
	@ if [ -d docs ]; then rm -rf docs; mkdir docs; else mkdir docs; fi
	@ if [ -d SingingSword/public ]; then rm -rf SingingSword/public; ln -s ../docs SingingSword/public; fi
.PHONY: clean

generate: ## -- generate the site locally
	@ echo "Generating the site locally"
	@ cd SingingSword && hugo
.PHONY: generate

serve: ## -- serve the site locally
	@ echo "Serving the site locally, interrupt with ctrl-c"
	@ cd SingingSword && hugo serve -D
.PHONY: serve

publish: ## -- publish to the website
	@ git add .; git commit -m "issue $(now)"; git push -u origin main
 
