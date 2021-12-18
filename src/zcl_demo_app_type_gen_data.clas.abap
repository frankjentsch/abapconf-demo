CLASS zcl_demo_app_type_gen_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_demo_app_type_gen_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA app_types TYPE STANDARD TABLE OF zdemo_app_type WITH EMPTY KEY.

    GET TIME STAMP FIELD DATA(timestamp).

    TRY.
        app_types = VALUE #( ( app_type_uuid         = cl_system_uuid=>create_uuid_x16_static( )
                               app_type_name         = 'Console Application'
                               last_changed_at       = timestamp
                               local_last_changed_at = timestamp ) ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    DELETE FROM zdemo_app_type.
    INSERT zdemo_app_type FROM TABLE @app_types.
    COMMIT WORK.

    out->write( |{ sy-dbcnt } entries inserted| ).

  ENDMETHOD.
ENDCLASS.
