# Job CICD
In this case, the company ACME wants to start testing the cloud, so we are going to create fully automated cloud storage units. 
The ACME gave the following requierments:

- They want two storage units, as they have two environments: dev and prod. Therefore these units will be called respectively acme-storage-dev and acme-storage-prod.
- They want the deployment flow for the dev environment to be fully automatic, with no manual intervention.
- However, the deployment flow for prod will require an administrator to approve the deployment.
- ACME developers must be able to deploy from their machines for the dev environment.
- They want the credentials to deploy to never be stored in the code.
- In addition ACME also wants to check every 10 minutes that the content on each of the storage units does not exceed 20MiB. If this happens, the storage units will be emptied.
- ACME has been using Jenkins for a long time but is currently opening up to try new technologies with lower management costs such as Github Actions. This is why a github actions pipeline is also required for the storage unit deployment, so that ACME can compare both technologies.


Bueno, aquí esta la práctica,han sido unas duras batallas con el señor jenkins y con terraform el cual nunca había usado.

He hecho los job dsl, pero he decidido prescindir de ellos, porque en este caso no son muy necesarios, ya que si usas un proyecto privado de git vas a tener que especificar su clave y su url y te cuesta lo mismo que hacerlo graficamente en jenkins.

He probado a coger el repositorio de mi cuenta de github en modo privado y con las credenciales, pero he preferido referenciarlo desde local, ya que es más seguro porque no tengo que subir a la nube el json con mis credenciales de gcloud.

También he visto que con el job dsl no te permite usar  el path file:///.... solo te deja usar https ssh...
![Screenshot from 2022-04-03 19-56-28](https://user-images.githubusercontent.com/95095337/161441747-1bba75ef-7017-44a2-909b-ccf132257601.png)


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
test_gcloudstorage.py, Funciona, pero no imprime lo que le dice la funcion por jenkins, en la terminal se ve, y se me olvidaba, está hecho en modo universal, faltaría ponerle el directorio que se quiere borrar del bucket para que no se lo cargue todo.

- ACME lleva usando Jenkins mucho tiempo pero está actualmente abriéndose a probar nuevas teconologías con menor coste de gestión como Github Actions. Es por esto que también se requiere un pipeline de github actions para el despliegue de la unidad de almacenamiento, de modo que ACME pueda comparar ambas tecnologías
- Bueno, ahi está en .github/workflows ha sido successfull.
