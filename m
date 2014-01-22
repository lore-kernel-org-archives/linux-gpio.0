From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH] gpio: document how to make combined GPIO+irqchip drivers
Date: Wed, 22 Jan 2014 19:51:31 +0100
Message-ID: <20140122185131.GP20094@book.gsilab.sittig.org>
References: <1390399390-9414-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:47273 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618AbaAVSvf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2014 13:51:35 -0500
Content-Disposition: inline
In-Reply-To: <1390399390-9414-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>

On Wed, Jan 22, 2014 at 15:03 +0100, Linus Walleij wrote:
> 
> --- a/Documentation/gpio/driver.txt
> +++ b/Documentation/gpio/driver.txt
> @@ -62,6 +62,36 @@ Any debugfs dump method should normally ignore signals which haven't been
>  requested as GPIOs. They can use gpiochip_is_requested(), which returns either
>  NULL or the label associated with that GPIO when it was requested.
>  
> +GPIO drivers providing IRQs
> +---------------------------
> +It is custom that GPIO drivers (GPIO chips) are also providing interrupts,
> +most often cascaded off a parent interrupt controller, and in some special
> +cases the GPIO logic is melded with a SoC:s primary interrupt controller.

... with a SoC's primary ... (apostroph instead of colon)

> +gpiod_to_irq() is just a convenience function to figure out the IRQ for a
> +certain GPIO line and should not be relied upon to have been called before
> +the IRQ is used.
> +
> +So always prepare the hardware and make it ready for action in respective
> +callbacks from the GPIO and irqchip APIs. Do not rely on gpio_to_irq() having
> +been called first.

The two paragraphs refer to different routines (gpiod_to_irq()
and gpio_to_irq()) -- is this intentional?  (one might be the
equivalent of the other, just using different handles which
perfectly map to each other in any direction, haven't checked the
details)


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
