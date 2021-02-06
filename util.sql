create table proveedor (
codpro char(3) constraint codpro_no_nulo not null constraint codpro_clave_primaria primary key,
nompro char(30) constraint nompro_no_nulo not null,
status numeric constraint status_entre_1_y_10 check (status>=1 and status<=10),
ciudad char(15));

create table pieza(
codp char(3) constraint codp_no_nulo not null constraint codp_clave_primaria primary key,
nompie char(30) constraint nompie_no_nulo not null,
color char(16),
peso numeric(5,2) constraint peso_entre_0_y_100 check(peso>=0 and peso<=100),
ciudad char(15)
);

create table proyecto(
codpj char(3) constraint codpj_no_nulo not null constraint codpj_clave_primaria primary key,
nompj char(20) constraint nompj_no_nulo not null,
ciudad char(15)
);

create table ventas(
codpro char(3),
codp char(3),
codpj char(3),
cantidad numeric(4),
constraint clave_primaria primary key (codpro,codp,codpj,cantidad),
constraint codpro_clave_externa_proveedor FOREIGN KEY(codpro) references proveedor(codpro),
constraint codp_clave_externa_pieza FOREIGN KEY(codp) references pieza(codp),
constraint codpj_clave_externa_proyecto FOREIGN KEY(codpj) references proyecto(codpj)
);

insert into pieza values ('P1','tuerca',  'rojo', 20,'Madrid');
insert into pieza values ('P2','tornillo','verde',30,'Londres');
insert into pieza values ('P3','arandela','azul', 10,'Sevilla');
insert into pieza values ('P4','tuerca',  'verde',40,'Granada');
insert into pieza values ('P5','tornillo','azul', 10,'Paris');
insert into pieza values ('P6','tuerca',  'azul', 60,'Madrid');
insert into pieza values ('P7','tornillo','rojo', 40,'Sevilla');
insert into pieza values ('P8','arandela','rojo', 30,'Londres');
insert into pieza values ('P9','tuerca',  'azul', 70,'Granada');
insert into pieza values ('P10','tuerca',  'azul', 20,'Madrid');
insert into pieza values ('P11','tornillo','rojo', 70,'Londres');
insert into pieza values ('P12','arandela','verde',20,'Sevilla');
insert into pieza values ('P13','tuerca',  'rojo', 50,'Granada');
insert into pieza values ('P14','tornillo','rojo', 20,'Paris');
insert into pieza values ('P15','tuerca',  'verde',80,'Madrid');

insert into proveedor values ('S1','Christian Morillas'	,2,'Madrid');
insert into proveedor values ('S2','Miguel Molina'	,3,'Londres');
insert into proveedor values ('S3','Gustavo Fernandez' 	,3,'Sevilla');
insert into proveedor values ('S4','Antonio Delgado'   	,4,'Madrid');
insert into proveedor values ('S5','Nora Roman'   	,2,'Paris');
insert into proveedor values ('S6','Victor Monreal' 	,6,'Madrid');
insert into proveedor values ('S7','Juan Montero'	,3,'Granada');
insert into proveedor values ('S8','Miguel Gonzalez'  	,1,'Madrid');
insert into proveedor values ('S9','Luis Granados'     	,5,'Granada');
insert into proveedor values ('S10','Angel Garcia'   	,5,'Granada');
insert into proveedor values ('S11','Javier Cucharero'	,2,'Madrid');
insert into proveedor values ('S12','Felipe Lorente'	,3,'Londres');
insert into proveedor values ('S13','Ruben Garcia'  	,3,'Sevilla');
insert into proveedor values ('S14','Alfonso Ruiz'  	,4,'Madrid');
insert into proveedor values ('S15','Anissa El-Khattabi',2,'Paris');

insert into proyecto values ('J1','Proyecto01','Madrid');
insert into proyecto values ('J2','Proyecto02','Granada');
insert into proyecto values ('J3','Proyecto03','Madrid');
insert into proyecto values ('J4','Proyecto04','Madrid');
insert into proyecto values ('J5','Proyecto05','Madrid');
insert into proyecto values ('J6','Proyecto06','Granada');
insert into proyecto values ('J7','Proyecto07','Granada');
insert into proyecto values ('J8','Proyecto08','Granada');
insert into proyecto values ('J9','Proyecto09','Londres');
insert into proyecto values ('J10','Proyecto10','Londres');
insert into proyecto values ('J11','Proyecto11','Granada');
insert into proyecto values ('J12','Proyecto12','Madrid');
insert into proyecto values ('J13','Proyecto13','Madrid');
insert into proyecto values ('J14','Proyecto14','Madrid');
insert into proyecto values ('J15','Proyecto15','Granada');

insert into ventas values ('S1','P10','J2',800);
insert into ventas values ('S2','P1','J6',020);
insert into ventas values ('S11','P7','J10',230);
insert into ventas values ('S8','P2','J1',750);
insert into ventas values ('S5','P11','J1',090);
insert into ventas values ('S2','P2','J9',770);
insert into ventas values ('S6','P9','J5',290);
insert into ventas values ('S1','P14','J13',330);
insert into ventas values ('S8','P8','J9',410);
insert into ventas values ('S3','P8','J10',080);
insert into ventas values ('S2','P4','J6',540);
insert into ventas values ('S10','P7','J9',260);
insert into ventas values ('S6','P11','J11',590);
insert into ventas values ('S10','P13','J15',410);
insert into ventas values ('S1','P8','J2',310);
insert into ventas values ('S6','P10','J7',290);
insert into ventas values ('S6','P15','J7',410);
insert into ventas values ('S1','P4','J1',210);

