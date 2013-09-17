From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: [PATCH 6/7] ARM: ixp4: delete irq_to_gpio
Date: Tue, 17 Sep 2013 14:41:23 +0200
Message-ID: <m3a9jbtybw.fsf@intrepid.localdomain>
References: <1378816295-8205-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from inx.pm.waw.pl ([195.116.170.130]:44549 "EHLO inx.pm.waw.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752270Ab3IQMl0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 17 Sep 2013 08:41:26 -0400
In-Reply-To: <1378816295-8205-1-git-send-email-linus.walleij@linaro.org>
	(Linus Walleij's message of "Tue, 10 Sep 2013 14:31:35 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

Linus Walleij <linus.walleij@linaro.org> writes:

> This dangerous function is not used in the kernel, so let's
> just delete it.

Acked-by: Krzysztof Halasa <khc@pm.waw.pl>

> +++ b/arch/arm/mach-ixp4xx/common.c
> @@ -117,17 +117,6 @@ static int ixp4xx_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
>  	return -EINVAL;
>  }
>  
> -int irq_to_gpio(unsigned int irq)
> -{
> -	int gpio = (irq < 32) ? irq2gpio[irq] : -EINVAL;
> -
> -	if (gpio == -1)
> -		return -EINVAL;
> -
> -	return gpio;
> -}
> -EXPORT_SYMBOL(irq_to_gpio);
> -

-- 
Krzysztof Halasa
