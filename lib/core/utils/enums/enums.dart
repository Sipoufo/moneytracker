/// Switch of Custom Brand-Text-Size Widget
enum TextSizes { small, medium, large }

/// Transaction find type
enum TransactionFindTypeEnum {
  daily("daily", "Daily", "Journalier"),
  monthly("monthly", "Monthly", "Mensuel"),
  annually("annually", "Annually", "Annuellement"),
  ;

  const TransactionFindTypeEnum(this.key, this.valueEn, this.valueFr);

  final String key;
  final String valueEn;
  final String valueFr;
}

enum DateTimeEnum {
  // Day
  monday(TransactionFindTypeEnum.daily, 1, "Monday", "Lundi"),
  thursday(TransactionFindTypeEnum.daily, 2, "Thursday", "Mardi"),
  wednesday(TransactionFindTypeEnum.daily, 3, "Wednesday", "Mercredi"),
  tuesday(TransactionFindTypeEnum.daily, 4, "Tuesday", "Jeudi"),
  friday(TransactionFindTypeEnum.daily, 5, "Friday", "Vendredi"),
  saturday(TransactionFindTypeEnum.daily, 6, "Saturday", "Samedi"),
  sunday(TransactionFindTypeEnum.daily, 7, "Sunday", "Dimanche"),

  // Month
  january(TransactionFindTypeEnum.monthly, 1, "January", "Janvier"),
  february(TransactionFindTypeEnum.monthly, 2, "February", "Février"),
  march(TransactionFindTypeEnum.monthly, 3, "March", "Mars"),
  april(TransactionFindTypeEnum.monthly, 4, "April", "Avril"),
  may(TransactionFindTypeEnum.monthly, 5, "May", "Mai"),
  june(TransactionFindTypeEnum.monthly, 6, "June", "Juin"),
  july(TransactionFindTypeEnum.monthly, 7, "July", "Juillet"),
  august(TransactionFindTypeEnum.monthly, 8, "August", "Août"),
  september(TransactionFindTypeEnum.monthly, 9, "September", "Septembre"),
  october(TransactionFindTypeEnum.monthly, 10, "October", "Octobre"),
  november(TransactionFindTypeEnum.monthly, 11, "November", "Novembre"),
  december(TransactionFindTypeEnum.monthly, 12, "December", "Decembre"),
  ;

  const DateTimeEnum(this.type, this.digitalValue, this.valueEn, this.valueFr);

  final TransactionFindTypeEnum type;
  final int digitalValue;
  final String valueEn;
  final String valueFr;
}