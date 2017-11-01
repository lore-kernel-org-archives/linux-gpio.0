From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl: pistachio: Use common error handling code in
 pistachio_gpio_register()
Date: Wed, 1 Nov 2017 13:18:36 +0300
Message-ID: <20171101101836.ubko2cmxeds6735j@mwanda>
References: <0b8eced6-c4d9-6b0b-ac23-de764622e91c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:27055 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751347AbdKAKTH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Nov 2017 06:19:07 -0400
Content-Disposition: inline
In-Reply-To: <0b8eced6-c4d9-6b0b-ac23-de764622e91c@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Damien Horsley <Damien.Horsley@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>

On Mon, Oct 30, 2017 at 06:51:19PM +0100, SF Markus Elfring wrote:
> @@ -1409,13 +1408,15 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
>  		if (ret < 0) {
>  			dev_err(pctl->dev, "Failed to add GPIO range %u: %d\n",
>  				i, ret);
> -			gpiochip_remove(&bank->gpio_chip);
> -			goto err;
> +			goto remove_chip;


It's better code to put the gpiochip_remove() before the goto, because
say we want to add more error handling before the remove_chip: label.
Now it doesn't work.


>  		}
>  	}
>  
>  	return 0;
> -err:
> +
> +remove_chip:
> +	gpiochip_remove(&bank->gpio_chip);
> +remove_chips:
>  	for (; i > 0; i--) {
>  		bank = &pctl->gpio_banks[i - 1];
>  		gpiochip_remove(&bank->gpio_chip);

regards,
dan carpenter

