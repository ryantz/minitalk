#include "includes/minitalk.h"
#include <stdio.h>

int main()
{
	int	pid;

	pid = getpid();
	printf("SERVER PID: %d\n", pid);
	while (1)
		pause();
}
