require 'csv'

=begin
Country.delete_all
CSV.foreach("data/vizaok2 - countries.csv", :headers => true) do |row|
  #puts row['country_name']+row['country_code']
  Country.create(name: row['country_name'], country_cd: row['country_code'])
end

Visatype.delete_all
CSV.foreach("data/vizaok2 - visa_types.csv", :headers => true) do |row|
  #puts row['type_name']+row['subtype']+row['code']
  Visatype.create(name: row['type_name'], subtype: row['subtype'], type_cd: row['code'])
end

Visa.delete_all
CSV.foreach("data/vizaok2 - visas.csv", :headers => true) do |row|
  #puts row['country_cd']+row['visa_name']+row['type_cd']+row['description']
  Visa.create(visa_cd: row['visa_cd'], name: row['visa_name'], visatype_id: Visatype.where(:type_cd => row['type_cd']).first.id, 
  country_id: Country.where(:country_cd => row['country_cd']).first.id, 
  description: row['description'], type_cd: row['type_cd'], country_cd: row['country_cd'])
end

Document.delete_all
CSV.foreach("data/vizaok2 - documents.csv", :headers => true) do |row|
  #puts row['visa_cd']+row['name']+row['description']
  Document.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], description: row['description'])
end


Price.delete_all
CSV.foreach("data/vizaok2 - prices.csv", :headers => true) do |row|
  Price.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], description: row['description'], price: row['price'], currency: row['currency'])
end
=end
Addinfo.delete_all
CSV.foreach("data/vizaok2 - addinfo.csv", :headers => true) do |row|
  Addinfo.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], description: row['description'])
end

=begin
countries = Country.create(name: 'Америка')
types = VisaTypes.create(name: 'Студенческая виза для академического обучения')
Visa.create(name: '', type: type.where(:name=>'Студенческая виза для академического обучения'))
=end