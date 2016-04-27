From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Wed, 27 Apr 2016 11:00:35 -0500
Message-ID: <20160427160034.GA20392@deathstar>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
 <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:36631 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbcD0QAu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Apr 2016 12:00:50 -0400
Received: by mail-ig0-f195.google.com with SMTP id c3so6897250igl.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Apr 2016 09:00:49 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Tue, Apr 26, 2016 at 10:54:26AM +0200, Linus Walleij wrote:
> The gpio-hammer is used from userspace as an example of how
> to retrieve a GPIO handle for one or several GPIO lines and
> hammer the outputs from low to high and back again. It will
> pulse the selected lines once per second for a specified
> number of times or indefinitely if no loop count is
> supplied.
> 
> Example output:
> $ gpio-hammer -n gpiochip0 -o5 -o6 -o7
> Hammer lines [5, 6, 7] on gpiochip0, initial states: [1, 1, 1]
> [-] [5: 0, 6: 0, 7: 0]
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Tested-by: Michael Welling <mwelling@ieee.org>

Below is the output from my target. You will notice that a kernel warning is spewed out if I use the mcp23s08.
The processor GPIOs work fine as verified by blinking LEDs.

root@som3517-som200:~# ./lsgpio 
GPIO chip: gpiochip4, "mcp23s08", 8 GPIO lines
        line  0: unnamed unused
        line  1: unnamed unused
        line  2: unnamed unused
        line  3: unnamed unused
        line  4: unnamed unused
        line  5: unnamed unused
        line  6: unnamed unused
        line  7: unnamed unused
GPIO chip: gpiochip3, "gpio", 32 GPIO lines
        line  0: unnamed unused
        line  1: unnamed unused
        line  2: unnamed unused
        line  3: unnamed unused
        line  4: unnamed unused
        line  5: unnamed unused
        line  6: unnamed unused
        line  7: unnamed unused
        line  8: unnamed "spi1.3" [kernel output]
        line  9: unnamed unused
        line 10: unnamed unused
        line 11: unnamed unused
        line 12: unnamed unused
        line 13: unnamed unused
        line 14: unnamed unused
        line 15: unnamed unused
        line 16: unnamed unused
        line 17: unnamed unused
        line 18: unnamed unused
        line 19: unnamed unused
        line 20: unnamed unused
        line 21: unnamed unused
        line 22: unnamed unused
        line 23: unnamed unused
        line 24: unnamed unused
        line 25: unnamed unused
        line 26: unnamed unused
        line 27: unnamed unused
        line 28: unnamed unused
        line 29: unnamed unused
        line 30: unnamed unused
        line 31: unnamed unused
GPIO chip: gpiochip2, "gpio", 32 GPIO lines
        line  0: unnamed unused
        line  1: unnamed unused
        line  2: unnamed unused
        line  3: unnamed unused
        line  4: unnamed unused
        line  5: unname[   40.820783] random: nonblocking pool is initialized
d unused
        line  6: unnamed unused
        line  7: unnamed unused
        line  8: unnamed unused
        line  9: unnamed unused
        line 10: unnamed unused
        line 11: unnamed unused
        line 12: unnamed unused
        line 13: unnamed unused
        line 14: unnamed unused
        line 15: unnamed unused
        line 16: unnamed unused
        line 17: unnamed unused
        line 18: unnamed unused
        line 19: unnamed unused
        line 20: unnamed unused
        line 21: unnamed unused
        line 22: unnamed unused
        line 23: unnamed unused
        line 24: unnamed unused
        line 25: unnamed unused
        line 26: unnamed unused
        line 27: unnamed unused
        line 28: unnamed unused
        line 29: unnamed unused
        line 30: unnamed unused
        line 31: unnamed unused
