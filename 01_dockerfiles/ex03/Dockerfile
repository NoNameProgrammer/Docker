FROM ubuntu

ARG CHAR_IP=localhost

RUN apt-get update && apt-get upgrade -y && \
apt-get install -y wget \
openssh-server \
ca-certificates \
postfix -y
RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && \
bash script.deb.sh && \
apt-get install -y gitlab-ce
RUN mkdir -p /etc/gitlab/ssl && \
chmod 700 /etc/gitlab/ssl && \
openssl req -new -x509 -nodes -newkey rsa:2048 -days 365 -subj /CN=${CHAR_IP} \
    -keyout /etc/gitlab/ssl/gitlab.key \
    -out /etc/gitlab/ssl/gitlab.crt && \
echo "external_url \"https://${CHAR_IP}\"" >> /etc/gitlab/gitlab.rb && \
echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb && \
echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.crt\"" >> /etc/gitlab/gitlab.rb && \
echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.key\"" >> /etc/gitlab/gitlab.rb && \
echo "gitlab_rails['gitlab_shell_ssh_port'] = 22" >> /etc/gitlab/gitlab.rb

ENTRYPOINT service ssh start && (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && gitlab-ctl tail

EXPOSE 22 80 443

#docker build --build-arg CHAR_IP=$(docker-machine ip Char) -t ex03 .
#docker run -it -p 80:80 -p 443:443 -p 2222:22 --privileged ex03

#ssh-keygen -t ed25519 -C 'egiles@student.21-school.ru' -f ~/.ssh/id_ed25519 
#pbcopy < ~/.ssh/id_ed25519.pub
#ssh -T git@$(docker-machine ip Char) -p 2222
#env GIT_SSH_COMMAND='ssh -i id_ed25519 -p 2222' git clone git@$(docker-machine ip Char):/root/qwe.git
#env GIT_SSH_COMMAND='ssh -i id_ed25519 -p 2222' git push origin
