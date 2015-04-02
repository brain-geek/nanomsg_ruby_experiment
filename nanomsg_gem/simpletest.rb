require 'nanomsg'
require 'json'

req = NanoMsg::ReqSocket.new

req.connect('tcp://127.0.0.1:4884')
req.send JSON.dump(userid: 'FDE@##$)(*&^%$#@{}":<>?THGFD', token: 'QWERTYUIOPASDFGHJ', name: 'Петр Ратников')