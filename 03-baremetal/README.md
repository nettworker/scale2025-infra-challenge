# Задание-3. Развернуть сервер NGINX на BareMetal

## Описание окружения <a id="environment"/></a>

1. Для вас развёрнуто рабочее окружение в Yandex Cloud:
* [Облако](https://yandex.cloud/ru/docs/resource-manager/concepts/resources-hierarchy#cloud) `scaleN`
* [Каталог ресурсов](https://yandex.cloud/ru/docs/resource-manager/concepts/resources-hierarchy#folder) `default`
* [Сервер BareMetal](https://yandex.cloud/docs/baremetal) в каталоге ресурсов
* [Секрет Lockbox](https://yandex.cloud/ru/docs/lockbox/concepts/secret) для доступа через консоль к серверу Baremetal

2. Доступ к облаку и каталогу будет предоставлен с помощью аутентификации через федерацию удостоверений. 
Учетные данные для аутентификации - имя пользователя вида `scaleN` и пароль будут предоставлены через бот.

## Задание <a id="task"/></a>

1. Получить доступ к своему рабочему окружению с помощью [консоли управления](https://yandex.cloud/docs/console), используя полученные учетные данные. 

2. [Получить информацию о пароле администратора](https://yandex.cloud/ru/docs/lockbox/operations/secret-get-info) из секрета в сервисе Lockbox.

3. [Подключиться через KVM к консоли сервера](https://yandex.cloud/ru/docs/baremetal/operations/servers/server-kvm) под пользователем `root` и паролем из секрета в Lockbox.

4. Установить на сервер ПО веб-сервера `nginx`

5. Настроить веб-сервер `nginx` следующим образом:
  * отвечать на запросы по протоколу `http` на порту `8080`
  * выдавать в ответе имя сервера (совпадающее с выводом команды `hostname`)


## Проверка результатов <a id="check"/></a>

Для проверки задания необходимо выполнить команду:

```bash
curl http://<публичный-ip-сервера>:8080
```

или открыть соответствующий URL в веб-браузере.

Критерий успеха - это получение в ответе сервера строки с его именем (`hostname`).

После этого можно отправить задание на проверку нажав кнопку в боте.
