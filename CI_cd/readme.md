## Настройка gitlab-runner

<details>
<summary> Описание шагов по настройке  </summary> 
 
##### 1. Поднять виртуальную машину *Ubuntu Server 22.04 LTS*.
##### 2. Скачай и установи на виртуальную машину *gitlab-runner*.  

<details>
<summary>  удаленное соединение  </summary>
 
Орагнизовать удаленное соединение: доступ в терминал виртуалки с хоста или любой другой виртуальной машины с интерфейсом, что бы вручную не вписывать команды регистарции и установки *gitlab-runner*  
-  в настройках виртуальной машины выбрать адптер сетевой мост.   
`ip a` - запросить адрес, по этому адресу пропинговать с другой машины пинг должен проходить, или с хоста так же проходит пинг

> Включить терминал можно комбинацией `Ctr+Alt+T`

 - проверим что `ssh` работает - `sudo systemctl status sshd`  
 - если не работет включить - `sudo apt-get install ssh` -  раскомитить 22 порт в файле `/etc/ssh/sshd_config`   
-  подключаться с удаленной машины командой - `ssh <username>@<ipname>` - ввесить пароль при запросе   
- установить `gitlab runner` *https://docs.gitlab.com/runner/install/linux-repository/*     

> `gitlab-runner status` - Проверяет статус работающего сервиса GitLab Runner.
> для выхода из удаленного соединения в возврата на хост в консоли пишем exit 


</details>

##### 3. Запусти gitlab-runner и зарегистрируй его для использования в текущем проекте (DO6_CICD).

Для регистрации понадобятся `URL` и токен

<details>
<summary>  Регистрация GitLab Runner: </summary>

1. Запустите команду `gitlab-runner register`  
2. Введите `URL` вашего `GitLab` экземпляра  
3. Введите токен регистрации, который вы скопировали ранее
  -- дальше просто ентер ничего не задавала
5. Придумайте описание для вашего Runner'а. Это может быть что-то вроде "Linux Runner for project X".   
6. Введите теги для Runner'а (через запятую), если нужно. Теги используются для привязки Runner'а к конкретным задачам в вашем CI/CD. пример `tags: [bash]`     
7. Можно добавить примечание по обслуживанию. Например, указать характеристики сервера. 
8. Выберите тип executor'а. Самые распространенные варианты:  
*shell:* Задачи выполняются непосредственно на сервере, где установлен Runner.  (выбрала этот вариант)  
*docker:* Задачи выполняются в Docker контейнерах. 
Если выбрали docker, нужно будет указать образ, например, alpine. 

</details>

<details>
<summary> в картинках </summary>

![Настройка сети вируальной машины ](image/VM_network.png "Настройка сети вируальной машины ")  
  
![установка ssh при установке убунту](image/install_openSSH.png "установка ssh при установке убунту")  
  
![Возможные ошибки при запуске службы sshd](image/Error_sshd.png "Возможные ошибки при запуске службы sshd")  
  
![проверка статуса службы sshd](image/status_sshd.png "проверка статуса службы sshd")  
  
![результат подключения через sshd](image/ssh_doing_result.png "результат подключения через sshd")  
  
![установка gitlab-runner](image/install_gitlab_runner.png "установка gitlab-runner")  
  
![регистрация gitlab-runner](image/runner_register.png.png "регистрация gitlab-runner")  



</details>


<details>
<summary> комнды gitlab-runner </summary>
 
```bash
sudo systemctl status gitlab-runner  # проверка статуса
 
gitlab-runner run # Запуск всех раннеров

gitlab-runner list # Список раннеров  

gitlab-runner verify # Проверка раннеров

gitlab-runner unregister --all-runners # Удаление всех раннеров

gitlab-runner unregister --name ${name_runner} # Удаление конкретного раннера

vim /etc/gitlab-runner/config.toml # Файл с конфигурациями раннеров  
```

</details>


</details>

##  Сборка


<details>
<summary> Описание шагов по сборке  </summary> 
 
