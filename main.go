package main

import (
	"bitbucket.org/gdamore/mangos"
	"bitbucket.org/gdamore/mangos/protocol/rep"
	"bitbucket.org/gdamore/mangos/transport/tcp"
	"log"
)

func serve(addr string) {
	var sock mangos.Socket
	var err error

	if sock, err = rep.NewSocket(); err != nil {
		panic(err)
	}
	defer sock.Close()

	sock.AddTransport(tcp.NewTransport())

	if err = sock.Listen(addr); err != nil {
		panic(err)
	}

	for {
		var msg []byte
		if msg, err = sock.Recv(); err != nil {
			panic(err)
		}
		log.Printf("[%s]\n", msg)
		if err = sock.Send(msg); err != nil {
			panic(err)
		}
	}
}

func main() {
	serve("tcp://:4884")
}
