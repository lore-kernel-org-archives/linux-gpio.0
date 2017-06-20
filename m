From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: bcm2835_pinctrl_probe: WARNING: CPU: 0 PID: 1 at kernel/irq/chip.c:850
Date: Tue, 20 Jun 2017 13:32:51 +0200
Message-ID: <CACRpkdbBPVG3eP-Vt+uHALZkpPzV+0YVE6zBO0B7qnQi3qNKyA@mail.gmail.com>
References: <2049796110.190734.1497905942101@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:32866 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750884AbdFTLcx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 07:32:53 -0400
Received: by mail-io0-f177.google.com with SMTP id t87so82568771ioe.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2017 04:32:52 -0700 (PDT)
In-Reply-To: <2049796110.190734.1497905942101@email.1und1.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Eric Anholt <eric@anholt.net>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 19, 2017 at 10:59 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> i'm currently working Raspberry Pi Zero W support and had problems to boot with Mini UART
> (no sign of life after startup). After switching to pl011 with EARLY_PRINTK, the Zero W boots
> and i get the following output:

(...)
> [    0.255621] ------------[ cut here ]------------
> [    0.255742] WARNING: CPU: 0 PID: 1 at kernel/irq/chip.c:850 __irq_do_set_handler+0x4c/0x14c
> [    0.255811] Modules linked in:
> [    0.255862] CPU: 0 PID: 1 Comm: swapper Not tainted 4.12.0-rc5-next-20170616+ #3
> [    0.255924] Hardware name: Generic DT based system
> [    0.256009] [<c010f64c>] (unwind_backtrace) from [<c010c604>] (show_stack+0x20/0x24)
> [    0.256109] [<c010c604>] (show_stack) from [<c037bb88>] (dump_stack+0x20/0x28)
> [    0.256204] [<c037bb88>] (dump_stack) from [<c011e76c>] (__warn+0xe4/0x110)
> [    0.256270] [<c011e76c>] (__warn) from [<c011e868>] (warn_slowpath_null+0x30/0x38)
> [    0.256355] [<c011e868>] (warn_slowpath_null) from [<c01590f0>] (__irq_do_set_handler+0x4c/0x14c)
> [    0.256444] [<c01590f0>] (__irq_do_set_handler) from [<c01592dc>] (irq_set_chained_handler_and_data+0x4c/0x64)
> [    0.256548] [<c01592dc>] (irq_set_chained_handler_and_data) from [<c03ae534>] (gpiochip_set_chained_irqchip+0x80/0xa0)
> [    0.256641] [<c03ae534>] (gpiochip_set_chained_irqchip) from [<c03aa9e8>] (bcm2835_pinctrl_probe+0x31c/0x3c8)
> [    0.256746] [<c03aa9e8>] (bcm2835_pinctrl_probe) from [<c044f03c>] (platform_drv_probe+0x60/0xac)
> [    0.256840] [<c044f03c>] (platform_drv_probe) from [<c044d434>] (driver_probe_device+0x1d8/0x438)
> [    0.256929] [<c044d434>] (driver_probe_device) from [<c044d730>] (__driver_attach+0x9c/0x100)
> [    0.257014] [<c044d730>] (__driver_attach) from [<c044b6e4>] (bus_for_each_dev+0x84/0x98)
> [    0.257098] [<c044b6e4>] (bus_for_each_dev) from [<c044cd7c>] (driver_attach+0x28/0x30)
> [    0.257181] [<c044cd7c>] (driver_attach) from [<c044c7dc>] (bus_add_drcm2835_pinctrl_driver_init+0x20/0x28)
> [    0.257535] [<c0b2c9b0>] (bcm2835_pinctrl_driver_init) from [<c0101ac0>] (do_one_initcall+0xc0/0x188)
> [    0.257635] [<c0101ac0>] (do_one_initcall) from [<c0b00f64>] (kernel_init_freeable+0x170/0x234)
> [    0.257728] [<c0b00f64>] (kernel_init_freeable) from [<c07366b4>] (kernel_init+0x18/0x11c)
> [    0.257822] [<c07366b4>] (kernel_init) from [<c0107f38>] (ret_from_fork+0x14/0x3c)
> [    0.257904] random: init_oops_id+0x30/0x4c get_random_bytes called with crng_init=0
> [    0.257980] ---[ end trace 9c0064da26f1596a ]---
> [    0.261962] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
> [    0.265460] libphy: Fixed MDIO Bus: probed
> ...
>
> According to the source code, this is the relevant line:
>
> if (WARN_ON(!irq_data || irq_data->chip == &no_irq_chip))
>         return;

Isn't that because something is using the irqchip before the irqchip
is registered, so an initcall
problem?

I don't really know how some stuff like irqchips deal with deferred
probe or if they even can.

I had some similar patch the other day fixing something like this in
another driver,
I guess you can try reordering the initcalls. (Sorry.)

Yours,
Linus Walleij
