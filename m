From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] emev2: GPIOLIB: Enable support for OF
Date: Thu, 29 Aug 2013 19:41:42 +0200
Message-ID: <CACRpkdZB+Dm1jhWRu+rdT0V7Q0iwozsd2gQ6M+=55h2SJHQHWw@mail.gmail.com>
References: <1377623069-32678-1-git-send-email-ian.molton@codethink.co.uk>
	<1377623069-32678-2-git-send-email-ian.molton@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:47509 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755149Ab3H2Rlm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 13:41:42 -0400
Received: by mail-oa0-f44.google.com with SMTP id l17so1004371oag.17
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2013 10:41:42 -0700 (PDT)
In-Reply-To: <1377623069-32678-2-git-send-email-ian.molton@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ian Molton <ian.molton@codethink.co.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Tue, Aug 27, 2013 at 7:04 PM, Ian Molton <ian.molton@codethink.co.uk> wrote:

> Signed-off-by: Ian Molton <ian.molton@codethink.co.uk>
> ---
>  drivers/gpio/gpio-em.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
> index 5cba855..279821e 100644
> --- a/drivers/gpio/gpio-em.c
> +++ b/drivers/gpio/gpio-em.c
> @@ -303,6 +303,7 @@ static int em_gio_probe(struct platform_device *pdev)
>         }
>
>         gpio_chip = &p->gpio_chip;
> +       gpio_chip->of_node = pdev->dev.of_node;

This doesn't work on non-DT compiles.

Look at struct gpio_chip:

#if defined(CONFIG_OF_GPIO)
        /*
         * If CONFIG_OF is enabled, then all GPIO controllers described in the
         * device tree automatically may have an OF translation
         */
        struct device_node *of_node;
        int of_gpio_n_cells;
        int (*of_xlate)(struct gpio_chip *gc,
                        const struct of_phandle_args *gpiospec, u32 *flags);
#endif

Either the statement needs to be inside #ifdef CONFIG_OF_GPIO
or the Emma driver need to select OF_GPIO in its Kconfig
entry.

Yours,
Linus Walleij
