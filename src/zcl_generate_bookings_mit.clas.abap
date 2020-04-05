CLASS zcl_generate_bookings_mit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_bookings_mit IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: lt_bookings TYPE TABLE OF ztbooking_mit.

*    read current timestamp
    GET TIME STAMP FIELD DATA(lv_tsl).
*   fill internal table (itab)
    lt_bookings = VALUE #(
        ( booking  = '1' customername = 'Customer1' numberofpassengers = '3' emailaddress = 'tester1@flight.example.com'
          country = 'Russia' dateofbooking ='20200213125959' dateoftravel ='20200213125959' cost = '54600' currencycode = 'RUB' lastchangedat = lv_tsl )
        ( booking  = '2' customername = 'Customer2' numberofpassengers = '1' emailaddress = 'tester2@flight.example.com'
          country = 'USA' dateofbooking ='20200113125959' dateoftravel ='20200113125959' cost = '1373' currencycode = 'USD' lastchangedat = lv_tsl )
     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ztbooking_mit.
*   insert the new table entries
    INSERT ztbooking_mit FROM TABLE @lt_bookings.

*   check the result
    SELECT * FROM ztbooking_mit INTO TABLE @lt_bookings.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
