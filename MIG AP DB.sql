/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/19/2022 1:51:32 PM                         */
/*==============================================================*/


alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_ASSETS;

alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_SPARE_PA;

drop table if exists ASSETS;


alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_ASSETS;

alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_SPARE_PA;

drop table if exists CONFIGURATION;

drop table if exists SPARE_PARTS;

/*==============================================================*/
/* Table: ASSETS                                                */
/*==============================================================*/
create table ASSETS
(
   ASSET_CODE           varchar(10) not null  comment '',
   ASSET_NAME           varchar(20) not null  comment '',
   ASSET_TYPE           varchar(15) not null  comment '',
   ASSET_LOCATION       varchar(50) not null  comment '',
   ASSET_CONDITION      text not null  comment '',
   primary key (ASSET_CODE)
);

/*==============================================================*/
/* Table: CONFIGURATION                                         */
/*==============================================================*/
create table CONFIGURATION
(
   ASSET_CODE           varchar(10) not null  comment '',
   SPAREPART_CODE       varchar(10) not null  comment '',
   primary key (ASSET_CODE, SPAREPART_CODE)
);

/*==============================================================*/
/* Table: SPARE_PARTS                                           */
/*==============================================================*/
create table SPARE_PARTS
(
   SPAREPART_CODE       varchar(10) not null  comment '',
   SPAREPART_NAME       varchar(20) not null  comment '',
   SPAREPART_TYPE       varchar(15) not null  comment '',
   SPAREPART_PRICE      float(8,2) not null  comment '',
   SPAREPART_SUPPLIER   varchar(15) not null  comment '',
   SPAREPART_CONDIRION  text not null  comment '',
   primary key (SPAREPART_CODE)
);

alter table CONFIGURATION add constraint FK_CONFIGUR_CONFIGURA_ASSETS foreign key (ASSET_CODE)
      references ASSETS (ASSET_CODE) on delete restrict on update restrict;

alter table CONFIGURATION add constraint FK_CONFIGUR_CONFIGURA_SPARE_PA foreign key (SPAREPART_CODE)
      references SPARE_PARTS (SPAREPART_CODE) on delete restrict on update restrict;

