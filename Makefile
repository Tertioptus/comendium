INSTALL_DIR=~/.local/bin/compendium
SOURCE_DIR=scripts/xp*.sh

all:
	@echo "Please run 'make install'"

install:
	@echo ""
	mkdir -p $(INSTALL_DIR)
	cp $(SOURCE_DIR) $(INSTALL_DIR)
	
	echo "# compendium             #" >> ~/.bashrc
	
	echo "alias xp=\". $(INSTALL_DIR)/xp.sh\"" >> ~/.bashrc

	echo "# compendium END #" >> ~/.bashrc
	
	exec bash
	@echo ''
	@echo 'USAGE:'
	@echo '------'

uninstall:
	rm -rf $(INSTALL_DIR)
	sed -i '/compendium/ d' ~/.bashrc

.PHONY: all install
