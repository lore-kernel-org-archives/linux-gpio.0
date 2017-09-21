From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: syscon: do not use raw "set" callback in syscon_gpio_dir_out
Date: Thu, 21 Sep 2017 13:23:44 +0200
Message-ID: <CACRpkdayo0Upfx21q7FJbVRRiqWTuHGfF=vYUpZHd+17TDUQbQ@mail.gmail.com>
References: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:46733 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751948AbdIULXp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 07:23:45 -0400
Received: by mail-it0-f50.google.com with SMTP id d192so257585itd.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 04:23:45 -0700 (PDT)
In-Reply-To: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Murzin <vladimir.murzin@arm.com>, Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>

I really need Alexander Shiyan to look at this patch.

The way i percieve it, .set is NULL if the chip does not
support output.

We should print the right error messages and bail out
if the user is anyway trying to set a line like that.

Yours,
Linus Walleij

On Wed, Aug 30, 2017 at 4:50 PM, Vladimir Murzin
<vladimir.murzin@arm.com> wrote:

> "set" callback is optional and can be NULL, instead use chip->set
> which always points at proper callback function.
>
> Fixes 2c341d62eb4b ("gpio: syscon: add soc specific callback to assign output value")
>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  drivers/gpio/gpio-syscon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 537cec7..cf88a0b 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -122,7 +122,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
>                                    BIT(offs % SYSCON_REG_BITS));
>         }
>
> -       priv->data->set(chip, offset, val);
> +       chip->set(chip, offset, val);
>
>         return 0;
>  }
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
