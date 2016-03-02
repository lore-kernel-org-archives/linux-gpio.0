From: Gang Liu <gang.liu@nxp.com>
Subject: Re: [RFT][PATCH v2 3/3] gpio: mpc8xxx: Slightly update the code for
 better readability
Date: Wed, 2 Mar 2016 07:32:03 +0000
Message-ID: <DB4PR04MB266BAA3729D42152F48F49C82BC0@DB4PR04MB266.eurprd04.prod.outlook.com>
References: <1456125772.27297.0.camel@ingics.com>
 <1456125894.27297.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-am1on0073.outbound.protection.outlook.com ([157.56.112.73]:59456
	"EHLO emea01-am1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751240AbcCBHcG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2016 02:32:06 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 2/22/2016 3:25 PM, Axel Lin wrote:
> Setting gc->direction_output to gc->direction_output looks strange.
> I think this change makes the intention more clear.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index bc042ad6..425501c 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -339,8 +339,11 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  	 */
>  	mpc8xxx_irq_chip.irq_set_type = devtype->irq_set_type;
>  
> -	gc->direction_output = devtype->gpio_dir_out ?: gc->direction_output;
> -	gc->get = devtype->gpio_get ?: gc->get;
> +	if (devtype->gpio_dir_out)
> +		gc->direction_output = devtype->gpio_dir_out;
> +	if (devtype->gpio_get)
> +		gc->get = devtype->gpio_get;
> +
>  	gc->to_irq = mpc8xxx_gpio_to_irq;
>  
>  	ret = gpiochip_add_data(gc, mpc8xxx_gc);
Ok, maybe it's more clear.

Liu Gang
