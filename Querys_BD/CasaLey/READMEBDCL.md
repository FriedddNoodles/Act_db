Esta carpeta contiene los querys de la primera actividad, ya propiamente dicha, en la que modelamos de forma sencilla una base de datos para una tienda o supermercado. Para varias de las cuestiones que rodean al diseno consultamos con personas que ya han trabajado en supermercados de la cadena Casa Ley, puesto que la actividad lo requeria, no nos inventamos nada (aun).

------------------------------------------------------------
--Explicacion Burda del diseno y la base de datos como tal--
------------------------------------------------------------

La base de datos cuenta con una tabla que gestiona los departamentos, los cuales tienen un sueldo fijo. Esta restriccion fue sacada de una entrevista a un extrabajador de la cadena de supermercados. Tambien contiene una tabla para gestionar a los empleados que reune su informacion primordial y minima necesaria, ya sabes: Nombre, datos personales, algun contacto, rfc, el tipo de cosas que un lugar quiere antes de contratarte.
Tambien tenemos una tabla para el catalogo de productos, la cual contiene la informacion base de cada producto, y una tabla de unidades de medida, que contiene diferentes unidades de medida que se usan en los products (decidimos separarlo en una tabla aparte porque, ante cualquier dato que se repita, mejor separalo y referencialo), y una tabla de ventas que viene en par junto con la de desglose, que funcionan para registrar las ventas y relacionarla con clientes y empleados.
creo que no olvido nada mas..
