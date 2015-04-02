require 'nanomsg'
require 'json'
require 'sinatra'
require 'ffaker'

module ChatConnection
  def self.reconnect!
    @req = NanoMsg::ReqSocket.new
    @req.connect('tcp://127.0.0.1:4884')
    @req
  end

  def self.connection
    @req || reconnect!
  end

  def self.send(data)
    connection.send(data)
  end
end

get '/' do
  res = ChatConnection.send JSON.dump(userid: 'FDE@##$)(*&^%$#@{}":<>?THGFD', token: 'QWERTYUIOPASDFGHJ', name: Faker::NameRU.name)
  puts "done! with #{res.inspect}"
  "done! with #{res.inspect}"
end