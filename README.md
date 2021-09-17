```markdown
### Sumário:
- Scanner de portas usando NMAP
- para os preguiçosos (como eu) :)
```

### Como executar SHcanner.sh (Testado no [GitBash](https://git-scm.com/downloads) e Debian 10 Buster)
```sh
$ git clone https://github.com/rodricbr/shcan
$ cd shcan/;ls
$ chmod +x shcan.sh
$ sudo mv shcan.sh /usr/local/bin
$ ./shcan.sh -h
```

### Como testar portas em conexão local usando netcat:
```sh
## 1º terminal
$ ifconfig
..: ip local, ex:192.168.0.1 :..
$ sudo nc -vlnp 123
..: escutando porta 123 :..

## 2º terminal
$ ./shcan.sh 192.168.0.1 1-123
..: porta aberta: 123 :..
```

### Nota:
O script não foi feito para ser útil ou
100% funcional, é um projeto pessoal
a fim de aprender sobre shell scripting
que decidi tornar público
