FROM archlinux:latest

RUN pacman --cachedir /tmp -Sy --noconfirm neovim git go gcc && \
	rm -rf /tmp/*

RUN useradd -u 1000 -r -s /bin/bash -m -g users vim-go
WORKDIR /home/vim-go
USER vim-go

# Install vim-plug
RUN sh -c 'curl -fLo /home/vim-go/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create nvim config
COPY --chown=vim-go:users init.vim /home/vim-go/.config/nvim/init.vim

# Install vim-go, gotests-vim
RUN nvim +PlugInstall +qall

# Info
RUN echo -e "echo 'At first start run: \
nvim +GoUpdateBinaries +qall && go get github.com/cweill/gotests/...'\n\
export PATH=/home/vim-go/go/bin:$PATH" >> /home/vim-go/.bashrc

ENTRYPOINT [ "bash" ]
