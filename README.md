# mail-scripts
Scripts para el envio de emails con mailgun.com

## Uso

### spam.sh
para iniciar campañas de correo electronico
Se pueden cambiar las etiquetas dentro del scriipt
```bash
$ echo "example1@example.com" | ./spam.sh mailgun-api-key-XXXXXXXXXXXXXX plantilla.html
$ cat list-correos.txt | ./spam.sh mailgun-api-key-XXXXXXXXXXXXXX plantilla.html
```
### crear-correos.sh

para cambiar la plantilla, solo hay que editar el archivo plantilla.html
```bash
$ ./crear-correos.sh mailgun-api-key-XXXXXXXXXXXXXX oldemail@example.com newemail@glud.org
```