GPIO chip: gpiochip1, "gpio", 32 GPIO lines
        line  0: unnamed unused
        line  1: unnamed unused
        line  2: unnamed unused
        line  3: unnamed unused
        line  4: unnamed unused
        line  5: unnamed unused
        line  6: unnamed unused
        line  7: unnamed unused
        line  8: unnamed unused
        line  9: unnamed unused
        line 10: unnamed unused
        line 11: unnamed unused
        line 12: unnamed "cd" [kernel active-low]
        line 13: unnamed "enable" [kernel output]
        line 14: unnamed "spi1.2" [kernel output]
        line 15: unnamed unused
        line 16: unnamed unused
        line 17: unnamed unused
        line 18: unnamed unused
        line 19: unnamed unused
        line 20: unnamed unused
        line 21: unnamed unused
        line 22: unnamed unused
        line 23: unnamed unused
        line 24: unnamed unused
        line 25: unnamed unused
        line 26: unnamed unused
        line 27: unnamed unused
        line 28: unnamed unused
        line 29: unnamed unused
        line 30: unnamed unused
        line 31: unnamed unused
GPIO chip: gpiochip0, "gpio", 32 GPIO lines
        line  0: unnamed unused
        line  1: unnamed unused
        line  2: unnamed unused
        line  3: unnamed unused
        line  4: unnamed unused
        line  5: unnamed "spi1.0" [kernel output]
        line  6: unnamed "spi1.1" [kernel output]
        line  7: unnamed unused
        line  8: unnamed unused
        line  9: unnamed unused
        line 10: unnamed unused
        line 11: unnamed unused
        line 12: unnamed unused
        line 13: unnamed unused
        line 14: unnamed unused
        line 15: unnamed unused
        line 16: unnamed unused
        line 17: unnamed unused
        line 18: unnamed unused
        line 19: unnamed unused
        line 20: unnamed unused
        line 21: unnamed unused
        line 22: unnamed unused
        line 23: unnamed unused
        line 24: unnamed unused
        line 25: unnamed unused
        line 26: unnamed unused
        line 27: unnamed unused
        line 28: unnamed unused
        line 29: unnamed unused
        line 30: unnamed unused
        line 31: unnamed unused
root@som3517-som200:~# ./gpio-hammer -n gpiochip0 -o7
Hammer lines [7] on gpiochip0, initial states: [1]
^C] [7: 1]
root@som3517-som200:~# ./gpio-hammer -n gpiochip3 -o4                                                                                                                                                                                        
Hammer lines [4] on gpiochip3, initial states: [1]
^C] [4: 1]
root@som3517-som200:~# ./gpio-hammer -n gpiochip1 -o9                                                                                                                                                                                        
Hammer lines [9] on gpiochip1, initial states: [1]
^C] [9: 0]
root@som3517-som200:~# ./gpio-hammer -n gpiochip4 -o0                                                                                                                                                                                        
[  187.511606] ------------[ cut here ]------------
[  187.516949] WARNING: CPU: 0 PID: 830 at /home/michael/projects/linux/linux-git/drivers/gpio/gpiolib.c:1907 gpiod_get_value+0x60/0xa4
[  187.529770] Modules linked in:
[  187.533082] CPU: 0 PID: 830 Comm: gpio-hammer Tainted: G        W       4.6.0-rc1-00084-g6f4ee91-dirty #2
[  187.543231] Hardware name: Generic AM33XX (Flattened Device Tree)
[  187.549753] [<c010fee4>] (unwind_backtrace) from [<c010c10c>] (show_stack+0x10/0x14)
[  187.557993] [<c010c10c>] (show_stack) from [<c0464074>] (dump_stack+0xb0/0xe4)
[  187.565695] [<c0464074>] (dump_stack) from [<c01345d4>] (__warn+0xd4/0x100)
[  187.573109] [<c01345d4>] (__warn) from [<c01346ac>] (warn_slowpath_null+0x20/0x28)
[  187.581163] [<c01346ac>] (warn_slowpath_null) from [<c049e3d8>] (gpiod_get_value+0x60/0xa4)
[  187.590046] [<c049e3d8>] (gpiod_get_value) from [<c049f7a8>] (linehandle_ioctl+0x114/0x19c)
[  187.598932] [<c049f7a8>] (linehandle_ioctl) from [<c0296710>] (do_vfs_ioctl+0x8c/0xa18)
[  187.607445] [<c0296710>] (do_vfs_ioctl) from [<c0297108>] (SyS_ioctl+0x6c/0x7c)
[  187.615233] [<c0297108>] (SyS_ioctl) from [<c0107820>] (ret_fast_syscall+0x0/0x1c)
[  187.623616] ---[ end trace 9b8ac986d34a8efa ]---
.
.

