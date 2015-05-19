From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add ETRAXFS GPIO driver
Date: Tue, 19 May 2015 11:39:01 +0200
Message-ID: <CACRpkdZcbvrcOMJavU5TacR1nD5+ot2FdC5zxBc=8XdhZN0SqQ@mail.gmail.com>
References: <1431728843-21583-1-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33462 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755634AbbESJjB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 May 2015 05:39:01 -0400
Received: by obblk2 with SMTP id lk2so7801816obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2015 02:39:01 -0700 (PDT)
In-Reply-To: <1431728843-21583-1-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 16, 2015 at 12:27 AM, Rabin Vincent <rabin@rab.in> wrote:

> Add a GPIO driver for the General I/O block on Axis ETRAX FS SoCs.
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Nice!

(...)
> +++ b/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
> @@ -0,0 +1,21 @@
> +Axis ETRAX FS General I/O controller bindings
> +
> +Required properties:
> +
> +- compatible:
> +  - "axis,etraxfs-gio"
> +- reg: Physical base address and length of the controller's registers.
> +- #gpio-cells: Should be 3
> +  - The first cell is the port number (hex).
> +  - The seconds cell is the gpio offset number.
> +  - The third cell is reserved and is currently unused.
> +- gpio-controller: Marks the device node as a GPIO controller.
> +
> +Example:
> +
> +       gio: gpio@b001a000 {
> +               compatible = "axis,etraxfs-gio";
> +               reg = <0xb001a000 0x1000>;
> +               gpio-controller;
> +               #gpio-cells = <3>;
> +       };

Three cells is rather unusual, is it the best arrangement?

Usually it's just offset+flags (your flags are ununsed I see).
And then you could divide offset by num gpios per bank
(I guess 32) in the driver to get bank number.

The other obvious question is whether you considered the
design pattern of using one DT node per bank, so you
have offset 0..31 (I guess) on each device, simplifying things
with two cells.

The latter design pattern is usually recommended unless
there is a "strong" coupling between the banks, such as
if they all share the same IRQ line so they need the
same interrupt handler, or share other common registers.

> +config GPIO_ETRAXFS
> +       bool "Axis ETRAX FS General I/O"
> +       depends on CRIS || COMPILE_TEST
> +       depends on OF
> +       select GPIO_GENERIC

Very nice to have generic for this.

> +struct etraxfs_gpio_port {
> +       const char *label;
> +       unsigned int oe;
> +       unsigned int dout;
> +       unsigned int din;

consider using u32 for these.

> +       unsigned int ngpio;
> +};
> +
> +struct etraxfs_gpio_info {
> +       int num_ports;

unsigned?

> +       const struct etraxfs_gpio_port *ports;
> +};

Yours,
Linus Walleij
