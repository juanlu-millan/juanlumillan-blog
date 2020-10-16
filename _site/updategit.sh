#!/bin/bash

echo "Bienvenido al actualizador de git de Juan Luis Millán."
echo "Introduce los cambios realizados(commit):"; read input

#Actualizamos los ficheros modificados.
bundle exec jekyll build --incremental

#Copiamos los html creados en nuestro _site y los movemos a nuestro repositorio que esta enlazado a netlify
cp -r /home/juanlu/GitHub/blog/juanlumillan-blog/_site/* /home/juanlu/GitHub/blog/juanlumillan-netlify/


#Accedemos al repostirio donde están creadas nuestros html.
cd /home/juanlu/GitHub/blog/juanlumillan-netlify/

#Agreamos los cambios realizados con git,hacemos el commit y lo subimos con un push.
git add *

while [$input = ""]
do
 echo "Opción no valida, comenta algo."
 echo "Introduce los cambios realizados(commit):"; read input
done

git commit -am "$input"
git push

exit 0
