#!/bin/bash

service_exists() {
    local n=$1
    if [[ $(systemctl list-units --all -t service --full --no-legend "$n.service" | cut -f1 -d' ') == $n.service ]]; then
        return 0
    else
        return 1
    fi
}

# останавливаем сервер 1с
if service_exists srv1cv83; then
    service srv1cv83 stop
fi

# распаковываем архив
if [ -d server64 ]; then
    rm -r server64/*
else
    mkdir server64
fi
tar xzvf dist/server64.tar.gz -C server64

# устанавливаем сервер 1с
dpkg -i server64/1c*.deb

# стартуем сервер 1с
service srv1cv83 start