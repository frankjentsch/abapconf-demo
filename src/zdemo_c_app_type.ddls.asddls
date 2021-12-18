@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZDEMO_I_APP_TYPE'
define root view entity ZDEMO_C_APP_TYPE
  as projection on ZDEMO_I_APP_TYPE
{
  key apptypeuuid,
  apptypename,
  locallastchangedat
  
}
