ERL          ?= erl
EBIN_DIRS    := $(wildcard deps/*/ebin)
APP          := stickyNotes


all: erl ebin/$(APP).app

erl: 
	mkdir ebin
	@$(ERL) -pa $(EBIN_DIRS) -noinput +B \
	  -eval 'case make:all() of up_to_date -> halt(0); error -> halt(1) end.'

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

clean: 
	@echo "removing:"
	@rm -rfv ebin

ebin/$(APP).app: src/$(APP).app
	@cp -v src/$(APP).app $@
