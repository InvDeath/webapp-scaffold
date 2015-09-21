##! make

PROJECTNAME = bankrot

tmux:
	mkdir -p ~/.tmuxinator && cp tmuxinator.yml ~/.tmuxinator/$(PROJECTNAME).yml
	mux start $(PROJECTNAME)
