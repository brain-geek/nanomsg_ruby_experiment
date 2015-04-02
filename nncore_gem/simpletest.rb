require 'nn-core'
require 'json'

@socket = NNCore::LibNanomsg.nn_socket(NNCore::AF_SP, NNCore::NN_REQ)
NNCore::LibNanomsg.nn_connect(@socket, 'tcp://127.0.0.1:4884')

@msg = JSON.generate(userid: 'FDE@##$)(*&^%$#@{}":<>?THGFD', token: 'QWERTYUIOPASDFGHJ', name: 'Петр Ратников')
@size = @msg.bytesize

NNCore::LibNanomsg.nn_send(@socket, @msg, @size, 0)