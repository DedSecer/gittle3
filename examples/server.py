from gittle3 import GitServer

server = GitServer('/', 'localhost')
server.serve_forever()