Напиши этап для CI по сборке приложения из папки*code-samples*DO.
В файле `.gitlab-ci.yml` добавь этап запуска сборки через мейк файл из папки *code-samples*.
Файлы, полученные после сборки (артефакты), сохрани в произвольную директорию со сроком хранения 30 дней.

<details>
<summary> ТЕОРИЯ </summary>
 
Скрипт *CI* пишется на *YAML*. `.gitlab-ci.yml` - это единственный файл, который лежит непосредственно в корне проекта. В любых других папках *GitLab* его просто не прочитает, соответственно пайплайн работать не будет.  

Для отладки и для понимания пайплайна можно использовать средство, встроенное в саму оболочку `GitLab: Build -> Pipeline Editor`.  

> Перейдем в Pipeline editor, выберем ветку develop, и нажмем кнопку Configure pipeline. Мы попадем в окно визуального редактора. По идее, команды можно писать в файле .gitlab-ci.yml напрямую. Преимущества визуального редактора – он хорошо подсвечивает ошибки в yaml синтаксисе, и иногда дает базовые подсказки. В остальном – дело вкуса.  

Для визуальной и логической компоновки ваших Jobs, здесь есть так называемые стадии -stages. Не более чем группировка. В процессе работы pipeline – можно будет смотреть, какая стадия и какая jobs в ней выполняется.  

Руководство по разработке шаблонов GitLab CI/CD (устарело)
https://docs.gitlab.com/ee/development/cicd/templates.html

</details>

<details>
<summary> простой yaml после которого pipeline - passed  </summary>

```yaml
stages:
  - build

build_job:
  stage: build
  script:
    - echo "Running."
```

![УСпешно выполненный пайплайн ](image/Pipline_OK.png "УСпешно выполненное пйплайна ")  
![УСпешно выполненное задание ](image/Jobs_OK2.png "УСпешно выполненное задание ")  
![УСпешно выполненное задание ](image/Jobs_OK.png "УСпешно выполненное задание ")  
</details>

Что бы выполнялись пйплайны с make надо на машину где работает раннер  установить gcc `sudo apt -y install build-essential`

<details>
<summary> простой yaml сгеренированй AI  </summary>

<details>
<summary> результат работы </summary>

![результат работы пйплайна ](image/Jobs_artifacts.png "результат работы пйплайна")  
![сохраненные артифакты ](image/artifacts.png "сохраненные артифакты ")  

</details>

Чтобы добавить в `.gitlab-ci.yml` этап запуска сборки через make из папки *code-samples*, нужно добавить новый этап и задание в файл `.gitlab-ci.yml`, указав команду `make` внутри соответствующей директории, например, так:   
```yaml
default:
   # tags: [bash] #нужно будет только если при регистрации ранера бали добавлены теги

stages:          
  - build

# Это задание(job) выполняется на этапе(stage) сборки(build),
# который выполняется первым.
build-job:       
  stage: build
  script:
    - mkdir -p my_artifacts # Создаем директорию для артефактов
    - cd code-samples/ && make && echo " ✅ build completed"
    - cd .. && cp code-samples/DO my_artifacts

  artifacts:
    paths:
      - my_artifacts/ # Или my_artifacts.zip
      - echo " ✅ artifacts saved"
    expire_in: 30 days # Устанавливаем срок хранения

```

Пояснения:
> **stages:** Определяет последовательность этапов конвейера. В данном случае есть только один этап — build.  
> **build_job:** Название вашего задания сборки.  
>  **stage: build:** Привязывает это задание к этапу build.   
>  **script:** Содержит список команд, которые будут выполнены.  
> **artifacts:** Это основная секция для управления артефактами в задании  
> **paths:** Указывает, какие файлы или директории нужно сохранить как артефакты. В примере мы сохраняем все из директории my_artifacts/  
> **expire_in:** 30 days: Устанавливает срок хранения артефакта в днях. Срок хранения по умолчанию равен 30 дням, но это явное указание делает настройку более понятной и защищает от случайных изменений в конфигурации GitLab  



