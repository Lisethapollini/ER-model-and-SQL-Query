--- creating a schema called liseth_apollini ---
create schema liseth_apollini authorization ugtvarrn;

--- creating tables and adding their PK ---
--- table COLORS -- 
create table liseth_apollini.colors (
	id_color integer not null, -- PK
	color_name varchar(20) not null
);
	
alter table liseth_apollini.colors
	add constraint pk_color primary key (id_color);

--- table MODELS ---
create table liseth_apollini.models (
	id_model integer not null, -- PK
	model_name varchar(30) not null,
	id_brand integer not null  -- FK
);

alter table liseth_apollini.models
	add constraint pk_model primary key (id_model);
	
--- table BRANDS ---
create table liseth_apollini.brands (
	id_brand integer not null, -- PK
	brand_name varchar(30) not null,
	id_holding integer not null -- FK
);

alter table liseth_apollini.brands
	add constraint pk_brand primary key (id_brand);
	
--- table HOLDINGS ---
create table liseth_apollini.holdings (
	id_holding integer not null, -- PK
	holding_name varchar(30) not null
);

alter table liseth_apollini.holdings
	add constraint pk_holding primary key (id_holding);
	
--- table VEHICLES ---
create table liseth_apollini.vehicles (
	id_vehicle integer not null, -- PK
	id_model integer not null, -- FK
	id_color integer not null, -- FK 
	vehicle_plate varchar(10) not null,
	dt_purchase date not null, 
	total_km integer not null,
	description varchar(100) null
);

alter table liseth_apollini.vehicles
	add constraint pk_vehicle primary key (id_vehicle);
	
--- table insurance COMPANIES ---
create table liseth_apollini.insurance_companies (
	id_insurance_com integer not null, -- PK
	insurance_com_name varchar(30) not null
);

alter table liseth_apollini.insurance_companies
	add constraint pk_insurance_com primary key (id_insurance_com);
	
--- table INSURANCE_POLCIES ---
create table liseth_apollini.insurance_policies (
	policy_number integer not null, -- PK
	id_insurance_com integer not null, -- PK,FK
	id_vehicle integer not null, -- FK
	dt_start date not null, 
	dt_end date not null,
	description varchar(100) null
);

alter table liseth_apollini.insurance_policies
	add constraint pk_policies primary key (policy_number, id_insurance_com);

--- table HIST_INSPECTIONS --- 
create table liseth_apollini.hist_inspections (
	id_vehicle integer not null, -- PK,FK
	dt_inspection date not null, -- PK
	id_inspection integer not null, -- FK 
	km_inspection integer not null,
	cost_inspection integer not null,
	id_currency integer not null -- FK
);

alter table liseth_apollini.hist_inspections
	add constraint pk_hist_inspection primary key (id_vehicle, dt_inspection);

--- table INSPECTIONS ---
create table liseth_apollini.inspections (
	id_inspection integer not null, -- PK
	inspection_name varchar(30) not null,
	description varchar(100) null
);

alter table liseth_apollini.inspections
	add constraint pk_inspection primary key (id_inspection);

--- table CURRENCY ---
create table liseth_apollini.currencies (
	id_currency integer not null, -- PK
	currency_name varchar(30) not null
);

alter table liseth_apollini.currencies
	add constraint pk_currency primary key (id_currency);

--- creating FKs --- 
--- table MODELS ---
alter table liseth_apollini.models
	add constraint fk_brand foreign key (id_brand)
	references liseth_apollini.brands (id_brand);

--- table BRANDS --- 
alter table liseth_apollini.brands
	add constraint fk_holding foreign key (id_holding)
	references liseth_apollini.holdings (id_holding);

--- table VEHICLES --- 
alter table liseth_apollini.vehicles
	add constraint fk_model foreign key (id_model)
	references liseth_apollini.models (id_model);
	
alter table liseth_apollini.vehicles
	add constraint fk_color foreign key (id_color)
	references liseth_apollini.colors (id_color);
	
--- table INSURANCE_POLICIES ---
alter table liseth_apollini.insurance_policies
	add constraint fk_id_insurance_com foreign key (id_insurance_com)
	references liseth_apollini.insurance_companies (id_insurance_com);
	
alter table liseth_apollini.insurance_policies
	add constraint fk_vehicle foreign key (id_vehicle)
	references liseth_apollini.vehicles (id_vehicle);

--- table HIST_INSPECTIONS ---
alter table liseth_apollini.hist_inspections
	add constraint fk_vehicle_ins foreign key (id_vehicle)
	references liseth_apollini.vehicles (id_vehicle);

alter table liseth_apollini.hist_inspections
	add constraint fk_inspections foreign key (id_inspection)
	references liseth_apollini.inspections (id_inspection);

alter table liseth_apollini.hist_inspections
	add constraint fk_currency foreign key (id_currency)
	references liseth_apollini.currencies (id_currency);

--- uploading data into tables --- 
--- table CURRENCIES ---
insert into liseth_apollini.currencies 
	(id_currency, currency_name)
	values('001','Euros');

insert into liseth_apollini.currencies 
	(id_currency, currency_name)
	values('002','Dollars');

insert into liseth_apollini.currencies 
	(id_currency, currency_name)
	values('003','Pounds');

--- Color table ---
insert into liseth_apollini.colors
	(id_color, color_name)
	values('001','Blue');

insert into liseth_apollini.colors
	(id_color, color_name)
	values('002','Red');

