# Practica_CICD
Bueno, aquí esta la práctica,han sido unas duras batallas con el señor jenkins y on terraform el cual nunca había usado.

He hecho los job dsl, pero he decidido prescindir de ellos, porque en este caso no son muy necesarios, ya que si usas un proyecto privado de git vas a tener que especificar su clave y su url y te cuesta lo mismo que hacerlo graficamente en jenkis.

He probado a coger el repositorio de mi cuenta de github en modo privado y con las credenciales, pero he preferido referenciarlo desde local, ya que es más seguro porque no tengo que subir a la nube el json con mis credenciales de gcloud.

También he visto que con el job dsl no te permite usar  el path file:///.... solo te deja usar https ssh...

No he hecho el makefile debido a que sería absurdo, ya que la aplicación que despliego es realmente simple y no requiere instalar ni testear mucho, no he tenido tiempo de desplegar algo mejor, aunque tampoco se especifica que clase de aplicación hay que desplegar. si es necesario para que la práctica sea apta haré algo más complejo.

