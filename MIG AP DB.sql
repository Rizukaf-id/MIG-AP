/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/18/2022 8:19:25 PM                         */
/*==============================================================*/


alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_ASSETS;

alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_HARDWARE;

drop table if exists ASSETS;


alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_ASSETS;

alter table CONFIGURATION 
   drop foreign key FK_CONFIGUR_CONFIGURA_HARDWARE;

drop table if exists CONFIGURATION;

drop table if exists HARDWARE;

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
   HARDWARE_CODE        varchar(10) not null  comment '',
   primary key (ASSET_CODE, HARDWARE_CODE)
);

/*==============================================================*/
/* Table: HARDWARE                                              */
/*==============================================================*/
create table HARDWARE
(
   HARDWARE_CODE        varchar(10) not null  comment '',
   HARDWARE_NAME        varchar(20) not null  comment '',
   HARDWARE_TYPE        varchar(15) not null  comment '',
   HARDWARE_PRICE       float(8,2) not null  comment '',
   HARDWARE_SUPPLIER    varchar(15) not null  comment '',
   HARDWARE_CONDIRION   text not null  comment '',
   primary key (HARDWARE_CODE)
);

alter table CONFIGURATION add constraint FK_CONFIGUR_CONFIGURA_ASSETS foreign key (ASSET_CODE)
      references ASSETS (ASSET_CODE) on delete restrict on update restrict;

alter table CONFIGURATION add constraint FK_CONFIGUR_CONFIGURA_HARDWARE foreign key (HARDWARE_CODE)
      references HARDWARE (HARDWARE_CODE) on delete restrict on update restrict;

