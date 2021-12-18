CLASS zcl_demo_app_type_http DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_demo_app_type_http IMPLEMENTATION.
  METHOD if_http_service_extension~handle_request.

    SELECT app_type_name FROM zdemo_app_type INTO TABLE @DATA(app_types).

    DATA(json_writer) = cl_sxml_string_writer=>create( type = if_sxml=>co_xt_json ).

    CALL TRANSFORMATION id
      SOURCE root = app_types
      RESULT XML json_writer.

    response->set_binary( json_writer->get_output( ) ).
    response->set_header_field( i_name = `content-type` i_value = `application/json` ).

  ENDMETHOD.
ENDCLASS.
