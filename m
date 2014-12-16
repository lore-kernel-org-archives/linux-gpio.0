From: Daniel Baluta <daniel.baluta@intel.com>
Subject: Re: [PATCH RFT] gpio: dln2: Fix gpio output value in dln2_gpio_direction_output()
Date: Tue, 16 Dec 2014 18:52:45 +0200
Message-ID: <5490635D.6040305@intel.com>
References: <1418740800.10278.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:26560 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbaLPQ4l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Dec 2014 11:56:41 -0500
In-Reply-To: <1418740800.10278.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Octavian Purdila <octavian.purdila@intel.com>, "Palcu, Laurentiu" <laurentiu.palcu@intel.com>



On 12/16/2014 04:40 PM, Axel Lin wrote:
> dln2_gpio_direction_output() ignored the state passed into it. Fix it.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Tested-by: Daniel Baluta <daniel.baluta@intel.com>

> ---
> I don't have this hardware handy, so only compile test.
>   drivers/gpio/gpio-dln2.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
> index 978b51e..1434844 100644
> --- a/drivers/gpio/gpio-dln2.c
> +++ b/drivers/gpio/gpio-dln2.c
> @@ -267,6 +267,7 @@ static int dln2_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>   static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>   				      int value)
>   {
> +	dln2_gpio_set(chip, offset, value);
>   	return dln2_gpio_set_direction(chip, offset, DLN2_GPIO_DIRECTION_OUT);
>   }
>
>
