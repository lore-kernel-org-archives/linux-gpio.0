From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 27 Apr 2017 00:31:30 +0300
Message-ID: <CAHp75VcvD6zxduczxu2WzJEDWKArhnXZd1jCZvWdiF=Gwbt5pw@mail.gmail.com>
References: <CAHp75VeHmOpSAAZM87_0Y120mrXpPG0aCns=Zp5tBTMh3GBXmw@mail.gmail.com>
 <1493042662-30435-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:35336 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967769AbdDZVbc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2017 17:31:32 -0400
In-Reply-To: <1493042662-30435-1-git-send-email-agust@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Apr 24, 2017 at 5:04 PM, Anatolij Gustschin <agust@denx.de> wrote:
> Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
> for the !GPIOLIB case to prevent build errors. Also add prototypes.

One nit below, otherwise
FWIW:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Linus, it would be nice if are okay with this approach. It will fix
that one user which might break a buiid on some kernel configurations.

>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
>  include/linux/gpio/consumer.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 933d936..6c0cc67 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -144,6 +144,11 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
>                                                 enum gpiod_flags flags,
>                                                 const char *label);

> +struct gpiod_lookup_table;

>  #else /* CONFIG_GPIOLIB */

> +struct gpiod_lookup_table;

No need to duplicate this. Just move out of #ifdef.

-- 
With Best Regards,
Andy Shevchenko
