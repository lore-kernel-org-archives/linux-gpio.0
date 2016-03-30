From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] gpio: add a userspace chardev ABI for GPIOs
Date: Wed, 30 Mar 2016 11:49:23 +1000
Message-ID: <56FB30A3.40405@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, lkml@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Commit 3c702e99 ("gpio: add a userspace chardev ABI for GPIOs")
breaks booting on all my m68k/ColdFire platforms (with MMU and
without). They all hang during the boot up, the last console
trace is:

  ...
  NR_IRQS:256
  clocksource: pit: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1467848399018 ns
  Calibrating delay loop... 1042.02 BogoMIPS (lpj=5210112)
  pid_max: default: 32768 minimum: 301
  Mount-cache hash table entries: 2048 (order: 0, 8192 bytes)
  Mountpoint-cache hash table entries: 2048 (order: 0, 8192 bytes)

I traced this back to gpiochip_add_data() when it does the
device_add() call. On my platforms this is being called 
before gpiolib_dev_init(), and this seems to be the issue.
So gpio_bus_type has not been registered as a bus yet.

The lowest level ColdFire gpio code (arch/m68k/coldfire/gpio.c)
calls its setup from core_initcall() - and this will call
gpiochip_add_data(). This is being called first, before
the core_initcall() for gpiolib_dev_init().

I can fix by changing the core_initcall() in coldfire/gpio.c
to something like postcore_initcall() and that fixes the boot
problem.

What do you think?
Would you expect that all callers of gpiochip_add_data()
should be after core_initcall()?

Regards
Greg
