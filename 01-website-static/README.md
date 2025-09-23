# Задание-1. Создать статический сайт в Object Storage

## Описание окружения <a id="environment"/></a>

1. Для вас развёрнуто рабочее окружение в Yandex Cloud:
* [Облако](https://yandex.cloud/ru/docs/resource-manager/concepts/resources-hierarchy#cloud) `scale-N`
* [Каталог ресурсов](https://yandex.cloud/ru/docs/resource-manager/concepts/resources-hierarchy#folder) `default`

2. Доступ к облаку и каталогу будет предоставлен с помощью аутентификации через федерацию удостоверений. 
Учетные данные для аутентификации - имя пользователя вида `scale<N>` (где N - ID пользователя) и пароль пользователя будут предоставлены через бот.

## Задание <a id="task"/></a>

1. Получить доступ к своему рабочему окружению с помощью [консоли управления](https://yandex.cloud/docs/console), используя полученные учетные данные. 

2. [Создать новый бакет](https://yandex.cloud/docs/storage/operations/buckets/create) в сервисе [Object Storage](https://yandex.cloud/docs/storage) с любым именем. Помните, что имя бакета должно быть уникально в границах всего Object Storage! Длина имени бакета не должна быть короче 8 символов.

3. Подготовить в любом текстовом редакторе файл [index.html](./index.html) вида:
    ```html
    <html><body>Privet Scale!<br><br></body></html>
    ```

4. [Загрузить в бакет](https://yandex.cloud/docs/storage/operations/objects/upload) файл `index.html`.

5. Настроить в бакете [работу Web сайта](https://yandex.cloud/ru/docs/storage/operations/hosting/setup).


## Проверка результатов <a id="check"/></a>

Для проверки задания необходимо выполнить команду:

```bash
curl https://<bucket-name>.website.yandexcloud.net
```

или открыть соответствующий URL в веб-браузере.

Критерий успеха - это получение строки `Privet Scale` или любой другой строки, которую вы ранее добавили в файл `index.html`, при обращении по соответствующему URL.

После этого можно отправить задание на проверку нажав кнопку в боте.