</details>

</details>

##   Тест кодстайла

<details>
<summary> Описание шагов по настройке  кодстайла </summary> 

этап для CI, который запускает скрипт кодстайла (clang-format)  
Если кодстайл не прошел, то «зафейли» пайплайн  
В пайплайне отобрази вывод утилиты clang-format  

```bash
# Устанавливаем clang-format
sudo apt-get update && apt-get install -y clang-format 
```

<details>
<summary> добавляем в файл yaml проверку стиля </summary>
 
```yaml
style-job:
    stage: clang-format
    script:
        - cp materials/linters/.clang-format  code-samples/
        - clang-format -n --Werror --verbose code-samples/*.c
        - echo " ✅ style test completed"
    allow_failure: false
```
Если кодстайл не прошел, то "зафейлить" пайплайн
(Для этого нужно использовать флаг --Werror)
В пайплайне отобразить вывод утилиты clang-format (--verbose)

</details>

</details>

##   Интеграционные тесты

<details>
<summary> шаги по выполнению </summary>
 
Для проекта из папки *code-samples* напиши интеграционные тесты самостоятельно.  
Тесты должны вызывать собранное приложение для проверки его работоспособности на разных случаях.  
Запусти этот этап автоматически только при условии, если сборка и тест кодстайла прошли успешно.  
Если тесты не прошли, то «зафейли» пайплайн.  
> В пайплайне отобрази вывод, что интеграционные тесты успешно прошли / провалились.

 
<details>
<summary> добавляем в файл yaml проверку </summary>

 
```yaml
test-job:
    stage: test
    needs: ["build-job", "style-job"]
    script:
        - cd code-samples/
        - test=$(make test)                 
        - if [[ $(echo $test | grep -c 'FAIL') -ne 0 ]]; then echo " 💥 test FAIL" ; exit 1; else echo " ✅ run test completed"; fi
    allow_failure: false
```
Пояснения:
> в переменную `test` попадет весь вывод в консоли (проверить `echo $test`)
> `$(echo $test | grep -c 'FAIL')` - Флаг `-c` подавляет вывод и возвращает 1 - символ найден, и 0, если не найден  
> **Needs** используется для указания последовательности выполнения этапов. Пока не пройдет сборка и тест, этап тестирования не начнется   
> **Allow_failure:** false указываю для того, чтобы при ошибке пайплайн завершился и не перешел на следующий этап.

</details>

<details>
<summary> файл с тестом </summary>

 
```bash
#!/bin/bash

touch test.txt
echo "Bad number of arguments!" > test.txt
echo "Bad number!" >> test.txt
echo "Learning to Linux"  >> test.txt
echo "Learning to work with Network"  >> test.txt
echo "Learning to Monitoring"  >> test.txt
echo "Learning to extra Monitoring" >> test.txt
echo "Learning to Docker" >> test.txt
echo "Learning to CI/CD" >> test.txt
echo "Bad number!" >> test.txt

    ./DO > test1.txt
    ./DO 0 >> test1.txt
    ./DO 1 >> test1.txt
    ./DO 2 >> test1.txt
    ./DO 3 >> test1.txt
    ./DO 4 >> test1.txt
    ./DO 5 >> test1.txt
    ./DO 6 >> test1.txt
    ./DO bad >> test1.txt


    DIFF_RES="$(diff -s test.txt test1.txt )"
    if [ "$DIFF_RES" = "Files test.txt and test1.txt are identical" ]
    then
        echo "SUCCESS"
    else
        echo "FAIL"
    fi
    rm test.txt test1.txt


```

</details>

<details>
<summary> Вывод джобы </summary>

![вывод джобы с успешными тестами](image/test_job_Success.png "вывод джобы с успешными тестами")  
![вывод джобы с зафелиными тестами ](image/test_job_fail.png "вывод джобы с зафелиными тестами ")  

</details>

</details>


##  Этап деплоя

<details>
<summary> Описание этапа по деплою и настроке связи между 2 машинами </summary>

