== Задание ==  
Напиши bash-скрипт. Скрипт запускается с одним параметром. Параметр текстовый.  
Скрипт выводит значение параметра.  
Если параметр — число, то должно выводиться сообщение о некорректности ввода.  

```bash
#!/bin/bash

if [ "$#" -ne 1 ]; then   # $# - колчиесво введенных параметров
    echo "Error: script needs only one argument"
    exit 1
fi
```

```bash
#!/bin/bash

if [ -z "$1" ]; then  #Ключ -z в if используется для проверки переменной на пустую строку.
  echo "Enter parameter"
  exit 1
fi

if [[ "$1" =~ ^[+-]?[0-9]+([.,][0-9]+)?$ ]]; then
    echo "Incorrect input"
else
   echo "$1"
fi
```
тестовые данные :
>

> 1 2 3

> 12

> -13

> +14

> text

> text1

> 1text

> te1xt

> 1 text

> text 1

## Part 3. Visual output design for the system research script

`Всё готово! Но как же скучно оно выглядит... Нужно добавить больше красок в этот мир!`

<details>
<summary> == Task == </summary>

Напиши bash-скрипт. За основу возьми скрипт из Part 2 и убери из него часть, ответственную за сохранение данных в файл.  
Скрипт запускается с 4 параметрами. Параметры числовые. От 1 до 6, например:  
script03.sh 1 3 4 5

Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)

Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)  
Parameter 2 is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)  
Parameter 3 is the background of the values (after the '=' sign)  
Parameter 4 is the font colour of the values (after the '=' sign)  

Цвета шрифта и фона одного столбца не должны совпадать.  
При вводе совпадающих значений должно выводиться сообщение, описывающее проблему, и предложение повторно вызвать скрипт.  
После вывода сообщения программа должна корректно завершиться  


При вводе совпадающих значений должно выводиться сообщение, описывающее проблему, и предложение повторно вызвать скрипт.
После вывода сообщения программа должна корректно завершиться

</details>
    
## Part 4. Конфигурирование визуального оформления вывода для скрипта исследования системы  

`Вот теперь всё красиво! Но как же не хочется каждый раз вбивать цвета как параметры... Надо придумать что-нибудь более удобное.`  

<details>
<summary> == Task == </summary>
    
Напиши bash-скрипт. За основу возьми скрипт из Part 3. Обозначения цветов аналогичные.  
Скрипт запускается без параметров. Параметры задаются в конфигурационном файле до запуска скрипта.  
Конфигурационный файл должен иметь вид:  

column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1


Если один или несколько параметров не заданы в конфигурационном файле, то цвет должен подставляться из цветовой схемы, заданной по умолчанию. (Выбор на усмотрение разработчика).
После вывода информации о системе из Part 3, нужно, сделав отступ в одну пустую строку, вывести цветовую схему в следующем виде:

Column 1 background = 2 (red)
Column 1 font color = 4 (blue)
Column 2 background = 5 (purple)
Column 2 font color = 1 (white)

При запуске скрипта с цветовой схемой по умолчанию вывод должен иметь вид:

Column 1 background = default (black)
Column 1 font color = default (white)
Column 2 background = default (red)
Column 2 font color = default (blue)


</details>
