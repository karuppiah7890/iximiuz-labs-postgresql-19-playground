FROM ghcr.io/iximiuz/labs/rootfs:ubuntu-26-04

WORKDIR /home/laborant

RUN sudo apt update \
    && sudo apt install -y postgresql-common \
    && sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y \
    && sudo apt update \
    && echo 'Types: deb\n\
URIs: https://apt.postgresql.org/pub/repos/apt\n\
Suites: resolute-pgdg\n\
Components: main 19\n\
Architectures: amd64\n\
Signed-By: /usr/share/postgresql-common/pgdg/apt.postgresql.org.gpg' | sudo tee /etc/apt/sources.list.d/pgdg.sources \
    && sudo apt update \
    && sudo apt install -y postgresql-19 \
    && sudo systemctl enable postgresql

RUN echo 'export PATH="$PATH:/usr/lib/postgresql/19/bin/"' | sudo tee -a /home/laborant/.bashrc \
    && echo 'export PATH="$PATH:/usr/lib/postgresql/19/bin/"' | sudo tee -a /root/.bashrc

RUN { echo "Welcome to iximiuz Labs' PostgreSQL 19 Playground! 🚀\n"; \
      echo "Run \`sudo -u postgres psql\` to connect to the PostgreSQL server\n"; \
      echo "This is also a Ubuntu Playground! Details below!\n"; \
      cat $HOME/.welcome; \
    } > $HOME/.new_welcome && mv $HOME/.new_welcome $HOME/.welcome