root@som3517-som200:~# uname -a
Linux som3517-som200 4.6.0-rc1-00084-g6f4ee91-dirty #2 SMP Wed Apr 27 10:46:00 CDT 2016 armv7l GNU/Linux
root@som3517-som200:~# cat /proc/cpuinfo 
processor       : 0
model name      : ARMv7 Processor rev 2 (v7l)
BogoMIPS        : 273.94
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls vfpd32 
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc08
CPU revision    : 2

Hardware        : Generic AM33XX (Flattened Device Tree)
Revision        : 0000
Serial          : 0000000000000000

> ---
>  tools/gpio/Makefile      |   5 +-
>  tools/gpio/gpio-hammer.c | 189 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 192 insertions(+), 2 deletions(-)
>  create mode 100644 tools/gpio/gpio-hammer.c
> 
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index c155d6bc47a7..aea23949054e 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -1,12 +1,13 @@
>  CC = $(CROSS_COMPILE)gcc
>  CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
>  
> -all: lsgpio
> +all: lsgpio gpio-hammer
>  
>  lsgpio: lsgpio.o gpio-utils.o
> +gpio-hammer: gpio-hammer.o gpio-utils.o
>  
>  %.o: %.c gpio-utils.h
>  
>  .PHONY: clean
>  clean:
> -	rm -f *.o lsgpio
> +	rm -f *.o lsgpio gpio-hammer
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> new file mode 100644
> index 000000000000..37b3f141053d
> --- /dev/null
> +++ b/tools/gpio/gpio-hammer.c
> @@ -0,0 +1,189 @@
> +/*
> + * gpio-hammer - example swiss army knife to shake GPIO lines on a system
> + *
> + * Copyright (C) 2016 Linus Walleij
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * Usage:
> + *	gpio-hammer -n <device-name> -o <offset1> -o <offset2>
> + */
> +
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <dirent.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <poll.h>
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <sys/ioctl.h>
> +#include <linux/gpio.h>
> +
> +int hammer_device(const char *device_name, unsigned int *lines, int nlines,
> +		  unsigned int loops)
> +{
> +	struct gpiohandle_request req;
> +	struct gpiohandle_data data;
> +	char *chrdev_name;
> +	char swirr[] = "-\\|/";
> +	int fd;
> +	int ret;
> +	int i, j;
> +	unsigned int iteration = 0;
> +
> +	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
> +	if (ret < 0)
> +		return -ENOMEM;
> +
> +	fd = open(chrdev_name, 0);
> +	if (fd == -1) {
> +		ret = -errno;
> +		fprintf(stderr, "Failed to open %s\n", chrdev_name);
> +		goto exit_close_error;
> +	}
> +
> +	/* Request lines as output */
> +	for (i = 0; i < nlines; i++)
> +		req.lineoffsets[i] = lines[i];
> +	req.flags = GPIOHANDLE_REQUEST_OUTPUT; /* Request as output */
> +	strcpy(req.consumer_label, "gpio-hammer");
> +	req.lines = nlines;
> +	ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
> +	if (ret == -1) {
> +		ret = -errno;
> +		fprintf(stderr, "Failed to issue GET LINEHANDLE "
> +			"IOCTL (%d)\n",
> +			ret);
> +		goto exit_close_error;
> +	}
> +
> +	/* Read initial states */
> +	ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
> +	if (ret == -1) {
> +		ret = -errno;
> +		fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
> +			"VALUES IOCTL (%d)\n",
> +			ret);
> +		goto exit_close_error;
> +	}
> +	fprintf(stdout, "Hammer lines [");
> +	for (i = 0; i < nlines; i++) {
> +		fprintf(stdout, "%d", lines[i]);
> +		if (i != (nlines - 1))
> +			fprintf(stdout, ", ");
> +	}
> +	fprintf(stdout, "] on %s, initial states: [", device_name);
> +	for (i = 0; i < nlines; i++) {
> +		fprintf(stdout, "%d", data.values[i]);
> +		if (i != (nlines - 1))
> +			fprintf(stdout, ", ");
> +	}
> +	fprintf(stdout, "]\n");
> +
> +	/* Hammertime! */
> +	j = 0;
> +	while (1) {
> +		/* Invert all lines so we blink */
> +		for (i = 0; i < nlines; i++)
> +			data.values[i] = !data.values[i];
> +
> +		ret = ioctl(req.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
> +		if (ret == -1) {
> +			ret = -errno;
> +			fprintf(stderr, "Failed to issue GPIOHANDLE SET LINE "
> +				"VALUES IOCTL (%d)\n",
> +				ret);
> +			goto exit_close_error;
> +		}
> +		/* Re-read values to get status */
> +		ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
> +		if (ret == -1) {
> +			ret = -errno;
> +			fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
> +				"VALUES IOCTL (%d)\n",
> +				ret);
> +			goto exit_close_error;
> +		}
> +
> +		fprintf(stdout, "[%c] ", swirr[j]);
> +		j++;
> +		if (j == sizeof(swirr)-1)
> +			j = 0;
> +
> +		fprintf(stdout, "[");
> +		for (i = 0; i < nlines; i++) {
> +			fprintf(stdout, "%d: %d", lines[i], data.values[i]);
> +			if (i != (nlines - 1))
> +				fprintf(stdout, ", ");
> +		}
> +		fprintf(stdout, "]\r");
> +		fflush(stdout);
> +		sleep(1);
> +		iteration++;
> +		if (loops && iteration == loops)
> +			break;
> +	}
> +	fprintf(stdout, "\n");
> +	ret = 0;
> +
> +exit_close_error:
> +	if (close(fd) == -1)
> +		perror("Failed to close GPIO character device file");
> +	free(chrdev_name);
> +	return ret;
> +}
> +
> +void print_usage(void)
> +{
> +	fprintf(stderr, "Usage: gpio-hammer [options]...\n"
> +		"Hammer GPIO lines, 0->1->0->1...\n"
> +		"  -n <name>  Hammer GPIOs on a named device (must be stated)\n"
> +		"  -o <n>     Offset[s] to hammer, at least one, several can be stated\n"
> +		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
> +		"  -?         This helptext\n"
> +		"\n"
> +		"Example:\n"
> +		"gpio-hammer -n gpiochip0 -o 4\n"
> +	);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	const char *device_name = NULL;
> +	unsigned int lines[GPIOHANDLES_MAX];
> +	unsigned int loops = 0;
> +	int nlines;
> +	int c;
> +	int i;
> +
> +	i = 0;
> +	while ((c = getopt(argc, argv, "c:n:o:?")) != -1) {
> +		switch (c) {
> +		case 'c':
> +			loops = strtoul(optarg, NULL, 10);
> +			break;
> +		case 'n':
> +			device_name = optarg;
> +			break;
> +		case 'o':
> +			lines[i] = strtoul(optarg, NULL, 10);
> +			i++;
> +			break;
> +		case '?':
> +			print_usage();
> +			return -1;
> +		}
> +	}
> +	nlines = i;
> +
> +	if (!device_name || !nlines) {
> +		print_usage();
> +		return -1;
> +	}
> +	return hammer_device(device_name, lines, nlines, loops);
> +}
> -- 
> 2.4.11
> 
