CLASS zcl_mit_eml_travel_read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_mit_eml_travel_read IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lv_travel_id TYPE /DMO/I_Travel_U-TravelID VALUE '00000002'.

    READ ENTITY /DMO/I_Travel_U FIELDS ( TravelID
                                         AgencyID
                                         CustomerID
                                         BeginDate
                                         EndDate
                                         BookingFee
                                         TotalPrice
                                         CurrencyCode
                                         Memo
                                         Status
                                         LastChangedAt )
      WITH VALUE #( ( %key-TravelID = lv_travel_id ) )
      RESULT   DATA(lt_received_travel_data)
      FAILED   DATA(ls_failed).

    IF ls_failed IS INITIAL.
      out->write( lt_received_travel_data ).
    ELSE.
      out->write( ls_failed ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
