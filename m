From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] gpio: make sure gpiod_to_irq() returns negative on NULL
 desc
Date: Fri, 17 Jun 2016 18:09:15 +0200
Message-ID: <e8975884-ab05-4bb2-114e-8b78009f2c3c@redhat.com>
References: <1466024604-28014-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54404 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752780AbcFQQJV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 17 Jun 2016 12:09:21 -0400
In-Reply-To: <1466024604-28014-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>

Hi,

On 15-06-16 23:03, Linus Walleij wrote:
> commit 54d77198fdfbc4f0fe11b4252c1d9c97d51a3264
> ("gpio: bail out silently on NULL descriptors")
> doesn't work for gpiod_to_irq(): drivers assume that NULL
> descriptors will give negative IRQ numbers in return.
>
> It has been pointed out that returning 0 is NO_IRQ and that
> drivers should be amended to treat this as an error, but that
> is for the longer term: now let us repair the semantics.
>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I can confirm that this fixes the problem for me:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Thanks & Regards,

Hans

> ---
>  drivers/gpio/gpiolib.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 58d822d7e8da..f39bf05993e7 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2056,7 +2056,14 @@ int gpiod_to_irq(const struct gpio_desc *desc)
>  	struct gpio_chip *chip;
>  	int offset;
>
> -	VALIDATE_DESC(desc);
> +	/*
> +	 * Cannot VALIDATE_DESC() here as gpiod_to_irq() consumer semantics
> +	 * requires this function to not return zero on an invalid descriptor
> +	 * but rather a negative error number.
> +	 */
> +	if (!desc || !desc->gdev || !desc->gdev->chip)
> +		return -EINVAL;
> +
>  	chip = desc->gdev->chip;
>  	offset = gpio_chip_hwgpio(desc);
>  	if (chip->to_irq) {
>
