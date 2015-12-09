From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 156/182] input: adp5589-keys: use gpiochip data pointer
Date: Wed, 9 Dec 2015 17:47:52 -0600
Message-ID: <20151209234752.GB8146@deathstar>
References: <1449668710-5785-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:36290 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533AbbLIXsB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 18:48:01 -0500
Received: by mail-ig0-f174.google.com with SMTP id ph11so1680191igc.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 15:48:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668710-5785-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Michael Hennerich <michael.hennerich@analog.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Wed, Dec 09, 2015 at 02:45:10PM +0100, Linus Walleij wrote:
> @@ -525,7 +525,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
>  
>  	mutex_init(&kpad->gpio_lock);
>  
> -	error = gpiochip_add(&kpad->gc);
> +	error = gpiochip_add_data(&kpad->gc, kpad);
>  	if (error) {
>  		dev_err(dev, "gpiochip_add failed, err: %d\n", error);

Another dev_err referencing gpiochip_add instead of gpiochip_add_data.

>  		return error;
> -- 
> 2.4.3
> 
