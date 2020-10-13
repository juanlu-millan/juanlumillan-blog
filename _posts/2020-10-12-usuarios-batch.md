---
layout:     post
title:      Creación batch de cuentas de usuario
date:       2020-10-12 10:20:00
summary:    Crear cusuarios por lotes en Debian 10.
categories: debian10 usuarios
---

En este post veremos de manera sencilla y rápida como crear cusuarios por lotes en Debian 10 en introducirlos en nuestro fichero de /etc/passwd.

##### Crear ficheros de usuarios

- Para crear este fichero tenemos que fijarnos en la estructura de nuestro passwd y con el comando for crearemos varios usuarios, lo añadimos a un fichero llamado alumnosnew para después sacar la información de dicho fichero.

<pre>
 for i in {1..4};do \`echo alumno$i:x:121$i:121$i:alumno$i:/home/alumno$i:/bin/bash >> alumnosnew\`;done
</pre>

##### Crear contraseñas con pwgen

- Una vez creado los usuarios vamos a crear las contraseñas con pwgen, creamos un for para introducir las contraseñas.

<pre>
 for i in {1..4};do echo alumno$i:\`pwgen\` >> contraseñanew ;done
</pre>

#####  Agregar usuarios con newusers

- Ejecutamos el comando newusers (lee un fichero y utiliza la información para crear usuarios por lotes) con el fichero alumnosnew que hemos creado anteriormente.

<pre>
 newusers < usuariosnew
</pre>

#####  Agregar contraseña a los usuarios creados

- Ahora solo nos queda agregar las contraseñas con chpasswd a los usuarios correspondientes.

<pre>
  chpasswd < contraseñasnew
</pre>

