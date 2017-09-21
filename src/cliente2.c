//#include <stdlib.h>
//#include <stdio.h>
//#include <stdint.h>
//#include <arpa/inet.h>
//#include <sys/socket.h>

#include <stdio.h>
#include <stdlib.h>
#include <syscall.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
typedef char* string;
typedef struct sockaddr_in InformacionDeDireccionDeSocket_v2;
InformacionDeDireccionDeSocket_v2 crearDireccionDeServidor(){
	InformacionDeDireccionDeSocket_v2 direccionDeSocket;
	direccionDeSocket.sin_family = AF_INET;
	direccionDeSocket.sin_addr.s_addr = INADDR_ANY;
	direccionDeSocket.sin_port = htons(8080);
	return direccionDeSocket;
}
int  verificarError(int n, string s){
	if(n==-1 || n !=0){
		perror(strcat("error en: ",s));
		return 1;
	}
}


int main(void) {
	struct sockaddr_in direccionServidor;
	direccionServidor.sin_family = AF_INET;
	direccionServidor.sin_addr.s_addr = inet_addr("127.0.0.2");
	direccionServidor.sin_port = htons(8080);

	int cliente = socket(AF_INET, SOCK_STREAM, 0);
	if (connect(cliente, (void*) &direccionServidor, sizeof(direccionServidor)) != 0) {
		perror("No se pudo conectar");
		return 1;
	}

	while (1) {
		char mensaje[1000];
		scanf("%s", mensaje);

		send(cliente, mensaje, strlen(mensaje), 0);
	}

	return 0;
}