insert into liseth_apollini.colors
	(id_color, color_name)
	values('003','Black');

insert into liseth_apollini.colors
	(id_color, color_name)
	values('004','White');

insert into liseth_apollini.colors
	(id_color, color_name)
	values('005','Silver');

--- Holding table --- 
insert into liseth_apollini.holdings
	(id_holding, holding_name)
	values('001','HONDA');	

insert into liseth_apollini.holdings
	(id_holding, holding_name)
	values('002','TOYOTA');	

insert into liseth_apollini.holdings
	(id_holding, holding_name)
	values('003','BMW GROUP');	

--- Brands table --- 
insert into liseth_apollini.brands
	(id_brand, brand_name, id_holding)
	values('001','Acura', '001');

insert into liseth_apollini.brands
	(id_brand, brand_name, id_holding)
	values('002','Honda', '001');

insert into liseth_apollini.brands
	(id_brand, brand_name, id_holding)
	values('003','Lexus', '002');

insert into liseth_apollini.brands
	(id_brand, brand_name, id_holding)
	values('004','Toyota', '002');

insert into liseth_apollini.brands
	(id_brand, brand_name, id_holding)
	values('005','Mini', '003');

insert into liseth_apollini.brands
	(id_brand, brand_name, id_holding)
	values('006','Rolls Royce', '003');

--- Models tables ---
insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('001','Integra','001');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('002','TLX','001');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('003','RDX','001');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('004','Accord','002');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('005','Civic','002');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('006','Passport','002');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('007','NX','003');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('008','UX','003');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('009','CT','003');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('010','Land Cruise','004');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('011','Corolla','004');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('012','Prius','004');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('013','Cooper','005');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('014','Cooper S','005');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('015','Cooper SE','005');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('016','Cullinan','006');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('017','Spectre','006');

insert into liseth_apollini.models
	(id_model, model_name, id_brand)
	values('018','Phanton','006');

--- Insurance companies table ---
insert into liseth_apollini.insurance_companies
	(id_insurance_com, insurance_com_name)
	values('001','Alliance');

insert into liseth_apollini.insurance_companies
	(id_insurance_com, insurance_com_name)
	values('002','Verti');

insert into liseth_apollini.insurance_companies
	(id_insurance_com, insurance_com_name)
	values('003','AXA');

--- Vehicles table ---
insert into liseth_apollini.vehicles
	(id_vehicle, id_model, id_color, vehicle_plate, dt_purchase, total_km, description)
	values('001','001','001','XYZ345','2020-01-01','5000','No description');

insert into liseth_apollini.vehicles
	(id_vehicle, id_model, id_color, vehicle_plate, dt_purchase, total_km, description)
	values('002','005','002','XLF245','2019-02-10','7000','No description');

insert into liseth_apollini.vehicles
	(id_vehicle, id_model, id_color, vehicle_plate, dt_purchase, total_km, description)
	values('003','010','002','FRT265','2020-04-11','10000','No description');

insert into liseth_apollini.vehicles
	(id_vehicle, id_model, id_color, vehicle_plate, dt_purchase, total_km, description)
	values('004','018','003','TYU098','2020-01-11','12000','No description');

insert into liseth_apollini.vehicles
	(id_vehicle, id_model, id_color, vehicle_plate, dt_purchase, total_km, description)
	values('005','008','001','FHT007','2020-07-10','8000','No description');

--- Insurance policies table --- 
insert into liseth_apollini.insurance_policies
	(policy_number, id_insurance_com, id_vehicle, dt_start, dt_end, description)
	values('0111102','001','001','2020-03-01','2023-03-01','No description');
	
insert into liseth_apollini.insurance_policies
	(policy_number, id_insurance_com, id_vehicle, dt_start, dt_end, description)
	values('0111103','002','002','2020-05-01','2023-05-01','First insurance');
	
insert into liseth_apollini.insurance_policies
	(policy_number, id_insurance_com, id_vehicle, dt_start, dt_end, description)
	values('0111104','002','003','2020-07-11','2023-07-11','No description');
	
insert into liseth_apollini.insurance_policies
	(policy_number, id_insurance_com, id_vehicle, dt_start, dt_end, description)
	values('0111105','003','004','2020-08-11','2023-08-11','No description');
	
--- Inspections table ---
insert into liseth_apollini.inspections
	(id_inspection, inspection_name, description)
	values('01','1000 km inspection','1000 km or 1 year after purchase');

insert into liseth_apollini.inspections
	(id_inspection, inspection_name, description)
	values('02','2000 km inspection','2000 km or 2 year after purchase');

insert into liseth_apollini.inspections
	(id_inspection, inspection_name, description)
	values('03','3000 km inspection','3000 km or 3 year after purchase');

insert into liseth_apollini.inspections
	(id_inspection, inspection_name, description)
	values('04','Tires and oil checked','Per requested');

--- Hist_inspections table ---
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('001','2021-01-02','01','1000','100', '01');	
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('002','2021-02-03','01','1000','110', '01');
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('003','2021-10-05','01','1100','200', '02');
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('004','2021-01-12','01','3000','100', '03');
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('001','2021-08-02','02','2500','100', '01');	
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('002','2021-06-03','03','5000','110', '01');
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('003','2021-11-05','02','3050','200', '02');
	
insert into liseth_apollini.hist_inspections
	(id_vehicle, dt_inspection, id_inspection, km_inspection, cost_inspection, id_currency)
	values('004','2022-07-12','02','3100','100', '03');
