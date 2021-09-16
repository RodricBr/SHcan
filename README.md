```markdown
### Sumário:
- Scanner de portas usando NMAP
- para os preguiçosos (como eu) :)
```

### Como executar SHcanner.sh (Testado no [GitBash](https://git-scm.com/downloads) e Debian 10 Buster)
```bash
$ git clone https://github.com/rodricbr/shcan
$ cd shcan/;ls
$ chmod +x shcan.sh
$ ./shcan.sh -h
```

### Como testar portas em conexão local usando netcat:
```bash
## 1º terminal
$ ifconfig
..: ip local, ex:192.168.0.1 :..
$ nc -vlnp 123

## 2º terminal
$ ./shcan.sh 192.168.0.1 1-123
..: porta aberta: 123 :..
```
