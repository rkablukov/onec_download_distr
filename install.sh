#!/bin/bash

# распаковываем архив
rm -r server64 && mkdir server64 && tar xzvf dist/server64.tar.gz -C server64

# устанавливаем сервер 1с
dpkg -i server64/1c*.deb

# стартуем сервер
service srv1cv83 start