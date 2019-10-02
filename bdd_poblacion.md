## Proyecto BDD control de la población

#### Objetivo

Este documento recoge los resultados de la primera reunión que pretende elaborar un prototipo sobre el papel que cumpla con los requisitos necesarios para implementar una Base de Datos que lleve el control de la población de los municipios españoles.

#### Requisitos

La información solo será accesible para las personas que trabajen directamente en la BDD (administrador, programadores, analistas, etc.) y para los trabajadores de la Administración Pública. Los vecinos que quieran acceso a sus datos padronales (ya sea obtener una copia, eliminarlos, modificar algún campo, etc.) tendrán que hacerlo mediante el Ayuntamiento de su municipio. Además, cada 5 años se notificará a los vecinos el contenido de sus datos padronales.

 Cada comunidad autónoma puede contar con su propio servidor y a su vez todos estos servidores se conectaran con un servidor principal, esto con la finalidad de tener un respaldo de información en caso de que ocurra alguna malfunción o accidente de los servidores comunidad autónoma.

Los servidores deben contar con un SGBD (Sistema Gestor de Base de Datos) junto con una aplicación que permita acceder a la misma y poder modificarla. Además deben estar aisladas, es decir, no deben ser accesibles por ninguna red pública a parte de aquella que utilizaremos para realizar las copias de seguridad con el servidor central.

Algunas de las ventajas del uso de un sistema descentralizado como este son:
- Aumento de la confiabilidad del sistema
- Crecimiento soportable
- Toma de decisiones locales
- Distribución de datos

Como alternativa, se podría plantear un sistema centralizado. Estos tienen algunas ventajas frente a los descentralizados como una más fácil implementación y mantenimiento. Pero la velocidad de respuesta es más lenta y la escalabilidad resulta más difícil.

  
Teniendo en cuenta las necesidades que tiene que satisfacer la Base de Datos, proponemos el almacenamiento de los siguientes datos de forma obligatoria de los vecinos, tal y como figura en el [Real Decreto del BOE](https://www.boe.es/buscar/pdf/1986/BOE-A-1986-21944-consolidado.pdf):

- Nombre.
- Apellidos.
- Sexo.
- Domicilio habitual.
- Nacionalidad.
- Lugar de nacimiento.
- Fecha de nacimiento.
- Número del Documento Nacional de Identidad (o si se trata de extranjeros, el documento que lo sustituya).
- Certificado o título escolar o académico que posea.

Además de estos datos, se podrán almacenar cuantos otros datos puedan ser necesarios para la elaboración del censo electoral, siempre  que  se  garantice  el  respeto  a  los  derechos  fundamentales  reconocidos  en  la Constitución. Y como datos de carácter voluntario:

- Número de teléfono
- Designación  de  las  personas  que  pueden  representar  a  cada  vecino  ante  la Administración municipal a efectos padronales.

En el caso de ser una persona de nacionalidad española que reside en el extranjero, los datos que se almacenarán de forma obligatoria son los siguientes:

- Nombre.
- Apellidos.
- Sexo.
- Lugar de nacimiento.
- Fecha de nacimiento.
- Número del documento nacional de identidad, o pasaporte.
- Certificado o título escolar o académico que posea.
- Domicilio en el país de residencia.
- Municipio de inscripción en España a efectos electorales.
- Cuantos otros datos sean necesarios para la elaboración del censo electoral, siempre que se garanticen los derechos fundamentales reconocidos en la Constitución.

Además de estos datos, se podrán almacenar cuantos otros datos puedan ser necesarios para la elaboración del censo electoral, siempre  que  se  garantice  el  respeto  a  los  derechos  fundamentales  reconocidos  en  la Constitución. Y como datos de carácter voluntario:

- Designación de las personas que pueden representar a cada inscrito ante la Oficina Consular a efectos padronales.
- Número de teléfono del domicilio en el país de residencia.
- Domicilio del municipio de referencia en España.
- Número de teléfono del municipio de referencia en España
  
#### Bibliografía

<https://es.wikipedia.org>
<http://sobrebasededatos.blogspot.com/2010/03/analisis-de-requerimientos.html>
<http://repository.udistrital.edu.co/bitstream/11349/4663/1/proyecto_final.pdf>


Carlos Fernández Donate (alu).
Daniel Nuez Wehbe (alu0100881165@ull.edu.es).



  