##### 1. Подними вторую виртуальную машину *Ubuntu Server 22.04 LTS*  
##### 2. Напиши этап для CD, который «разворачивает» проект на другой виртуальной машине  
##### 3. Запусти этот этап вручную при условии, что все предыдущие этапы прошли успешно.
##### 4. Напиши bash-скрипт, который при помощи `ssh` и `scp` копирует файлы, полученные после сборки (артефакты), в директорию `/usr/local/bin` второй виртуальной машины.  
> Тут тебе могут помочь знания, полученные в проекте *DO2_LinuxNetwork*  

<details>
<summary> Настройки сети на второй машине </summary>

 файл `etc/netplan/00-installer-config.yaml` создается если его нет, потом  `sudo netplan apply` - Перезапустить сетевой интерфес  и  проверка  адресов командой `ip a`  
![файл с настройками сети ](image/networt_deploy_machine.png "файл с настройками сети")  

```bash
# проверяем соединение по ssh
ssh d6@10.31.170.230
# попросить пароль от пользователя d6

```
</details>

<details>
<summary> орагнизовать соедение по ssh </summary>
Важное:  
> Обмен ssh ключами для копирования без пароля (https://internet-lab.ru/scp_ssh_nopass)  
 
`scp` (Secure CoPy) — утилита для безопасного копирования данных между `Linux`-системами по протоколу `SSH`. Она входит в состав `OpenSSH`, поэтому для работы с утилитой не нужно устанавливать дополнительное ПО  

```bash
# на севере под пользователем создаем пару ключей
ssh-keygen
# передаем открытый ключ машине на которую будем деплоить
scp ~/.ssh/id_rsa.pub d6@10.31.170.230:~/.ssh/authorized_keys
# на d6 в папке .ssh есть файл authorized_keys
ls .ssh
# проверяем соединение без пароля по команде должны подлючиться без запроса пароля пользователя
ssh d6@10.31.170.230
# так как все действия производятся под пользователем gitlab-runner
# то нам надо этот ключ передать этому пользователю
# копирование публичного ключа пользователю gitlab-runner
# копируем всю папку рекурсивно, т.е все файлы вней тоже скопированы
sudo cp -r /home/f6/.ssh/ /home/gitlab-runner/
# Кроме того пользователю надо выдать права доступа к этой папке
# права выдваем так же рекурсивно
sudo chown -R gitlab-runner /home/gitlab-runner/.ssh

```

</details>

<details>
<summary> bash-скрипт </summary>
GitLab Runner по умолчанию сохраняет кэшированные файлы в директории /home/gitlab-runner/cache/ в домашнем каталоге пользователя, который управляет Runner'ом, однако окончательное расположение зависит от конфигурации и используемого типа исполнителя (executor). Для определения точного пути необходимо проверить настройки вашего GitLab Runner'а, так как они могут быть изменены пользователем. 
Как узнать точное расположение:
Проверьте настройки Runner'а: В настройках вашего GitLab Runner'а может быть указан путь, отличный от стандартного.
Используйте командную строку: Зайдите на машину, где установлен GitLab Runner, и выполните команду, чтобы найти директорию с кэшем.
Обратитесь к документации: Если вы не уверены, обратитесь к документации GitLab для вашего типа исполнителя. 

 ```bash
#!/bin/bash

MACHINE=d6@10.31.170.230:/usr/local/bin
**
DIR=$(find /home/gitlab-runner/ -type d -name my_artifacts)

scp $DIR/* $MACHINE

```
на машине приемнике файла надо будет выдать права на папку /usr/local/bin
проверить права командой `ls -l /usr/local` 
выдать права командой `sudo chown -R d6 /usr/local/bin`

</details>

##### 5. В файле `.gitlab-ci.yml` добавь этап запуска написанного скрипта.


<details>
<summary> yaml </summary>
 
 ```yaml

deploy-job:
    stage: deploy
    needs: ["build-job", "style-job", "test-job"]
    script:
        - echo "🚀 Запуск развертывания вручную"
        - bash deploy_script.sh
    when: manual # Этот параметр делает этап ручным

```

Пояснения:
> when: manual: Это ключевой параметр. Он сообщает GitLab, что этот этап должен быть запущен вручную, а не автоматически.

</details>

![Запусти этот этап вручную  ](image/run_job_manual.png "Запустк  этапа вручную  ")  

В случае ошибки «зафейли» пайплайн.
В результате ты должен получить готовое к работе приложения ипапки*code-samples*(DO) на второй виртуальной машине.

Сохрани дампы образов виртуальных машин.

</details>

## Дополнительно. Уведомления

Настрой уведомления об успешном/неуспешном выполнении пайплайна через бота с именем «[твой nickname] DO6 CI/CD» в Telegram.

Текст уведомления должен содержать информацию об успешности прохождения как этапа CI, так и этапа CD.
В остальном текст уведомления может быть произвольным.


<details>
<summary> регистрация бота  </summary>

 
@BotFather — это официальный бот Telegram, который является основным инструментом для регистрации, настройки и управления другими ботами.  
С его помощью пользователи могут создавать новых ботов, изменять их название, описание, аватарку, а также получать уникальный токен (ключ) для авторизации и работы бота с сервисами и другими приложениями.  

Основные функции BotFather:  
**Регистрация ботов:** Позволяет создать новый бот и установить для него уникальное имя и логин, заканчивающийся на "_bot"  
**Управление настройками:** Дает возможность изменить название, описание и аватарку зарегистрированных ботов через специальные команды  
**Получение токена:** Генерирует API-токен, который служит ключом для интеграции бота с другими сервисами и платформами  
**Просмотр и управление ботами:** Предоставляет команду /mybots для просмотра всех созданных вами ботов и быстрого доступа к их настройкам   

> Как создать бота через *BotFather*:  
> Найдите бота: Введите `@BotFather` в поисковой строке *Telegram*  
> Начните диалог: Откройте чат с *BotFather* и отправьте команду `/start`, а затем `/newbot`  
> Введите имя и логин: Следуйте инструкциям *BotFather*, чтобы задать имя бота и его уникальный логин, который должен оканчиваться на **_bot** 
> Получите токен: После завершения регистрации BotFather выдаст вам API-токен, необходимый для дальнейшей работы с ботом  

Подробно с картинками описано как получить id бота
https://sitogon.ru/blog/252-kak-sozdat-telegram-bot-poluchit-ego-token-i-chat-id

</details>

<details>
<summary> описание  yaml </summary>
 
 ```yaml

notify-job:
    stage: notify
    script:
      - bash notify.sh

```


</details>

<details>
<summary> описание  notify.sh </summary>

  
 ```bash
#!/bin/bash
  SUCCESS=" ✅  $CI_JOB_NAME  - $CI_JOB_ID  - $CI_JOB_STATUS  "
  FAIL="❌  $CI_JOB_NAME ---------- ---------- $CI_JOB_URL "

  TOKEN=7971**5977:AAHF*2*p_Fdimtf9amz8ge-*n*_snBTvUmA
  ID_CHAT=5142*9108

if [[ $CI_JOB_NAME == "notify-job" ]]; then
     MESSAGE=" Запуск CI/CD для ветки $CI_COMMIT_BRANCH
               ... Пайплайн $CI_PIPELINE_ID
               ... $CI_COMMIT_AUTHOR
               :: $CI_COMMIT_MESSAGE
               CI_SERVER_NAME - $CI_SERVER_NAME"

      else
      if [[ $CI_JOB_STATUS == "success" ]]; then
        MESSAGE=$SUCCESS
      else
        MESSAGE=$FAIL
      fi

fi
curl -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id=$ID_CHAT -d text="$MESSAGE"
```
</details>

<details>
<summary> Скриншоты </summary>

![началь настройки бота ](image/telegram_bot1.png "началь настройки бота ")  
![Финальный результат работы ](image/telegram_bot2.png "Финальный результат работы ")  

</details>



</details>
