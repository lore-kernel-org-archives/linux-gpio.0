From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 07/54] gpio: kempld: Be sure to clamp return value
Date: Tue, 22 Dec 2015 07:29:18 -0800
Message-ID: <56796C4E.6020207@roeck-us.net>
References: <1450793588-22180-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59728 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932725AbbLVP3V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 10:29:21 -0500
In-Reply-To: <1450793588-22180-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Brunner Michael <Michael.Brunner@kontron.com>

On 12/22/2015 06:13 AM, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Brunner Michael <Michael.Brunner@kontron.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/gpio/gpio-kempld.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
> index 35dd1e0af364..297f849af725 100644
> --- a/drivers/gpio/gpio-kempld.c
> +++ b/drivers/gpio/gpio-kempld.c
> @@ -69,7 +69,7 @@ static int kempld_gpio_get(struct gpio_chip *chip, unsigned offset)
>   		= container_of(chip, struct kempld_gpio_data, chip);
>   	struct kempld_device_data *pld = gpio->pld;
>
> -	return kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
> +	return !!kempld_gpio_get_bit(pld, KEMPLD_GPIO_LVL_NUM(offset), offset);
>   }
>
>   static void kempld_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>

