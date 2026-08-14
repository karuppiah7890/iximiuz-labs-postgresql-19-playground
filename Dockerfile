FROM ghcr.io/iximiuz/labs/rootfs:ubuntu-24-04

WORKDIR /home/laborant

RUN sudo apt update \
    && sudo apt install -y postgresql-common \
    && sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y \
    && sudo apt update \
    && echo 'Types: deb\
URIs: https://apt.postgresql.org/pub/repos/apt\
Suites: resolute-pgdg\
Components: main 19\
Architectures: amd64\
Signed-By: /usr/share/postgresql-common/pgdg/apt.postgresql.org.gpg' > /etc/apt/sources.list.d/pgdg.sources \
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
