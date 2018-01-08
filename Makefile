VENV_DIR ?= .venv
VENV_RUN = . $(VENV_DIR)/bin/activate

usage:             ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

install:           ## Install dependencies in virtualenv
	@(test `which virtualenv` || pip install --user virtualenv) && \
		(test -e $(VENV_DIR) || virtualenv $(VENV_DIR)) && \
		($(VENV_RUN); pip3 install -r requirements.txt)

run:               ## Run the presentation in a local Web server
	$(VENV_RUN); hovercraft slides.rst

.PHONY: usage install run
