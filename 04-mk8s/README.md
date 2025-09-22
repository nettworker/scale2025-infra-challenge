# Задание-4. Починить приложение в кластере Managed Kubernetes (MK8S)

## Описание окружения <a id="environment"/></a>

1. Для вас развёрнуто рабочее окружение в кластере [Managed Service for Kubernetes ](https://yandex.cloud/docs/managed-kubernetes). В кластере будет развернуто тестовое приложение с ресурсами только в одной [зоне доступности ru-central1-a]((https://yandex.cloud/ru/docs/overview/concepts/geo-scope)).

2. При развертывании приложения будет сэмулирован комплексный отказ с помощью инструмента `chaos-mesh`.

## Настройка рабочего окружения <a id="deploy"/></a>

Для того чтобы настроить рабочее окружение необходимо выполнить команду:
```bash
curl -X POST https://functions.yandexcloud.net/d4ee1u5iuldj4nv5mlue \
  -H 'Content-Type: application/json' \
  -d '{"email": "your-email@yandex.ru"}'
```

## Задание <a id="task"/></a>

Вам необходимо добиться того, чтобы приложение стало доступным и отказоустойчивым.


## Проверка результатов <a id="check"/></a>

Для проверки задания необходимо выполнить команду:
```bash
curl -X POST https://functions.yandexcloud.net/d4et4e8moqcq4ngd7d14 -H 'Content-Type: application/json' -d '{"namespace": "your-namespace"}'
```

Критерий успеха - это получение следующего сообщения при выполнении команды проверки задания:

`Поздравляю, вы успешно справились с заданием! Все pods и deployments в namespace {namespace} работают корректно. Успешных проверок: 5/5`.

После этого можно отправить задание на проверку с помощью бота следующим образом:

```
/check 4 name-of-your-namespace
```
