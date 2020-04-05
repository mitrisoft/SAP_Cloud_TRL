@AbapCatalog.sqlViewName: 'ZV_BOOKING_MIT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Definition Booking'
@Search.searchable: true

@UI:
{
 headerInfo:
  {
    typeName: 'Booking',
    typeNamePlural: 'Bookings',
    title: { type: #STANDARD, value: 'Booking' }
  }
 }

define root view ZI_Booking_MIT
  as select from ztbooking_mit as Booking

  association [0..1] to I_Country  as _Country  on $projection.Country = _Country.Country
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency

{

      @UI.facet: [
        {
          id:       'Booking',
          purpose:  #STANDARD,
          type:     #IDENTIFICATION_REFERENCE,
          label:    'Booking',
          position: 10 }
      ]

      @UI: {
          lineItem: [ { position: 10, importance: #HIGH, label: 'Booking ID' } ],
          identification:[ { position: 10, label: 'Booking ID' } ]
          }
  key booking            as Booking,

      @UI: {
        lineItem: [ { position: 20, label: 'Customer', importance: #HIGH } ],
        identification:[ { position: 20, label: 'Customer' } ]
      }
      @Search.defaultSearchElement: true
      customername       as CustomerName,

      @UI: {
        lineItem: [ { position: 30, label: 'No of Passengers', importance: #HIGH } ],
        identification:[ { position: 30, label: 'No of Passengers' } ]
      }
      numberofpassengers as NumberOfPassengers,

      @UI: {
        lineItem: [ { position: 40, label: 'Cost', importance: #HIGH } ],
        identification:[ { position: 40, label: 'Cost' } ]
      }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cost               as Cost,

      //      @UI: {
      //        lineItem: [ { position: 50, label: 'Currency', importance: #HIGH } ],
      //        identification:[ { position: 50, label: 'Currency' } ]
      //      }
      @Semantics.currencyCode: true
      //      @ObjectModel.foreignKey.association: '_Currency'
      currencycode       as CurrencyCode,

      @UI: {
        lineItem: [ { position: 60, label: 'Country', importance: #MEDIUM } ],
        identification:[ { position: 60, label: 'Country' } ]
      }
      //      @ObjectModel.foreignKey.association: '_Country'
      country            as Country,

      @UI: {
        identification:[ { position: 70, label: 'Email' } ]
      }
      emailaddress       as EmailAddress,

      @UI: {
        identification:[ { position: 80, label: 'Booked On' } ]
      }
      dateofbooking      as DateOfBooking,

      @UI: {   identification:[ { position: 90, label: 'Traveling on' } ]    }
      dateoftravel       as DateOfTravel,

      @UI: { identification:[ { position: 100, label: 'Last Changed At' } ] }
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat      as LastChangedAt,

      //public associations
      _Country,
      _Currency
}
