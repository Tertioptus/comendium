INSTALL_DIR=~/.local/bin/compendium
SOURCE_DIR=scripts/xp*.sh

all:
	@echo "Please run 'make install'"

install:
	@echo ""
	@echo "Installing xp"

	mkdir -p $(INSTALL_DIR)
	cp $(SOURCE_DIR) $(INSTALL_DIR)
	
	echo "# compendium             #" >> ~/.bashrc
	
	echo "alias xp=\". $(INSTALL_DIR)/xp.sh\"" >> ~/.bashrc

	echo "# compendium END #" >> ~/.bashrc
	
	exec bash
	@echo ''
	@echo 'USAGE:'
	@echo '------'

reinstall:
	make uninstall --no-print-directory
	make install --no-print-directory

uninstall:
	@echo ""
	@echo 'Uninstalling xp'
	rm -rf $(INSTALL_DIR)
	sed -i '/compendium/ d' ~/.bashrc

install-dev:
	@echo ""
	@echo "Installing development xp"

	echo "# compendium             #" >> ~/.bashrc
	
	echo "alias xp=\". $(PWD)/scripts/xp.sh\"" >> ~/.bashrc

	echo "# compendium END #" >> ~/.bashrc
	
	exec bash
	@echo ''
	@echo 'USAGE:'
	@echo '------'
	

.PHONY: all install
