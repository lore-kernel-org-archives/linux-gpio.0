From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 143/182] powerpc: mpc52xx_gpt: use gpiochip data pointer
Date: Wed, 9 Dec 2015 17:27:46 -0600
Message-ID: <20151209232746.GC28304@deathstar>
References: <1449668466-4882-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33588 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754054AbbLIX1v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 18:27:51 -0500
Received: by iouu10 with SMTP id u10so78680831iou.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 15:27:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668466-4882-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>

On Wed, Dec 09, 2015 at 02:41:06PM +0100, Linus Walleij wrote:
> @@ -354,7 +349,7 @@ mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
>  	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK,
>  			MPC52xx_GPT_MODE_MS_GPIO);
>  
> -	rc = gpiochip_add(&gpt->gc);
> +	rc = gpiochip_add_data(&gpt->gc, gpt);
>  	if (rc)

Another place that dev_err references gpiochip_add instead of gpiochip_add_data.

>  		dev_err(gpt->dev, "gpiochip_add() failed; rc=%i\n", rc);
>  

Other places with references not associated with patches:
Documentation/zh_CN/gpio.txt
Documentation/gpio/gpio-legacy.txt
Documentation/gpio/driver.txt
