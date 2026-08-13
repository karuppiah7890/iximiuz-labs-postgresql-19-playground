FROM ghcr.io/iximiuz/labs/rootfs:ubuntu-24-04

WORKDIR /home/laborant

RUN sudo apt update \
    && sudo apt install -y make pkg-config gcc flex bison libedit-dev libedit2 libreadline-dev perl libperl-dev tcl zlib1g-dev libicu-dev gettext python3 python3-pip python3-venv python3-dev libpython3-dev libpython3.12 docbook-xml docbook-xsl libxml2-utils xsltproc fop

RUN wget https://ftp.postgresql.org/pub/source/v19beta2/postgresql-19beta2.tar.gz

RUN tar -xvzf postgresql-19beta2.tar.gz

WORKDIR /home/laborant/postgresql-19beta2

RUN ./configure

RUN make world

RUN make check

RUN sudo make install-world

RUN sudo adduser postgres

RUN sudo mkdir -p /usr/local/pgsql/data

RUN sudo chown postgres /usr/local/pgsql/data

RUN echo 'export PATH="$PATH:/usr/local/pgsql/bin/"' | sudo tee -a /home/laborant/.bashrc && echo 'export PATH="$PATH:/usr/local/pgsql/bin/"' | sudo tee -a /home/postgres/.bashrc && echo 'export PATH="$PATH:/usr/local/pgsql/bin/"' | sudo tee -a /root/.bashrc

WORKDIR /home/laborant

RUN { echo "Welcome to iximiuz Labs' PostgreSQL 19 Playground! 🚀\n"; \
      echo "Run \`psql -U postgres\` to connect to the PostgreSQL server\n"; \
      echo "This is also a Ubuntu Playground! Details below!\n"; \
      cat $HOME/.welcome; \
    } > $HOME/.new_welcome && mv $HOME/.new_welcome $HOME/.welcome
