## Proyecto BDD control de la población

#### Objetivo

&nbsp;&nbsp;&nbsp;&nbsp;Este documento recoge los resultados de la primera reunión que pretende elaborar un prototipo sobre el papel que cumpla con los requisitos necesarios para implementar una Base de Datos que lleve el control de la población de los municipios españoles.

#### Requisitos

&nbsp;&nbsp;&nbsp;&nbsp;La información solo será accesible para las personas que trabajen directamente en la BDD (administrador, programadores, analistas, etc.) y para los trabajadores de la Administración Pública. Los vecinos que quieran acceso a sus datos padronales (ya sea obtener una copia, eliminarlos, modificar algún campo, etc.) tendrán que hacerlo mediante el Ayuntamiento de su municipio. Además, cada 5 años se notificará a los vecinos el contenido de sus datos padronales.

&nbsp;&nbsp;&nbsp;&nbsp;Cada comunidad autónoma puede contar con su propio servidor y a su vez todos estos servidores se conectaran con un servidor principal, esto con la finalidad de tener un respaldo de información en caso de que ocurra alguna malfunción o accidente de los servidores comunidad autónoma.

&nbsp;&nbsp;&nbsp;&nbsp;Los servidores deben contar con un SGBD (Sistema Gestor de Base de Datos) junto con una aplicación que permita acceder a la misma y poder modificarla. Además deben estar aisladas, es decir, no deben ser accesibles por ninguna red pública a parte de aquella que utilizaremos para realizar las copias de seguridad con el servidor central.

&nbsp;&nbsp;&nbsp;&nbsp;Algunas de las ventajas del uso de un sistema descentralizado como este son:

&nbsp;&nbsp;&nbsp;&nbsp;- Aumento de la confiabilidad del sistema  
&nbsp;&nbsp;&nbsp;&nbsp;- Crecimiento soportable  
&nbsp;&nbsp;&nbsp;&nbsp;- Toma de decisiones locales  
&nbsp;&nbsp;&nbsp;&nbsp;- Distribución de datos  

&nbsp;&nbsp;&nbsp;&nbsp;Como alternativa, se podría plantear un sistema centralizado. Estos tienen algunas ventajas frente a los descentralizados como una más fácil implementación y mantenimiento. Pero la velocidad de respuesta es más lenta y la escalabilidad resulta más difícil.

  
&nbsp;&nbsp;&nbsp;&nbsp;Teniendo en cuenta las necesidades que tiene que satisfacer la Base de Datos, proponemos el almacenamiento de los siguientes datos de forma obligatoria de los vecinos, tal y como figura en el [Real Decreto del BOE](https://www.boe.es/buscar/pdf/1986/BOE-A-1986-21944-consolidado.pdf):

&nbsp;&nbsp;&nbsp;&nbsp;- Nombre.
&nbsp;&nbsp;&nbsp;&nbsp;- Apellidos.
&nbsp;&nbsp;&nbsp;&nbsp;- Sexo.
&nbsp;&nbsp;&nbsp;&nbsp;- Domicilio habitual.
&nbsp;&nbsp;&nbsp;&nbsp;- Nacionalidad.
&nbsp;&nbsp;&nbsp;&nbsp;- Lugar de nacimiento.
&nbsp;&nbsp;&nbsp;&nbsp;- Fecha de nacimiento.
&nbsp;&nbsp;&nbsp;&nbsp;- Número del Documento Nacional de Identidad (o si se trata de extranjeros, el documento que lo sustituya).
&nbsp;&nbsp;&nbsp;&nbsp;- Certificado o título escolar o académico que posea.

&nbsp;&nbsp;&nbsp;&nbsp;Además de estos datos, se podrán almacenar cuantos otros datos puedan ser necesarios para la elaboración del censo electoral, siempre  que  se  garantice  el  respeto  a  los  derechos  fundamentales  reconocidos  en  la Constitución. Y como datos de carácter voluntario:

&nbsp;&nbsp;&nbsp;&nbsp;- Número de teléfono
&nbsp;&nbsp;&nbsp;&nbsp;- Designación  de  las  personas  que  pueden  representar  a  cada  vecino  ante  la Administración municipal a efectos padronales.

&nbsp;&nbsp;&nbsp;&nbsp;En el caso de ser una persona de nacionalidad española que reside en el extranjero, los datos que se almacenarán de forma obligatoria son los siguientes:

&nbsp;&nbsp;&nbsp;&nbsp;- Nombre.
&nbsp;&nbsp;&nbsp;&nbsp;- Apellidos.
&nbsp;&nbsp;&nbsp;&nbsp;- Sexo.
&nbsp;&nbsp;&nbsp;&nbsp;- Lugar de nacimiento.
&nbsp;&nbsp;&nbsp;&nbsp;- Fecha de nacimiento.
&nbsp;&nbsp;&nbsp;&nbsp;- Número del documento nacional de identidad, o pasaporte.
&nbsp;&nbsp;&nbsp;&nbsp;- Certificado o título escolar o académico que posea.
&nbsp;&nbsp;&nbsp;&nbsp;- Domicilio en el país de residencia.
&nbsp;&nbsp;&nbsp;&nbsp;- Municipio de inscripción en España a efectos electorales.
&nbsp;&nbsp;&nbsp;&nbsp;- Cuantos otros datos sean necesarios para la elaboración del censo electoral, siempre que se garanticen los derechos fundamentales reconocidos en la Constitución.

&nbsp;&nbsp;&nbsp;&nbsp;Además de estos datos, se podrán almacenar cuantos otros datos puedan ser necesarios para la elaboración del censo electoral, siempre  que  se  garantice  el  respeto  a  los  derechos  fundamentales  reconocidos  en  la Constitución. Y como datos de carácter voluntario:

&nbsp;&nbsp;&nbsp;&nbsp;- Designación de las personas que pueden representar a cada inscrito ante la Oficina Consular a efectos padronales.
&nbsp;&nbsp;&nbsp;&nbsp;- Número de teléfono del domicilio en el país de residencia.
&nbsp;&nbsp;&nbsp;&nbsp;- Domicilio del municipio de referencia en España.
&nbsp;&nbsp;&nbsp;&nbsp;- Número de teléfono del municipio de referencia en España
  
#### Bibliografía

<https://es.wikipedia.org>  
<http://sobrebasededatos.blogspot.com/2010/03/analisis-de-requerimientos.html>  
<http://repository.udistrital.edu.co/bitstream/11349/4663/1/proyecto_final.pdf>


Carlos Fernández Donate (alu).  
Daniel Nuez Wehbe (alu0100881165@ull.edu.es).



  
