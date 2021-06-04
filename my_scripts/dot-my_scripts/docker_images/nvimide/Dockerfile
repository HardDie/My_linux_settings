# docker build -t my/nvimide .

FROM archlinux:latest

RUN pacman --cachedir /tmp -Sy --noconfirm neovim git go gcc tmux zsh && \
	rm -rf /tmp/*

RUN useradd -u 1000 -r -s /usr/bin/zsh -m -g users vim-go
WORKDIR /home/vim-go
USER vim-go

# Install vim-plug
RUN sh -c 'curl -fLo /home/vim-go/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins
RUN mkdir -p /home/vim-go/.vim/plugged && \
	cd /home/vim-go/.vim/plugged && \
	git clone https://github.com/fatih/vim-go && \
	git clone https://github.com/buoto/gotests-vim && \
	git clone https://github.com/preservim/nerdtree && \
	git clone https://github.com/tpope/vim-commentary

# Create nvim config
COPY --chown=vim-go:users init.vim /home/vim-go/.config/nvim/init.vim

# Install vim-go, gotests-vim, nerdtree
RUN nvim +PlugInstall +qall

# Info
RUN echo -e "echo 'At first start run: \
nvim +GoUpdateBinaries +qall && go get github.com/cweill/gotests/...'\n\
export PATH=/home/vim-go/go/bin:$PATH" >> /home/vim-go/.bashrc

ENTRYPOINT [ "zsh" ]
