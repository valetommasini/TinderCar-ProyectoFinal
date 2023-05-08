/*Creacion de base de datos*/
create database TinderCar;

drop database tindercar;

use TinderCar;

/*Se crea tabla de administrador*/
create table adm(
/*Clave primaria que si o si se tiene que cargar valor*/
id_adm int not null unique AUTO_INCREMENT,
nom_adm varchar (25),
apell_adm varchar (25),
/*Cada administrador tiene un cargo distinto*/
rol_adm varchar (25),
primary key (id_adm ) 
);

/*Se crea tabla de usuario*/
create table usuario(
/*Clave primaria que si o si se tiene que cargar valor*/
id_cli int not null unique AUTO_INCREMENT,
nom_cli varchar (25),
apell_cli varchar (25),
direccion_cli varchar (25),
tel_cli  varchar (25),
dni_cli int,
/*Cada usuario va a tener un administrador que lo supervisa o ayuda segun necesite*/
id_adm1 int,
primary key (id_cli) ,
/*Se declara clave foranea para asociarle el admin que le corresponda*/
foreign key (id_adm1) references adm (id_adm)
);


/*Se crea tabla de prestador del estacionamiento*/

create table prestador(
/*Clave primaria que si o si se tiene que cargar valor*/
id_pres int not null unique AUTO_INCREMENT,
nom_pres varchar (25),
apell_pres varchar (25),
tel_pres varchar (25),
dni_pres int,

/*Cada prestador va a tener un administrador que lo supervisa o ayuda segun necesite*/
id_adm1 int,
primary key (id_pres),

/*Se declara clave foranea para asociarle el admin que le corresponda*/
foreign key (id_adm1) references adm (id_adm)
);

/*Se crea tabla con los datos del auto del usuario*/
create table auto(
/*Clave primaria que si o si se tiene que cargar valor*/
id_auto int not null unique AUTO_INCREMENT,
patente_au  varchar (12),
modelo_au  varchar (25),
seguro_au varchar (25),
color_au varchar (25),
id_cli1 int,
primary key (id_auto),
foreign key (id_cli1) references usuario (id_cli)
);

/*Se crea tabla con los datos del estacionamiento*/
create table estacionamiento(

/*Clave primaria que si o si se tiene que cargar valor*/
id_est int not null unique AUTO_INCREMENT,
img_est blob,
descr_est varchar (50),
ubi_est varchar (25),
/*Se declara foranea el id del prestador para poder conocer a quien corresponde el mismo*/
id_pres1 int,
primary key (id_est),
foreign key (id_pres1) references prestador (id_pres)
);

create table precio(
id_precio int not null,
precio_est float,
tiempo_est varchar (25),
id_est1 int,

primary key(precio_est),
foreign key (id_est1) references estacionamiento (id_est)
);

/*Se crea tabla para los datos del ticket para ambos (usuario y prestador)*/
create table ticket(

/*Clave primaria que si o si se tiene que cargar valor*/
id_ticket int not null unique AUTO_INCREMENT,
fecha_tick date,
monto_tick float,
id_est1 int,
/*Tipo de factura A B */
fact_tick  varchar (20),
id_pres1 int,
id_cli1 int,
primary key (id_ticket),
foreign key (id_pres1) references prestador (id_pres),
foreign key (id_cli1) references usuario (id_cli),
foreign key (id_est1) references estacionamiento (id_est)
/*foreign key (serv_extr1) references estacionamiento (serv_extr)*/
);
/*Se crea tabla para cargar los datos de la forma de pago que va a realizar el usuario*/
create table formpag(
/*Clave primaria que si o si se tiene que cargar valor*/
id_formp int not null unique AUTO_INCREMENT,
efect_formp varchar (25),
tarj_formp varchar (25),
merc_formp varchar (25),
otro_form varchar (25),
id_tick1 int,
primary key (id_formp),
foreign key (id_tick1) references ticket (id_ticket)
);

create table sesion(
email_cli varchar(25),
pass_cli varchar(25),
id_cli1 int ,
foreign key (id_cli1) references usuario (id_cli)

);

create table elecciones_us(
id_elec_us int not null unique auto_increment,

fk_est1 int,
fk_precio1 float,

foreign key (fk_est1) references estacionamiento (id_est),
foreign key (fk_precio1) references precio (precio_est)
);

/* En caso de agregar servicios extras para que el usuario puede elegir creemos que debemos agregar una nueva tabla con las opciones. Y en este caso deberíamos agregar una fk en la tabla de elecciones de usuario */

/*
create table servicios(
id_serv int not null unique auto_increment,
ser_extr1 varchar (25),
ser_extr2 varchar (25),
ser_extr3 varchar (25),
);
*/
