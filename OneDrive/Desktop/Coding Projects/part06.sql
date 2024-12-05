create table donors (
    "Name" varchar(30),
    Birth_Date date,
    Gender varchar(20),
    Blood_Type varchar(10),
    Contact_Info varchar(30),
    Eligibility varchar(10),
    Donation_Date DATE,
    Appointment_Time timestamp not null,
    Appointment_Date date not null,
    Donation_Date1 date not null
);
alter table Donors
    add constraint Donors_Appointment_fk FOREIGN KEY ( Appointment_Time )
    references Appointment ("Time");
alter table donors
    add constraint Donors_appointment_fk2 FOREIGN KEY ( Appointment_Date )
    references Appointment ("Date");
alter table donors 
    add constraint donors_donation_fk FOREIGN KEY (Donation_Date1)
    references Blood_Donation (Donation_Date);
create unique index Donation_ID on Donors ("Name", Donation_Date);

create table Appointment(
    Appointment_Date date,
    Appointment_Time timestamp,
    "Name" varchar(30) not null,
    Donation_Date date not null
);
alter table Appointment
    add constraint Appointment_name_fk FOREIGN KEY ("Name")
    references Donors ("Name");
alter table Appointment
    add constraint Appointment_donation_fk FOREIGN KEY (Donation_Date)
    references Blood_Donation (Donation_Date);
create unique index Appointment_ID on Appointment (Appointment_Time, Appointment_Date);

create table Blood_Donation (
    Blood_type varchar(10),
    Donation_Date date,
    Volume number
);
create unique index Donation_ID on Blood_Donation (Donation_Date);

create table Blood_Delivery(
    Blood_Type varchar(10),
    Delivery_Date date,
    Volume number
);

create table Employee(
    "Name" varchar(30),
    Schedule varchar(50),
    Contact_info varchar(30),
    Salary NUMERIC,
    Storage_Location varchar(20) not null,
    Appointment_Time timestamp not null,
    Appointment_Date date not null
);
alter table Employee
    add constraint Employee_Storage_FK FOREIGN KEY (Storage_Location)
    references Blood_Inventory (Storage_Location);
alter table Employee
    add constraint Employee_appointment_fk FOREIGN KEY (Appointment_Time)
    references Appointment (Appointment_Time);
alter table Employee
    add constraint Employee_Appointment_fk2 FOREIGN KEY (Appointment_Date)
    references Appointment (Appointment_Date);
alter table Employe
alter table Employee
    add constraint employee_pk PRIMARY KEY ("Name");
alter table employee
    add constraint employee_pk2 PRIMARY KEY (Contact_info);

create table Blood_Transportation (
    Delivery_Schedule varchar(30),
    Temperature number,
    Secrurely_Packaged varchar(10)
);
create unique index Tracking_ID on Blood_Transportation (Delivery_Schedule);

create table Healthcare_Facility(
    "Name" varchar(30),
    "Address" varchar(50),
    Quality_Standards varchar(20),
    Contact_Info varchar(30)
);
create unique index Facility_ID on Healthcare_Facility ("Name", "Address", Contact_Info);

create table Blood_Inventory(
    Volume number,
    Blood_Type varchar(10),
    Storage_Location varchar(20),
    Temperature_Control varchar(20),
    Testing varchar(20),
    "Name" varchar(30) not null,
    Contact_Info varchar(30) not null
);
alter table Blood_Inventory
    add constraint Blood_Inventory_fk1 FOREIGN KEY ("Name")
    references Employee ("Name");
alter table Blood_Inventory
    add constraint Blood_Inventory_fk2 FOREIGN KEY (Contact_Info)
    references Employee (Contact_Info);
create unique index Inventory_ID on Blood_Inventory (Storage_Location);

create table Blood_Testing(
    Test_Date date,
    Test_Criteria varchar(20),
    Test_Result varchar(10),
    Approval_Status varchar(10)
);

create table Advertising(
    Advertising_Team varchar(20),
    Advertisements varchar(50),
    "Cost" varchar(20),
    Start_Date date,
    End_Date date,
    Advertisement_Content varchar(50)
);
create unique index Ad_Campagin_ID on Advertising (Advertising_Team, Advertisements, Start_Date, End_Date, Advertisement_Content);

create table Finances(
    Payments varchar(20),
    Payment_Method varchar(15),
    Transaction_Category varchar(15),
    Transaction_Date date,
    Transaction_Cost varchar(20),
    Advertising_Team varchar(20) not null,
    Advertisements varchar(50) not null,
    Start_Date date not null,
    End_Date date not null,
    Advertisement_Content varchar(50)
);
alter table finances
    add constraint finances_advertising_fk FOREIGN KEY (Advertising_Team)
    references Advertising (Advertising_Team);
alter table finances
    add constraint finances_advertising_fk2 FOREIGN KEY (Advertisements)
    references Advertising (Advertisements);
alter table Finances
    add constraint finances_date_fk FOREIGN KEY (Start_Date)
    references advertising (Start_Date);
alter table finances
    add constraint finances_date_fk2 FOREIGN KEY (End_Date)
    references advertising (End_Date);
alter table finances
    add constraint finances_advertising_fk3 FOREIGN KEY (Advertisement_Content)
    references advertising (Advertisement_Content);

select volume, blood_type, storage_location,
count(volume) over (partition by blood_type) as AvgBlood_Type
from Blood_Inventory; 