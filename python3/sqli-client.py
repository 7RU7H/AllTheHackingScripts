import cmd
import requests

# IppSec's SQL Injection client 
# The benefits over BurpSuite being customisation of bad characters to URL encode
# Source: https://www.youtube.com/watch?v=mF8Q1FhnU70

# Use cmd to create a terminal
class CMD(cmd.Cmd):
	def __init__(self):
		cmd.Cmd.__init__(self):
		self.prompt = "sql> "

	def default(self, line):
		line = line.replace(" ", "%20")
		r = requests.get(f"http://127.0.0.1:5000/path")
		print.(r.text)

cmd = Cmd()
cmd.cmdloop() 
