/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_main.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ryatan <ryatan@student.42singapore.sg>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/03/12 17:59:53 by ryatan            #+#    #+#             */
/*   Updated: 2026/03/12 18:59:00 by ryatan           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

//int	main(int argc, char **argv)
int	main(void)
{
	int	pid;
	
	pid = getpid();
	ft_printf("SERVER PID: %d\n", pid);
	while (1)
		pause();
	return (0);
}
