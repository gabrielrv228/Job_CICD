# Practica_CICD
Bueno, aquí esta la práctica,han sido unas duras batallas con el señor jenkins y on terraform el cual nunca había usado.

He hecho los job dsl, pero he decidido prescindir de ellos, porque en este caso no son muy necesarios, ya que si usas un proyecto privado de git vas a tener que especificar su clave y su url y te cuesta lo mismo que hacerlo graficamente en jenkis.

He probado a coger el repositorio de mi cuenta de github en modo privado y con las credenciales, pero he preferido referenciarlo desde local, ya que es más seguro porque no tengo que subir a la nube el json con mis credenciales de gcloud.

También he visto que con el job dsl no te permite usar  el path file:///.... solo te deja usar https ssh...
![Screenshot from 2022-04-03 19-56-28](https://user-images.githubusercontent.com/95095337/161441747-1bba75ef-7017-44a2-909b-ccf132257601.png)


No he hecho el makefile debido a que sería absurdo, ya que la aplicación que despliego es realmente simple y no requiere instalar ni testear mucho, no he tenido tiempo de desplegar algo mejor, aunque tampoco se especifica que clase de aplicación hay que desplegar. si es necesario para que la práctica sea apta haré algo más complejo.
![Screenshot from 2022-04-03 19-56-01](https://user-images.githubusercontent.com/95095337/161441706-192d4c1a-7e10-48be-bbd0-d0036101edfd.png)


- Quieren dos unidades de almacenamiento, pues tienen dos entornos: dev y prod. Por lo tanto estas unidades se llamarán respectivamente acme-storage-dev y acme-storage-prod
![Screenshot from 2022-04-03 20-14-07](https://user-images.githubusercontent.com/95095337/161442120-530fae4e-6e09-48c6-8478-a86b57bbebbe.png)

- Quieren que el flujo de despliegue para el entorno de dev sea totalmente automáticos, sin intervención manual


- Sin embargo, en el flujo de despliegue de prod hará falta que un administrador apruebe el despliegue
![Screenshot from 2022-04-03 20-07-07](https://user-images.githubusercontent.com/95095337/161441846-17c5f2a3-7730-472a-9111-25981c2d7808.png)

![Screenshot from 2022-04-03 20-06-19](https://user-images.githubusercontent.com/95095337/161441814-63fbb71c-1048-4275-a038-cc20fa6852ab.png)


- Los desarrolladores de ACME han de poder hacer el despliegue desde sus máquinas para el entorno de dev
Cualquiera que tenga las credenciales de una service account con los perimisos suficientes puede desplegar, si el usuario de jenkins no es admin solo puede pulsar Abort. 

- Quieren que las credenciales para desplegar nunca estén guardadas en el código
![Screenshot from 2022-04-03 20-10-06](https://user-images.githubusercontent.com/95095337/161441965-3c5443ad-6886-4933-b8ab-426b75ca066b.png)
Solo hay que poner en el main.tf el path de las credenciales dentro de el repo de git

- Además ACME también quiere revisar cada 10 minutos que el contenido que hay en cada una de las unidades de almacenamiento no supera los 20MiB. Si esto pasa, se vaciarán las unidades de almacenamiento
test_gcloudstorage.py

- ACME lleva usando Jenkins mucho tiempo pero está actualmente abriéndose a probar nuevas teconologías con menor coste de gestión como Github Actions. Es por esto que también se requiere un pipeline de github actions para el despliegue de la unidad de almacenamiento, de modo que ACME pueda comparar ambas tecnologías
