.PHONY: all start stop

DNS_SERVER ?= 192.168.1.20
TZ ?= Europe/Berlin
UID ?= 1034 #docker_user
GID ?= 65538 #docker_group

start/%:
	@echo "Starting service $*"
	@mkdir -p .tmp
	@cat $*/$*-compose.yaml \
		| sed -e 's|#{DNS_SERVER}|${DNS_SERVER}|g' \
		| sed -e 's|#{TZ}|${TZ}|g' \
		| sed -e 's|#{UID}|${UID}|g' \
		| sed -e 's|#{GID}|${GID}|g' \
		> .tmp/.$*-compose.yml

stop/%:
	@docker-compose -f .temp/$*-compose.yml up -d
