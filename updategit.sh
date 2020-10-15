#!/bin/bash

echo "Bienvenido al actualizador de git de Juan Luis Millán."
echo "Introduce los cambios realizados(commit):"; read input

git add *

while [$input = ""]
do
 echo "Opción no valida, comenta algo."
 echo "Introduce los cambios realizados(commit):"; read input
done

git commit -am "$input"
git push

exit
