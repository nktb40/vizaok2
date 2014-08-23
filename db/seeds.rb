require 'csv'


Country.delete_all
CSV.foreach("data/vizaok2 - countries.csv", :headers => true) do |row|
  #puts row['country_name']+row['country_code']
  Country.create(name: row['country_name'], name2: row['country_name2'], country_cd: row['country_code'])
end


Visa.delete_all
CSV.foreach("data/vizaok2 - visas.csv", :headers => true) do |row|
  Visa.create(visa_cd: row['visa_cd'], name: row['visa_name'], 
  country_id: Country.where(:country_cd => row['country_cd']).first.id, 
  description: row['description'], shortdesc: row['brief_description'],
  translit: row['translit'])
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
  #puts row['name']||' '||row['description']
  Addinfo.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], description: row['description'])
end



Link.delete_all
CSV.foreach("data/vizaok2 - links.csv", :headers => true) do |row|
  Link.create(visa_id: Visa.where(:visa_cd => row['visa_cd']).first.id, 
  name: row['name'], link: row['link'])
end



Procedure.delete_all
CSV.foreach("data/vizaok2 - procedure.csv", :headers => true) do |row|
  Procedure.create(visa_id: Visa.where(:visa_cd => row['Виза']).first.id, 
  step: row['Шаг'], description: row['Процедура оформления'])
end


=begin
CSV.foreach("data/vizaok2 - visas.csv", :headers => true) do |row|
	v = Visa.where(:visa_cd => row['visa_cd']).first
	v.update_attribute :translit, row['translit']
end
=end

=begin
CSV.foreach("data/vizaok2 - visas.csv", :headers => true) do |row|
	v = Visa.where(:visa_cd => row['visa_cd']).first
	v.update_attribute :name, row['visa_name']
end
=end
