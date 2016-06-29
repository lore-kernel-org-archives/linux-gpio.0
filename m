From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/1] gpio: max77620: get gpio value based on direction
Date: Wed, 29 Jun 2016 14:08:50 +0900
Message-ID: <CAAVeFuJRrQ2_5mU-eRu=iuBygv7WQtnRov9zUWXPaBV=7Wdpdg@mail.gmail.com>
References: <1467024984-28138-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34826 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751916AbcF2FK6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 01:10:58 -0400
In-Reply-To: <1467024984-28138-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>

On Mon, Jun 27, 2016 at 7:56 PM, Venkat Reddy Talla
<vreddytalla@nvidia.com> wrote:
> Gpio direction is determined by DIRx bit of GPIO
> configuration register, return max77620 gpio value
> based on direction in or out.
>
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> ---
>  drivers/gpio/gpio-max77620.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index 8658c32..b46b436 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -123,7 +123,10 @@ static int max77620_gpio_get(struct gpio_chip *gc, unsigned int offset)
>                 return ret;
>         }
>
> -       return !!(val & MAX77620_CNFG_GPIO_INPUT_VAL_MASK);
> +       if  (val & MAX77620_CNFG_GPIO_DIR_MASK)
> +               return !!(val & MAX77620_CNFG_GPIO_INPUT_VAL_MASK);
> +       else
> +               return !!(val & MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK);

Looks sensible!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
