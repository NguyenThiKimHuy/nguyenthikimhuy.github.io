--CAU 1
--1a
create TABLE OE.CAU11A
(
    ID NUMBER NOT NULL,
    NAME CHAR(30)
);
--1b
CREATE SEQUENCE OE.CAU11SEQ
START WITH 1
INCREMENT BY 1;
--1c,d,e
SET SERVEROUTPUT ON;
declare name char(30);
begin
select cust_first_name into name
from OE.customers cust,OE.orders ord
where cust.customer_id=ord.customer_id
group by cust_first_name,cust_last_name
having count(cust.customer_id)> = all(select count(cust.customer_id)
                    from OE.customers cust,OE.orders ord
                    where cust.customer_id=ord.customer_id
                    group by cust_first_name,cust.customer_id );
exception
when too_many_rows then
insert into OE.CAU11A values(OE.CAU11SEQ.Nextval,name);
end;
select * from OE.CAU11A;
--1f
create TABLE OE.CAU11f
(
    ID NUMBER NOT NULL,
    NAME CHAR(30)
);
CREATE SEQUENCE OE.CAU11FSEQ
START WITH 1
INCREMENT BY 1;
SET SERVEROUTPUT ON;
declare V_name char(30);
begin
select product_name into V_name
from OE.PRODUCT_INFORMATION pd,OE.order_items oi
where  pd.product_id=oi.product_id
group by product_name
having count(pd.product_id)> = all(select count(pd.product_id)
                    from OE.product_information pd,OE.order_items oi
                    where pd.product_id=oi.product_id
                    group by  product_name,pd.product_id);
insert into OE.CAU11f values(OE.CAU11FSEQ.Nextval,V_name);
end;
select * from OE.CAU11f;
--cau2
declare V_Makh number(6,0);
        V_Ten VARCHAR2(20 BYTE);
        V_Dem int;
Begin
    V_Makh := &V_Makh;
    select CUST_FIRST_NAME,count(cust.CUSTOMER_ID) into V_Ten,V_Dem
    from OE.CUSTOMERS cust,OE.ORDERS ord
    where cust.CUSTOMER_ID=ord.CUSTOMER_ID and cust.Customer_id=V_Makh
    group by CUST_FIRST_NAME;
    dbms_output.put_line('Ten:   ' || V_Ten || '   SL:     ' || V_Dem);
    exception
        when no_data_found then
        insert into OE.CUSTOMERS values (V_Makh,'Chi Dinh','Cao');
end;
--bai 2: cau truc dieu khien
--cau 1
--cau2
declare V_Makh number(6,0);
        V_Dem int;
Begin
    V_Makh := &V_Makh;
    select count(cust.CUSTOMER_ID) into V_Dem
    from OE.CUSTOMERS cust,OE.ORDERS ord
    where cust.CUSTOMER_ID=ord.CUSTOMER_ID and cust.Customer_id=V_Makh and ORDER_MODE='direct';
    if V_Dem>=3 then
       dbms_output.put_line('Day la khach hnag tiem nang');
    else 
       dbms_output.put_line('Khach hang co:  '|| V_Dem || '   don dat hang');
    end if;
    exception
        when no_data_found then
        dbms_output.put_line('Khong co khach hang ban vua nhap');
end;

select * from OE.CUSTOMERS;
