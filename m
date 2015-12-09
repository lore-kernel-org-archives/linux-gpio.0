From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 026/182] gpio: intel-mid: use gpiochip data pointer
Date: Wed, 9 Dec 2015 17:44:48 -0600
Message-ID: <20151209234448.GA8146@deathstar>
References: <1449666981-30980-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:35966 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753886AbbLIXoz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 18:44:55 -0500
Received: by mail-ig0-f174.google.com with SMTP id ph11so1638039igc.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 15:44:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449666981-30980-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, David Cohen <david.a.cohen@linux.intel.com>

On Wed, Dec 09, 2015 at 02:16:21PM +0100, Linus Walleij wrote:
> @@ -406,7 +401,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
>  	spin_lock_init(&priv->lock);
>  
>  	pci_set_drvdata(pdev, priv);
> -	retval = gpiochip_add(&priv->chip);
> +	retval = gpiochip_add_data(&priv->chip, priv);
>  	if (retval) {
>  		dev_err(&pdev->dev, "gpiochip_add error %d\n", retval);

Another instance where dev_err references gpiochip_add instead of
gpiochip_add_data.

>  		return retval;
> -- 
> 2.4.3
> 
