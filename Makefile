##! make

PROJECTNAME = bankrot

.PHONY: all
all:
	@echo $(PROJECTNAME)

tmux:
	mkdir -p ~/.tmuxinator && cp tmuxinator.yml ~/.tmuxinator/$(PROJECTNAME).yml
	mux start $(PROJECTNAME)

build:
	sudo docker-compose build
