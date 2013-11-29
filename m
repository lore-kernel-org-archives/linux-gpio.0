From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: don't bother warning when failing to get gpios
Date: Fri, 29 Nov 2013 18:37:35 +0900
Message-ID: <CAAVeFuJUWcOKos3ds-ekRv6T0=sU6dtx5M3rQNTGKMDCVj68Eg@mail.gmail.com>
References: <1385716566-9810-1-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:64460 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753814Ab3K2Jh4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:37:56 -0500
Received: by mail-ie0-f178.google.com with SMTP id lx4so15591439iec.23
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 01:37:55 -0800 (PST)
In-Reply-To: <1385716566-9810-1-git-send-email-heikki.krogerus@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 6:16 PM, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> It's the drivers responsibility to react on failure to get
> the gpio descriptors and not the frameworks. Since there are
> some common peripherals that may or may not have certain
> pins connected to gpio lines, depending on the platform,
> printing the warning there may end up generating useless bug
> reports.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4e10b10..2f0305e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2434,10 +2434,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
>                 desc = gpiod_find(dev, con_id, idx, &flags);
>         }
>
> -       if (IS_ERR(desc)) {
> -               dev_warn(dev, "lookup for GPIO %s failed\n", con_id);
> +       if (IS_ERR(desc))
>                 return desc;
> -       }
>
>         status = gpiod_request(desc, con_id);

I kind of agree with the logic that motivates this patch, but how
about turning this warning into dev_dbg() instead so that people who
wish so can still continue using it?
