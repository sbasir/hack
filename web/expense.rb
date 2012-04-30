require 'sinatra'
require 'mongo'

post '/expense' do
  connection = Mongo::Connection.new
  db = connection.db("expense")
  coll = db["expenseCollection"]
  id = coll.insert(params)
#  text = ""
#  params.each { |param| text += param[0] + ":" + param[1] + "\n" }
  erb "POST /expense\nId: #{id}" 
end

get '/expense' do
  connection = Mongo::Connection.new
  db = connection.db("expense")
  coll = db["expenseCollection"]
  text = ""
  coll.find.each { |row| text += row.inspect + "<br/>" }
  erb "GET /expense<br/>" + text
end
