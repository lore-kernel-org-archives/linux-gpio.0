From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc/gpio: Fix the wrong GPIO input data on MPC8572/MPC8536
Date: Tue, 19 Nov 2013 10:49:52 +0100
Message-ID: <CACRpkdaZnVn0N64XwxmjDPz0zTXSJvBLU76GBY3onGqKDHmrgw@mail.gmail.com>
References: <1384499789-3631-1-git-send-email-Gang.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33823 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850Ab3KSJtx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:49:53 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so2845678obc.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 01:49:52 -0800 (PST)
In-Reply-To: <1384499789-3631-1-git-send-email-Gang.Liu@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@freescale.com>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, b07421@freescale.com, r61911@freescale.com

On Fri, Nov 15, 2013 at 8:16 AM, Liu Gang <Gang.Liu@freescale.com> wrote:

> For MPC8572/MPC8536, the status of GPIOs defined as output
> cannot be determined by reading GPDAT register, so the code
> use shadow data register instead. But if the input pins are
> asserted high, they will always read high due to the shadow
> data, even if the pins are set to low.
>
> So the input pins should be read directly from GPDAT, not
> the shadow data.
>
> Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 9ae29cc..1d4ac75 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -71,6 +71,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>         struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
>
>         val = in_be32(mm->regs + GPIO_DAT) & ~in_be32(mm->regs + GPIO_DIR);
> +       mpc8xxx_gc->data &= in_be32(mm->regs + GPIO_DIR);
>
>         return (val | mpc8xxx_gc->data) & mpc8xxx_gpio2mask(gpio);
>  }

Anatolij, Ben: can either of you take a look at this patch and ACK it
if OK?

Yours,
Linus Walleij
