# Copy your .vimrc file and put near Dockerfile befor installation
# docker build -t my/vim-go .
#
# vim-go() {
# 	docker run --rm -it \
# 		--detach-keys="ctrl-@" \
# 		--name vim-go \
# 		my/vim-go
# }

FROM archlinux:latest

RUN sed 's/^#//g' /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist && \
	pacman -Syyu --noconfirm vim git go gcc yarn && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/sync/* && \
	rm -rf /var/cache/pacman/pkg/*

RUN useradd -u 1000 -r -s /bin/bash -m -g users vim-go
WORKDIR /home/vim-go

# Copy vim config
COPY vimrc /home/vim-go/vimrc
RUN chown vim-go:users /home/vim-go/vimrc

USER vim-go

# Install vim-plug
RUN curl -fLo /home/vim-go/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim-go
RUN echo "call plug#begin('~/.vim/plugged')" > /home/vim-go/.vimrc && \
    echo "Plug 'fatih/vim-go'" >> /home/vim-go/.vimrc && \
    echo "call plug#end()" >> /home/vim-go/.vimrc

RUN echo "export GOBIN=/home/vim-go/go/bin" >> /home/vim-go/.bashrc && \
    echo "export PATH=\$PATH:\$GOBIN" >> /home/vim-go/.bashrc

RUN vim +PlugInstall +qall && \
    vim +GoInstallBinaries +qall

# Move config
RUN mv /home/vim-go/vimrc /home/vim-go/.vimrc

# Install Conquer of Completion neovim
RUN echo >> /home/vim-go/.vimrc && \
    echo "call plug#begin('~/.vim/plugged')" >> /home/vim-go/.vimrc && \
    echo "Plug 'fatih/vim-go'" >> /home/vim-go/.vimrc && \
    echo "Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}" >> /home/vim-go/.vimrc && \
    echo "call plug#end()" >> /home/vim-go/.vimrc

RUN vim +PlugInstall +qall && \
    vim +PlugInstall +qall

RUN echo "{" > /home/vim-go/.vim/coc-settings.json && \
    echo "  \"languageserver\": {" >> /home/vim-go/.vim/coc-settings.json && \
    echo "    \"go\": {" >> /home/vim-go/.vim/coc-settings.json && \
    echo "      \"command\": \"gopls\"," >> /home/vim-go/.vim/coc-settings.json && \
    echo "      \"rootPatterns\": [\"go.mod\"]," >> /home/vim-go/.vim/coc-settings.json && \
    echo "      \"filetypes\": [\"go\"]" >> /home/vim-go/.vim/coc-settings.json && \
    echo "    }" >> /home/vim-go/.vim/coc-settings.json && \
    echo "  }" >> /home/vim-go/.vim/coc-settings.json && \
    echo "}"

USER root
RUN chown -R vim-go:users /home/vim-go/go
USER vim-go

ENTRYPOINT [ "bash" ]
