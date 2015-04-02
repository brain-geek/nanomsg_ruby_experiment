require 'nn-core'
require 'json'
require 'sinatra'
require 'ffaker'

module ChatConnection
  def self.reconnect!
    Thread.current[:nn_conn] = NNCore::LibNanomsg.nn_socket(NNCore::AF_SP, NNCore::NN_REQ)
    NNCore::LibNanomsg.nn_connect(Thread.current[:nn_conn], 'tcp://127.0.0.1:4884')
    Thread.current[:nn_conn]
  end

  def self.connection
    Thread.current[:nn_conn] || reconnect!
  end

  def self.send(data)
    msg = JSON.generate(data)
    size = msg.bytesize
    NNCore::LibNanomsg.nn_send(connection, msg, size, 0)
  end
end

get '/' do
  res = ChatConnection.send userid: 'FDE@##$)(*&^%$#@{}":<>?THGFD', token: 'QWERTYUIOPASDFGHJ', name: Faker::NameRU.name

  puts "done! with #{res}"
  "done! with #{res}"
end