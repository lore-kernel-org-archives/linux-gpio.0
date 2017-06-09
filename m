From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] gpio: mvebu: fix regmap_update_bits usage
Date: Fri, 9 Jun 2017 12:04:35 +0200
Message-ID: <20170609120435.60191c76@free-electrons.com>
References: <20170609100318.26450-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:35006 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751519AbdFIKEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 06:04:37 -0400
In-Reply-To: <20170609100318.26450-1-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Ralph Sennhauser <ralph.sennhauser@gmail.com>

Hello,

On Fri,  9 Jun 2017 12:03:18 +0200, Gregory CLEMENT wrote:

>  	regmap_update_bits(mvchip->regs, GPIO_IO_CONF_OFF,
> -			   BIT(pin), 1);
> +			   BIT(pin), BIT(pin));
>  
>  	return 0;
>  }
> @@ -364,7 +364,7 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
>  	mvebu_gpio_set(chip, pin, value);
>  
>  	regmap_update_bits(mvchip->regs, GPIO_IO_CONF_OFF,
> -			   BIT(pin), 0);
> +			   BIT(pin), BIT(pin));

Are you sure here? We want to clear the bit, so I guess the 0 is
appropriate, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
