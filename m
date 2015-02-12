From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Fix section mistmatch(es)
Date: Thu, 12 Feb 2015 22:59:41 +0100
Message-ID: <CAPybu_0o-oru5CnBESQqOrijGCuNCZPBqK0WGt1hwDMnc_TT=A@mail.gmail.com>
References: <1423777994-17925-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:46016 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751522AbbBLWAE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Feb 2015 17:00:04 -0500
Received: by labge10 with SMTP id ge10so12689474lab.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2015 14:00:01 -0800 (PST)
In-Reply-To: <1423777994-17925-1-git-send-email-Emilian.Medve@Freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Emil Medve <Emilian.Medve@freescale.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Peter Korsgaard <jacmet@sunsite.dk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Looks good to me

Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

On Thu, Feb 12, 2015 at 10:53 PM, Emil Medve
<Emilian.Medve@freescale.com> wrote:
> WARNING: drivers/gpio/built-in.o(.text+0x3962): Section mismatch in reference from the function mpc8xxx_probe() to the variable .init.data:mpc8xxx_gpio_ids
> The function mpc8xxx_probe() references
> the variable __initdata mpc8xxx_gpio_ids.
> This is often because mpc8xxx_probe lacks a __initdata
> annotation or the annotation of mpc8xxx_gpio_ids is wrong.
>
> WARNING: drivers/gpio/built-in.o(.text+0x396a): Section mismatch in reference from the function mpc8xxx_probe() to the variable .init.data:mpc8xxx_gpio_ids
> The function mpc8xxx_probe() references
> the variable __initdata mpc8xxx_gpio_ids.
> This is often because mpc8xxx_probe lacks a __initdata
> annotation or the annotation of mpc8xxx_gpio_ids is wrong.
>
> WARNING: drivers/gpio/built-in.o(.data+0x48): Section mismatch in reference from the variable mpc8xxx_plat_driver to the variable .init.data:mpc8xxx_gpio_ids
> The variable mpc8xxx_plat_driver references
> the variable __initdata mpc8xxx_gpio_ids
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
> Introduced in '98686d9a5 gpio: mpc8xxx: Convert to platform device interface'
>
> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index a6952ba3..59c4c11 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -334,7 +334,7 @@ static struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
>         .xlate  = irq_domain_xlate_twocell,
>  };
>
> -static struct of_device_id mpc8xxx_gpio_ids[] __initdata = {
> +static const struct of_device_id mpc8xxx_gpio_ids[] = {
>         { .compatible = "fsl,mpc8349-gpio", },
>         { .compatible = "fsl,mpc8572-gpio", },
>         { .compatible = "fsl,mpc8610-gpio", },
> --
> 2.3.0
>



-- 
Ricardo Ribalda
