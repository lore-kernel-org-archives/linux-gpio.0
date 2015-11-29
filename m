From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpiolib: fix oops, if gpio name is NULL
Date: Sun, 29 Nov 2015 22:18:28 +0100
Message-ID: <CACRpkdZSzz0ZkT6S_Aq8r+wgLdck6mDgjdcmY9id=qw1rRmBTg@mail.gmail.com>
References: <1447245413-32209-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34398 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752343AbbK2VS3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Nov 2015 16:18:29 -0500
Received: by obbbj7 with SMTP id bj7so113185516obb.1
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2015 13:18:29 -0800 (PST)
In-Reply-To: <1447245413-32209-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 11, 2015 at 1:36 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> Commit c0017ed71966 ("gpio: Introduce gpio descriptor 'name'") causes
> OOPS on boot on LPC32xx boards:
>
>     Unable to handle kernel NULL pointer dereference at virtual address 00000000
>     CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0+ #707
>     Hardware name: LPC32XX SoC (Flattened Device Tree)
>     task: c381baa0 ti: c381e000 task.ti: c381e000
>     PC is at strcmp+0x10/0x40
>     LR is at gpiochip_add+0x3d0/0x4d4
>     pc : [<>]    lr : [<>]    psr: a0000093
>     sp : c381fd60  ip : c381fd70  fp : c381fd6c
>
>     [snip]
>
>     Backtrace:
>     [<>] (strcmp) from [<>] (gpiochip_add+0x3d0/0x4d4)
>     [<>] (gpiochip_add) from [<>] (lpc32xx_gpio_probe+0x44/0x60)
>     [<>] (lpc32xx_gpio_probe) from [<>] (platform_drv_probe+0x40/0x8c)
>     [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x110/0x294)
>     [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0x94)
>     [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98)
>     [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
>     [<>] (driver_attach) from [<>] (bus_add_driver+0xd4/0x1f0)
>     [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
>     [<>] (driver_register) from [<>] (__platform_driver_register+0x38/0x4c)
>     [<>] (__platform_driver_register) from [<>] (lpc32xx_gpio_driver_init+0x18/0x20)
>     [<>] (lpc32xx_gpio_driver_init) from [<>] (do_one_initcall+0x108/0x1c8)
>     [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c/0x1d4)
>     [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec)
>     [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)
>
> This is caused by the fact that at the moment some GPIO names are set
> to NULL, there is a hole in linear representation of one GPI bank, see
> drivers/gpio/gpio-lpc32xx.c / gpi_p3_names[] for details.
>
> The same problem most probably affects also gpio-cs5535.c, see
> cs5535_gpio_names[].
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied for fixes. Sorry for the delay.

Yours,
Linus Walleij
