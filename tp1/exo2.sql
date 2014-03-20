drop table LIGNE_FACTURE;
drop table FACTURE;
drop table CLIENT;
drop table PRIX_DATE;
drop table PRODUIT;

drop sequence client_seq;
create sequence client_seq start with 1 INCREMENT BY 1 NOMAXVALUE;
create table CLIENT( num number, nom varchar2(20), prenom varchar2(20), adresse varchar2(300), date_nais date, sexe varchar2(5) check (sexe in ('homme','femme')), constraint PK_CLIENT primary key (num) );

drop sequence produit_seq;
create sequence produit_seq start with 1  INCREMENT BY 1 NOMAXVALUE; 
create table PRODUIT (num number, designation varchar(300), stock number, constraint PK_PRODUIT primary key (num)); 

drop sequence prix_seq;
create sequence prix_seq start with 1  INCREMENT BY 1 NOMAXVALUE; 
create table PRIX_DATE (num number, produit number, date_du_prix date, prix number, remise number, constraint PK_PRIX primary key (num),constraint FK_PRODUIT foreign key (produit) references PRODUIT(num)); 


drop sequence facture_seq;
create sequence facture_seq start with 1  INCREMENT BY 1 NOMAXVALUE;
create table FACTURE ( num number, client number, constraint PK_FACTURE primary key (num), date_etabli date, constraint FK_FACTURE_CLIENT foreign key (client) references CLIENT(num) );

create table LIGNE_FACTURE (facture number, produit number, qte number, id_prix number, constraint FK_LIGNE_FACT_FACTURE foreign key (facture) references FACTURE(num), constraint FK_LIGNE_FACT_PRODUIT foreign key (produit) references PRODUIT(num),constraint FK_PRODUIT_PRIX foreign key (id_prix) references PRIX_DATE(num), constraint PK_LIGNE_FACT primary key (facture, produit) );

INSERT INTO CLIENT VALUES(client_seq.nextval,'Futterkiste','Alfreds','Obere Str. 57,12209,Berlin,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');


INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chai.Boissons.Thé',			703	);


INSERT INTO prix_date VALUES(prix_seq.nextval,	2	,	TO_DATE('01/01/2005','mm/dd/yy')	,	72	,	0	);

INSERT INTO FACTURE VALUES(facture_seq.nextval,	64	,	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2453372,2453372+3*364)),'J')	);


INSERT INTO LiGNE_FACTURE VALUES(	2	,	2	,	45	,	2	);