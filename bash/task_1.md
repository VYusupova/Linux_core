== Задание ==  
Напиши bash-скрипт. Скрипт запускается с одним параметром. Параметр текстовый.  
Скрипт выводит значение параметра.  
Если параметр — число, то должно выводиться сообщение о некорректности ввода.  

```bash
#!/bin/bash

if (( $# != 1 )); then
	echo "You must use one parameter!"
	exit 1
fi
if ! [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
	echo "$1"
else
	echo "Incorrect input!"
	exit 1
fi
```

```bash
#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: script needs only one argument"
    exit 1
fi
input="$1"

if [[ "$input" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: input isn't text parametr"
    exit 1
else
    echo "$input"
    exit 0
fi
```

#wadegula
```bash
#!/bin/bash
if [[ ($1 =~ ^-?[0-9]+$) || !($# =~ 1) ]]; then
	echo "Некорректный ввод. Введено число!"
else
       	echo "$1"
fi
```

#haraaero
```bash
#!/bin/bash

if [ -z "$1" ]; then
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
