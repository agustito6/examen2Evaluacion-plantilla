CREATE DATABASE  IF NOT EXISTS `proyectoseuropeos` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyectoseuropeos`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: proyectoseuropeos
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `presupuesto` double unsigned NOT NULL,
  `gastos` double unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Desarrollo',120000,6000),(2,'Sistemas',150000,21000),(3,'Recursos Humanos',280000,25000),(4,'Contabilidad',110000,3000),(5,'I+D',375000,380000),(6,'Proyectos',0,0),(7,'Publicidad',0,1000);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `apellido1` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `apellido2` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `iddepartamento` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  KEY `iddepartamento` (`iddepartamento`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'32481596F','Aarón','Rivero','Gómez',1),(2,'Y5575632D','Adela','Salas','Díaz',2),(3,'R6970642B','Adolfo','Rubio','Flores',3),(4,'77705545E','Adrián','Suárez','Díaz',4),(5,'17087203C','Marcos','Loyola','Méndez',5),(6,'38382980M','María','Santana','Moreno',1),(7,'80576669X','Pilar','Ruiz','Díaz',2),(8,'71651431Z','Pepe','Ruiz','Santana',3),(9,'56399183D','Juan','Gómez','López',2),(10,'46384486H','Diego','Flores','Salas',5),(11,'67389283A','Marta','Herrera','Gil',1),(12,'41234836R','Irene','Salas','Flores',2),(13,'82635162B','Juan Antonio','Sáez','Guerrero',3);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(2000) COLLATE latin1_spanish_ci NOT NULL,
  `fechainicio` datetime NOT NULL,
  `fechafin` datetime NOT NULL,
  `presupuesto` float NOT NULL,
  `ejecutado` float NOT NULL,
  `activo` int NOT NULL,
  `idgestor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FG_EMPLEADOS1_idx` (`idgestor`),
  CONSTRAINT `FG_EMPLEADOS1` FOREIGN KEY (`idgestor`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'La crisis del agua.','La crisis del agua se presenta cuando hay escasez de este recurso natural. Esta crisis se produce porque se utiliza más agua de la que se encuentra de forma natural. Además, hay muchas personas en el mundo que no tienen acceso a agua potable. En relación con este tema se puede investigar: ¿Cuáles son las causas de la crisis del agua? ¿Para qué se usa el agua potable? ¿Cómo se podría disminuir su consumo?','2020-03-05 00:00:00','2021-06-15 00:00:00',23500,12000,0,1),(2,'Aplicación de la nanotecnología.','La nanotecnología es una ciencia que estudia y realiza la manipulación de materia en la menor escala posible. El desarrollo de esta ciencia se utiliza en informática, en medicina y en ingeniería y en la fabricación de productos que utilizamos todos los días. En relación con este tema se puede investigar sobre los avances de la nanotecnología, otros usos que podría tener, entre otros.','2022-06-13 00:00:00','2025-03-05 00:00:00',145000,60500,1,2),(3,'Los agujeros negros','Los agujeros negros son objetos astronómicos con una fuerza gravitatoria que no permite que nada salga de ellos. Los agujeros negros son estudiados por astrónomos y por físicos. En relación con este tema se puede investigar: ¿Qué elementos son los mejores para estudiar los agujeros negros? ¿Cómo fue el avance del conocimiento de estos objetos? ¿Qué teorías son las mejor fundamentadas en relación con estos objetos?','2019-12-11 00:00:00','2027-07-01 00:00:00',15000000,345000,1,3),(4,'Costos de construcción de edificios verdes.','Los costos de construcción de edificios verdes son más altos que los costos de construcción de edificios comunes. Los edificios verdes producen un bajo impacto negativo en el medioambiente por sus materiales y por su ahorro energético. En relación con este tema se puede investigar sobre posibles políticas para fomentar la construcción de estos edificios que disminuyan su costo; la utilización de materiales que mantengan la calidad, pero que no presenten un costo adicional; entre otras cosas.','2018-11-15 00:00:00','2021-04-29 00:00:00',786000,105000,0,4),(5,'El cambio climático y la extinción de especies.','El cambio climático tiene graves consecuencias, una de ellas es que produce que los hábitats naturales de ciertas especies dejen de ser aptos para que estos animales puedan vivir allí. Se estima que el cambio climático es la causa del 1/6 del total de las especies en peligro de extinción. En relación con este tema se puede investigar: ¿Cuántas y cuáles son las especies en peligro de extinción que se encuentran en este estado por el cambio climático? ¿Se podrán adaptar a otros ambientes? ¿Qué se podría hacer para que estas especies no desaparecieran?','2015-04-23 00:00:00','2035-10-31 00:00:00',1660000,903500,1,5),(6,'La vida en Marte.','No se puede determinar con certeza si hubo o no vida en Marte. Pero los recientes descubrimientos de que hubo actividad volcánica y supuestos restos de agua y de sales indican que es probable que haya habido vida en este planeta. En relación con este tema, se puede investigar: ¿Qué teorías sostienen que hubo vida en Marte? ¿Qué teorías sostienen que no hubo vida en este planeta? ¿Son hipótesis o hay pruebas? ¿Qué nuevas investigaciones se harán en este planeta y qué se piensa que se va a encontrar?','2018-08-20 00:00:00','2035-01-31 00:00:00',25000000,13567200,1,6),(7,'La alfabetización en una lengua extranjera.','Muchas personas llegan a países donde no se habla su lengua materna o toman clases con personas que hablan otra lengua y aprenden a escribir en una lengua extranjera. En relación con este tema se puede investigar: ¿El proceso de alfabetización es similar en la lengua materna y en la lengua extranjera? ¿Qué diferencias hay? ¿Qué dificultades presenta la enseñanza en este tipo de casos?','2021-01-20 00:00:00','2023-12-31 00:00:00',150000,25000,1,7),(8,'Leyes de alimentos en relación con la fecha de vencimiento.','Para determinar la fecha de vencimiento de un producto alimenticio, es necesario conocer su duración en buen estado. Sin embargo, las leyes en relación con este tema son distintas en los diferentes países. ¿A qué se debe esto? ¿Qué leyes regulan cómo establecer el vencimiento de los productos?','2021-02-25 00:00:00','2025-11-15 00:00:00',750000,5000,1,7),(9,'La representación de la realidad en el realismo mágico.','El realismo mágico fue un movimiento literario latinoamericano, que se caracterizaba por incluir elementos fantásticos en escenarios realistas. Los artistas de este movimiento no buscaban representar la realidad de forma total, sino establecer una problematización de cómo se percibe a la realidad. En relación con este tema se puede investigar: la representación de la realidad en la obra de un autor, el vínculo entre el realismo mágico y la interpretación de la realidad, entre otras cosas. Inversión en la construcción de edificios residenciales. Con la creciente demanda habitacional en las grandes ciudades, la inversión en la construcción de edificios residenciales se ha vuelto una inversión segura. Pero, ¿que tienen que tener en cuenta los inversionistas antes de tomar la decisión de participar en un proyecto? ¿Qué características tienen los proyectos más seguros?','2021-03-25 00:00:00','2022-05-09 00:00:00',50000,45000,0,8),(10,'Preservación de edificios de patrimonio histórico.','ElLa conservación del patrimonio cultural es fundamental para cualquier nación. En el caso de los edificios, hay muchos países que tienen leyes específicas para su preservación. En relación con este tema, se puede estudiar: ¿Cómo se preservan los edificios históricos? ¿Se pueden demoler para hacer otras construcciones? ¿Cómo funcionan estas leyes en los distintos lugares del mundo?','2020-03-05 00:00:00','2025-05-10 00:00:00',5000000,1250000,1,9),(11,'Periodismo y libertad de expresión.','La libertad de expresión es fundamental en el periodismo pero, ¿cuál es el límite entre libertad de expresión y comentarios que son discriminatorios o que incitan a la violencia? En relación con este tema se pueden investigar los casos en los que no había libertad de expresión en el periodismo, cómo funcionaba la censura, entre otras cosas.','2021-08-15 00:00:00','2024-02-25 00:00:00',350000,250000,1,10),(12,'La planificación de una campaña publicitaria.','La planificación de una campaña publicitaria incluye las tareas que se desarrollarán, los objetivos, los costos, entre otras cosas. Antes de realizar una campaña, es necesario analizar la planificación y establecer posibles cambios que se puedan presentar. En relación con este tema, se puede investigar: ¿Qué elementos son fundamentales para estas planificaciones? ¿Cómo se debe presentar una planificación de este tipo a un cliente?','2018-01-12 00:00:00','2023-01-25 00:00:00',500000,75000,0,11),(13,'La comunicación horizontal y la comunicación vertical en relación con la eficiencia.','La comunicación horizontal es un tipo de comunicación que se establece entre personas de una misma jerarquía en una compañía. La comunicación vertical es un tipo de comunicación que se establece entre personas de distintas jerarquías dentro de una compañía. En relación con este tema se puede investigar ¿Qué características tienen cada tipo de comunicación? ¿Cómo se establece un sistema de comunicación empresarial eficiente? ¿En qué casos estos tipos de comunicación son eficientes y en cuáles son contraproducentes?','2015-05-13 00:00:00','2025-02-18 00:00:00',5000000,750000,1,12),(14,'El plebiscito y la democracia participativa.','El plebiscito se utiliza tanto en la democracia participativa como en la democracia representativa para someter una ley o una decisión importante a votación de los ciudadanos. La democracia participativa es un tipo de democracia en el que la población toma la mayoría de las decisiones. En relación con este tema se puede investigar ¿Qué tipo de decisiones están a cargo de los ciudadanos en una democracia participativa? ¿Cómo funciona el plebiscito? ¿En qué casos se ha utilizado el plebiscito en democracias representativas y por qué?','2018-01-07 00:00:00','2027-03-19 00:00:00',250000,150000,1,13),(15,'El rol del mediador en la mediación judicial.','Una mediación judicial es una instancia previa a un juicio en la que se busca llegar a un acuerdo entre dos partes. El mediador no es un juez, por lo tanto, no puede tomar ninguna decisión, pero ayuda a que las dos partes lleguen a una solución. En relación con este tema se puede investigar: ¿Qué estrategias utiliza un mediador? ¿Cómo ha cambiado su rol a lo largo del tiempo? ¿Cómo logra una buena comunicación entre las partes?','2019-02-07 00:00:00','2027-05-23 00:00:00',145000,10000,1,1),(16,'Carriles especiales para el transporte público.','Los carriles especiales para el transporte público se realizan con la finalidad de que solo los autobuses puedan circular por estos. Estos carriles traen grandes beneficios, ya que los autobuses pueden circular más rápido y no hay tanto tránsito en las calles. En relación con este tema se pueden investigar casos en los que se hicieron carriles especiales y su funcionamiento, estrategias para determinar en qué calles y avenidas tienen que estar estos carriles, entre otras cosas.','2019-01-10 00:00:00','2030-02-23 00:00:00',1000000,25000,1,1),(17,'Impresión 3D para fabricación de prótesis.','La impresión 3D cambió la forma de realizar prótesis y en algunos casos supone una disminución de costos, lo que hace que sean más accesibles para los usuarios. En relación con este tema se puede investigar: ¿Cuáles son las diferencias que tienen con las prótesis comunes? ¿Qué ventajas hay en su producción? ¿Cómo se regula su producción y su venta en cada país?','2021-02-15 00:00:00','2031-10-25 00:00:00',10000000,250000,1,2),(18,'Construcciones antisísmicas.','Las construcciones antisísmicas son más resistentes que las construcciones comunes en caso de que haya un terremoto. Estas construcciones tienen materiales, estructuras y diseños especiales para cumplir con esta función. En relación con este tema, se pueden investigar las construcciones que mejor funcionan en el mundo y sus características, los problemas que hay en relación con los materiales, los avances que se hicieron en los últimos años para este tipo de construcciones, entre otras cosas.','2015-01-07 00:00:00','2035-11-12 00:00:00',25000000,12750300,1,3),(19,'Análisis comparado de democracias federalistas.','En las democracias federalistas hay un gobierno central que respeta la autonomía relativa de las distintas regiones que lo componen. Los países federalistas son muy distintos, ya que algunos se organizan en provincias y otros en estados y la independencia respecto al gobierno central varía entre los países. En relación con este tema, se puede investigar: ¿Cómo nació el federalismo? ¿Cuánto poder tiene el gobierno central y cuánto las otras partes? ¿Cómo funciona en cada país?','2015-01-07 00:00:00','2021-07-27 00:00:00',100000,100000,0,4),(20,'El cambio tecnológico.','¿Qué impacto tienen las nuevas tecnologías en la vida de los seres humanos? La sociedad lleva años haciéndose esta pregunta, prácticamente desde la Revolución Industrial, pero ha cobrado una fuerza enorme a partir de la Revolución Digital de finales del siglo XX y la incorporación de las nuevas tecnologías e Internet en casi todos los aspectos de nuestra vida. Pero, ¿es todo positivo en ese sentido? ¿Qué ventajas y qué riesgos implica la presencia de estos aparatos en todos los rincones de la vida? ¿De qué manera influyen en nuestras formas de pensar, actuar y sentir?','2018-03-10 00:00:00','2024-02-25 00:00:00',23500000,12900400,1,5),(21,'Efectos del consumo de tabaco y alcohol.','Se sabe que el tabaco y el alcohol son drogas legales, de amplio consumo en el mundo desde hace siglos, pero también se conocen los daños que su consumo en exceso ocasiona en el organismo, así como los riesgos a los que su uso indiscriminado puede exponernos. ¿Cuáles son las consecuencias posibles de su uso? ¿Qué medidas toma al respecto la Organización Mundial de la Salud y las demás organizaciones que velan por el bienestar de las personas? ¿Qué medidas deberían tomar los gobiernos para prevenir y/o desalentar el consumo de tabaco y alcohol?','2009-08-10 00:00:00','2034-05-05 00:00:00',12000000,7939240,1,6),(22,'El cambio climático.','Hace rato que se ha levantado la alerta roja: estamos cambiando el mundo de manera irreversible y las consecuencias de ello pueden ser costosas e imprevisibles. ¿Cuáles son las principales evidencias actuales de que el mundo incrementa anualmente su temperatura? ¿Cuáles son las posibles consecuencias de este hecho? ¿Qué medidas tendrían que tomar los gobiernos y cuáles cada uno en su casa para detener este proceso?','2017-02-19 00:00:00','2030-02-03 00:00:00',9000000,5345990,1,7),(23,'El bullying.','El acoso escolar y el abuso a menudo ocurren a la vista de docentes, padres y estudiantes que ignoran las consecuencias emocionales que esto puede desencadenar en los individuos, justamente en la etapa más constitutiva de la personalidad. ¿Por qué ocurre el bullying? ¿Hemos hecho bullying alguna vez sin darnos cuenta? ¿A dónde conduce la espiral de la violencia? ¿Cómo podemos prevenir este problema y por qué es tan importante a nivel social? Trastornos alimenticios. La anorexia y la bulimia son graves problemas de salud, que suelen darse especialmente en poblaciones adolescentes. Para combatirlos mejor, debemos poder reconocerlos. ¿Cuáles son sus síntomas? ¿Cuáles son sus posibles consecuencias? ¿Qué formas de tratamiento existen? ¿Cómo podemos ayudar a un amigo o amiga que está pasando por alguna de estas situaciones?','2015-11-01 00:00:00','2024-01-03 00:00:00',1500000,850345,1,8),(24,'La guerra.','La guerra es un flagelo que ha acompañado al ser humano desde las sociedades primitivas y que saca lo peor de este para enfrentarlo con sus semejantes. A su vez, también es un mecanismo económico, que enriquece a algunos a pesar de devastar la vida de miles de personas. ¿Qué conflictos recientes han ocurrido en el mundo y por qué? ¿Cuáles son las consecuencias de los conflictos bélicos actuales y cuál es la respuesta de la comunidad internacional? ¿Quiénes son los refugiados y cómo se los puede ayudar a reconstruir sus vidas devastadas por la guerra?','2018-02-18 00:00:00','2034-06-21 00:00:00',15000000,5845200,1,9),(25,'El embarazo adolescente.','Dado que en la adolescencia se descubre la sexualidad y este es un tema que a menudo es tabú en las sociedades, la información de la que se dispone a menudo es escasa o sesgada. ¿Cuáles son las cifras de embarazo adolescente en el país y el continente? ¿Cómo puede abordarse este problema y brindar una mejor educación sexual a las comunidades? ¿Cómo podemos prevenir un embarazo no deseado? ¿Por qué es un tema de salud pública?','2020-10-15 00:00:00','2027-10-21 00:00:00',750000,300750,1,10),(26,'Las culturas originarias americanas.','¿Quiénes habitaban el continente americano antes de la llegada de los españoles? Nuestras culturas originarias fueron diversas, variopintas y a menudo más avanzadas tecnológica y culturalmente de lo que se suele pensar. ¿Cuáles fueron las principales culturas originarias y qué destino les deparó la Historia? ¿Cuáles son las principales ruinas precolombinas americanas y qué sobrevive de las culturas que las construyeron? ¿Cómo puede preservarse hoy ese legado devastado por la brutalidad de la conquista?','2021-07-25 00:00:00','2022-10-21 00:00:00',500000,475000,0,11),(27,'Las enfermedades venéreas.','Las ETS o Enfermedades de Transmisión Sexual son un riesgo para las poblaciones de todas las edades y la educación al respecto es indispensable. Sin embargo, muchos sectores no cuentan con la información necesaria para prevenir estas enfermedades. ¿Cuáles son hoy en día las principales ETS? ¿Cuáles son sus síntomas y sus posibles consecuencias? ¿Cómo podemos prevenirlas? ¿Cuáles son las principales conductas de riesgo? ¿Qué políticas deberían llevar adelante los gobiernos para informar a la población?','2020-02-15 00:00:00','2024-11-14 00:00:00',350000,100000,1,12),(28,'La pobreza.','Mucho se dice en los medios de comunicación sobre la pobreza en distintos países del mundo, pero, ¿qué significa ser pobre? ¿Qué porcentaje de la población mundial vive en estado de pobreza? ¿Por qué es un problema mundial a combatir y de qué maneras puede una nación atender a sus poblaciones en riesgo? Y finalmente, ¿qué podemos hacer para reducir esta desigualdad?','2015-01-15 00:00:00','2035-01-14 00:00:00',35000000,23000000,1,13),(29,'Los plásticos como combustibles alternativos. Método para transformar los plásticos en combustible.','La mayoría de los plásticos se desechan en rellenos sanitarios y océanos y un 12% se quema, liberando a la atmósfera grandes cantidades de gases contaminantes. Apenas el 9% del plástico es reciclado a nivel mundial. Los plásticos se degradan lentamente y liberan microplásticos, que entran en los organismos vivos, provocando daños. Un método químico que pueda transformar los plásticos en un tipo de combustible serviría para estimular el reciclaje y disminuir el desecho de los plásticos en el ambiente.','2015-07-15 00:00:00','2035-06-30 00:00:00',55000000,27000000,1,2),(30,'La terapia genética.','La terapia genética es el tratamiento de las enfermedades hereditarias arreglando los genes que pueden estar dañados en las mismas. Entre las enfermedades que podrían resolverse con este tipo de terapias están la drepanocitosis o el mal de Huntington, y algunos tipos de cáncer. ¿Será la terapia genética la forma más efectiva para curar todas las enfermedades? ¿Cuáles son las ventajas y las desventajas de la terapia genética?','2020-01-20 00:00:00','2028-04-30 00:00:00',14000000,7500000,1,3),(31,'Los alimentos transgénicos','A los organismos transgénicos u organismos modificados genéticamente se les modifica el código genético con partes del código genético de otros seres vivos. Esto se hace con la finalidad de que estos seres puedan producir proteínas que en condiciones normales no lo hacen. Los alimentos transgénicos tienen una serie de ventajas y desventajas, que sin duda determinarán su uso más extendido a nivel general. ¿Cómo se producen los alimentos transgénicos? ¿Cuál es el peligro de su elaboración y consumo?','2019-01-20 00:00:00','2029-01-30 00:00:00',18000000,9000000,1,4),(32,'Esteroides anabolizantes','Los esteroides son compuestos derivados del colesterol que incluyen la testosterona y análogos sintéticos. Algunos atletas usan estos compuestos para aumentar su rendimiento físico o mejorar su apariencia. ¿Es correcto utilizar este tipo de drogas para verse mejor? ¿Cómo actúan los esteroides anabolizantes? ¿Cuáles son los problemas asociados con su empleo?','2019-12-20 00:00:00','2023-01-30 00:00:00',800000,750000,0,5),(33,'Las vacunas','Los seres humanos poseemos un sistema que nos protege contra los agentes invasores: virus, bacterias, parásitos. Este sistema es el sistema inmunológico. Las vacunas son una forma de activar el sistema inmunológico y prepararlo para enfrentarse a un agente patógeno.¿Cómo funcionan las vacunas en el organismo? ¿Se pueden usar vacunas para prevenir todas las enfermedades? ¿Cuáles son los perjuicios de las vacunas?','2014-06-15 00:00:00','2022-03-30 00:00:00',900000,850000,0,6),(34,'Los teléfonos inteligentes.','El acceso a dispositivos móviles y a teléfonos inteligentes creció en los últimos años. Los adolescentes pasan gran parte de su tiempo usando estos dispositivos para explorar la Internet e intercambiar mensajes con sus amigos. En la adolescencia el cerebro experimenta ajustes en las conexiones neuronales.¿Cómo afectan los teléfonos inteligentes el desarrollo del cerebro durante esta etapa crítica del crecimiento?','2019-08-15 00:00:00','2024-02-15 00:00:00',2500000,1500000,1,7),(35,'Nuevos elementos en la Tierra','La tabla periódica actual contiene 118 elementos, 92 naturales y 26 artificiales. El elemento natural más pesado es el uranio (U, número atómico: 92). Los nuevos elementos se han logrado sintetizar en reactores nucleares. Así se sintetizaron todos los demás elementos pesados hasta el número atómico 118. ¿Es posible conseguir los elementos 119, 120 y más allá?','2017-06-05 00:00:00','2029-06-03 00:00:00',25000000,7834050,1,8),(36,'Los denisovanos','La especie humana Homo sapiens apareció en África hace menos de 200 000 años. Antes del humano moderno, existieron en Europa y Asia occidental otras especies de homínidos, como los Neandertales. Ambas especies convivieron en algún momento de la historia evolutiva. En el 2008 se descubrió un hueso de la mano de un homínido en la cueva de Denisova, en Siberia. Analizando el ADN de este hueso, se pudo constatar que este no pertenecía ni a un Neandertal ni a un humano moderno. ¿Cómo surgieron los denisovanos? ¿Cuándo y por qué desaparecieron de la Tierra? ¿Cómo eran estos homínidos?','2019-03-10 00:00:00','2029-10-21 00:00:00',2000000,750345,1,9),(37,'Los coches eléctricos.','Uno de los factores contribuyentes al cambio climático es el uso de combustibles fósiles, que liberan dióxido de carbono a la atmósfera, aumentando el efecto invernadero. ¿Son los carros eléctricos la solución al uso desmedido de combustibles fósiles? ¿Cómo funcionan los carros eléctricos? ¿Cuál es la huella ecológica de los carros eléctricos?','2021-04-15 00:00:00','2028-12-05 00:00:00',5000000,1450200,1,10),(38,'Gestión del dolor.','El dolor es una sensación desagradable producto de un daño. Existen medicamentos que nos ayudan a aliviar el dolor en ciertas condiciones y muchas veces desearíamos no experimentar dolor en lo absoluto. Entonces, ¿cuál es la función del dolor? ¿Podríamos vivir normalmente sin nunca experimentar el dolor? ¿Existen personas que de verdad no sienten dolor?','2020-05-10 00:00:00','2025-12-15 00:00:00',1250000,145020,1,11),(39,'Clonación humana.','Un clon es una copia exacta de un organismo vivo. El primer mamífero clonado fue una oveja, que se conoció como Dolly. Este evento trajo a la palestra el tema de la clonación del ser humano. ¿Cuáles son las técnicas de clonación? ¿Podría clonarse un humano? ¿Sería ético clonar humanos? ¿Para qué sería necesario clonar a una persona?','2021-02-02 00:00:00','2027-11-16 00:00:00',1000000,250020,1,12),(40,'Neuronas espejo.','El sistema nervioso está compuesto por una diversidad de neuronas, entre ellas las neuronas espejo. ¿Por qué se llaman así estas neuronas? ¿Qué hacen de especial?','2020-01-05 00:00:00','2029-12-15 00:00:00',2500000,1100000,1,13),(41,'Uso del cerebro humano.','Existe una creencia muy arraigada en el público general de que los seres humanos apenas utilizamos un 10 % de nuestro cerebro. ¿Será cierto esto? ¿Cómo se puede mostrar las zonas activas e inactivas del cerebro? ¿Qué es la plasticidad cerebral?','2019-02-10 00:00:00','2029-12-15 00:00:00',5000000,2000000,1,2),(42,'Los supergenes','Un gen es una porción de ADN, el material genético de los seres vivos. ¿Son los supergenes genes con poderes especiales? ¿Dónde se encuentran estos supergenes?','2015-07-23 00:00:00','2022-11-15 00:00:00',500000,200000,0,3),(43,'Ciencia en la cocina','La ciencia está a nuestro alrededor, incluso en la cocina: en los procesos de cocción, en la combinación de alimentos, en el desarrollo de sabores y olores. ¿Qué ejemplos podemos conseguir de técnicas científicas en la cocina?','2014-05-23 00:00:00','2021-10-15 00:00:00',500000,250000,0,1),(44,'Exoplanetas','Nuestro sistema solar comprende el Sol y los planetas que giran a su alrededor. Un exoplaneta es un planeta que orbita alrededor de otras estrellas. ¿Cómo se descubrieron los exoplanetas? ¿Cuántos exoplanetas se han descubierto?','2021-02-01 00:00:00','2025-02-01 00:00:00',1000000,500000,1,1),(45,'Carne de laboratorio','Conocemos que la carne viene de los animales. Sin embargo, la industria de la carne contribuye en un gran porcentaje a la emisión de gases invernaderos. Existen propuestas para \"crecer\" carne en los laboratorios para sustituir la carne animal. ¿Cómo se puede hacer carne artificial? ¿Tiene el mismo sabor que la carne animal? ¿Serías capaz de comer carne de laboratorio? ¿La carne artificial podrá resolver el problema de alimentación mundial?','2018-05-10 00:00:00','2025-05-01 00:00:00',10000000,3500000,1,5),(46,'Adaptabilidad genética de las especies marinas en gradientes naturales análogos a los océanos del futuro','El cambio climático provoca la acidificación y el aumento de la temperatura de los océanos. En DIVERGEN usaremos gradientes ambientales naturales, análogos a las variaciones derivadas del cambio climático, con el objetivo de interpretar y comprender el potencial adaptativo de las especies. Para ello, planeamos estudiar diferentes procesos intra- e inter-específicos en equinodermos a lo largo de dos gradientes; uno de pH en una surgencia submarina de CO2, y uno de temperatura a lo largo de la costa Atlántico-Mediterránea, junto con experimentos en acuario. Los objetivos de DIVERGEN se enmarcan en tres líneas conceptuales: a) comprender los procesos de divergencia genómica y adaptación local, plasticidad metabólica y de expresión génica de las especies a lo largo de gradientes de pH y temperatura (procesos intra-específicos); b) explorar el papel de la interacción de larvas hospedadoras con su microbiota simbionte en su adaptabilidad ante cambios ambientales (procesos inter-específicos); y c) investigar la importancia relativa de cada uno de estos procesos que determinan la adaptabilidad de las especies al cambio climático. Aplicaremos análisis de secuenciación masiva de última generación (NGS) junto con análisis metabólicos y ecológicos, correlacionados con datos ambientales. Usaremos técnicas de NGS para identificar genes potencialmente sometidos a selección, e investigaremos la plasticidad fenotípica mediante el análisis de los niveles de expresión génica con técnicas de RNAseq y de tasas metabólicas mediante consumo de oxígeno bajo diferentes condiciones de pH y temperatura. El papel de la microbiota simbionte en el desarrollo de las larvas, su composición y diversidad a diferentes valores de pH, se evaluará mediante el tratamiento con antibióticos y técnicas de metabarcoding. Una de las novedades de DIVERGEN es que no se limita a medir los efectos del cambio climático, sino que permitirá hacer predicciones sobre sus efectos a largo plazo.','2022-05-10 00:00:00','2025-05-01 00:00:00',10000000,1500000,1,4),(47,'Análisis de marcadores genéticos y epigenéticos de vulnerabilidad para el trastorno mental en niños y adolescentes expuestos amaltrato infantil: estudio multicéntrico','El maltrato infantil (MI) es un importante factor de riesgo para sufrir trastornos mentales en la infancia y en la adolescencia. Se han propuesto diferentes mecanismos neurobiológicos como mediadores de esta asociación, destacando la disfunción del eje Hipotálamico hipofisario adrenal (HHA), principal sistema de regulación del estrés, y los mecanismos genéticos y epigenéticos asociados. Objetivo general: Comprender los factores genéticos y epigenéticos que contribuyen al desarrollo de trastornos psiquiátricos o resiliencia en niños y adolescentes expuestos a MI e identificar los predictores neurobiológicos de mal pronóstico. Objetivo específico: estudiar 200 niños y adolescentes de 7 a 17 años, expuestos y no expuestos a MI: i) 130 con diagnostico psiquiátrico actual y ii) 70 sin diagnóstico. Método: Proyecto multicéntrico en el que participan seis servicios de psiquiatría infanto-juvenil de tres áreas geográficas españolas que aplicarán un protocolo común. Se estudiarán: i) el perfil clínico vital y actual (K-SADS-PL5, historia peri-postnatal, PAS, CGAS, CBCL, STAI), ii) los efectos de la pandemia COVID-19 (Escala de impacto) y experiencias adversas (LEIA, CMIE), iii) la historia de MI (CTQ, CECAQ2, criterios- CARM), iv) el apego y los estilos parentales (CAMIR, EMBU, GFES), iv) factores cognitivos y protectores individuales (IQ, TEIQUE, SSQ), y, v) la función del eje HHA ( basal y TSST-C). En una muestra final de 400 sujetos (200 reclutados en el proyecto actual +200 reclutados en un proyecto anterior (PI15-00097), se estimarán, i) los polygenic risk score de interés (PRSSCH, PRSMDD, PRSEDUCATION-ASSOCIATED, PRSINTERNALIZING), ii) un polyepigenetic score basado en genes candidatos del eje HHA (NR3C1, FKBP5 y SKA2) y, iii) se analizarán las interacciones y su relación con el fenotipo clínico.','2021-01-01 00:00:00','2025-12-31 00:00:00',20000000,150000,1,2);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 18:10:55
