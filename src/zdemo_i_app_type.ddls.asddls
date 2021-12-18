@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Application Type'
define root view entity ZDEMO_I_APP_TYPE
  as select from zdemo_app_type as ApplicationType
{
  key app_type_uuid as AppTypeUUID,
  app_type_name as AppTypeName,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
