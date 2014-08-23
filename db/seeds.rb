require 'csv'

=begin
Country.delete_all
CSV.foreach("data/vizaok2 - countries.csv", :headers => true) do |row|
  #puts row['country_name']+row['country_code']
  Country.create(name: row['country_name'], country_cd: row['country_code'])
end
=end

=begin
Visatype.delete_all
CSV.foreach("data/vizaok2 - visa_types.csv", :headers => true) do |row|
  #puts row['type_name']+row['subtype']+row['code']
  Visatype.create(name: row['type_name'], migration: row['migration'], type_cd: row['code'])
end

Subtype.delete_all
CSV.foreach("data/vizaok2 - subtypes.csv", :headers => true) do |row|
  Subtype.create(visatype_id: Visatype.where(:type_cd => row['visa_type_cd']).first.id, 
  name: row['subtype'], subtype_cd: row['code'])
end
=end

=begin
Visa.delete_all
CSV.foreach("data/vizaok2 - visas.csv", :headers => true) do |row|
  Visa.create(visa_cd: row['visa_cd'], name: row['visa_name'], 
  country_id: Country.where(:country_cd => row['country_cd']).first.id, 
  description: row['description'], shortdesc: row['brief_description'])
end

Purpose.delete_all
CSV.foreach("data/vizaok2 - purposes.csv", :headers => true) do |row|
  Purpose.create(purpose_cd: row['purpose_cd'], name: row['name'], 
  description: row['description'])
end

LnkVisaPurpose.delete_all
CSV.foreach("data/vizaok2 - visa purposes.csv", :headers => true) do |row|
  #puts row['visa_cd']
  #puts Visa.where(:visa_cd => row['visa_cd']).first.name
  #puts row['purpose_cd']+' '+Purpose.where(:purpose_cd => row['purpose_cd']).first.name+'  '+row['visa_cd']
  LnkVisaPurpose.create(
  visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id,
  purpose_id: Purpose.where(:purpose_cd => row['purpose_cd']).first.id)
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

Addinfo.delete_all
CSV.foreach("data/vizaok2 - addinfo.csv", :headers => true) do |row|
  puts row['name']||' '||row['description']
  Addinfo.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], description: row['description'])
end


Link.delete_all
CSV.foreach("data/vizaok2 - links.csv", :headers => true) do |row|
  Link.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], link: row['link'])
end

=end

CSV.foreach("data/vizaok2 - visas.csv", :headers => true) do |row|
	v = Visa.where(:visa_cd => row['visa_cd']).first
	v.update_attribute :translit, row['translit']
end