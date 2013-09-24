From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] RFC: gpio: add API to be strict about GPIO IRQ usage
Date: Tue, 24 Sep 2013 11:51:42 -0600
Message-ID: <5241D12E.4050405@wwwdotorg.org>
References: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:39698 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877Ab3IXSAQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Sep 2013 14:00:16 -0400
In-Reply-To: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>

On 09/24/2013 05:33 AM, Linus Walleij wrote:
> It is currently often possible in many GPIO drivers to request
> a GPIO line to be used as IRQ after calling gpio_to_irq() and,
> as the gpiolib is not aware of this, set the same line to
> output and start driving it, with undesired side effects.
> 
> As it is a bogus usage scenario to request a line flagged as
> output to used as IRQ, we introduce APIs to let gpiolib track
> the use of a line as IRQ, and also set this flag from the
> userspace ABI.
> 
> In this RFC patch we also augment the Nomadik pinctrl driver
> to use this API to give an idea of how it is to be used.
> It is probably not possible to lock line as IRQ in the gpiolib
> .to_irq() callback, as the line may have different use cases
> over time in a system. For a certain system or driver it may
> however be possible to lock the line as IRQ in the .to_irq()
> path. An alternative approach is to let the irq_chip
> .irq_enable() callback do this.
> 
> The API is symmetric so that lines can also be unflagged from
> IRQ use by e.g. .irq_disable(). The debugfs file is altered
> so that we see if a line is reserved for IRQ.

OK, overall this seems like a reasonable general approach. I have a
couple comments on the implementation though:

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c

> @@ -466,6 +478,13 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
>  	if (ret < 0)
>  		goto free_id;
>  
> +	ret = gpiod_lock_as_irq(desc);
> +	if (ret < 0) {
> +		gpiod_warn(desc,
> +			   "failed to flag the GPIO for IRQ\n");
> +		goto free_id;
> +	}

I believe gpio_setup_irq() can be called with flags==0 (disable IRQ
usage) or flags!=0 (set up IRQ usage). As such, I believe that block of
code needs to check flags, and either call gpiod_lock_as_irq() or
gpio_unlock_as_irq() as appropriate.

> diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
> @@ -795,6 +795,14 @@ static int nmk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct nmk_gpio_chip *nmk_chip =
>  		container_of(chip, struct nmk_gpio_chip, chip);
> +	int ret;
> +
> +	ret = gpio_lock_as_irq(chip, offset);

I don't think that gpio_to_irq() is the correct place to call the new
function, for two reasons:

1)

Not all paths that use interrupts call gpio_to_irq(). It's perfectly
valid for a driver to receive an IRQ number, request it, and be done.
The is commmon when a driver only cares about IRQ functionality and not
GPIO functionality, and hence did not receive a GPIO and convert it to
the IRQ.

To solve this, I think irq_chip drivers should call the new gpiolib
functions when the IRQ is actually requested or set up.

Related, where does gpio_unlock_as_irq() get called in the Nomadik
driver? It should happen when free_irq() is called.

2)

(Nit):

The fact that gpio_to_irq() was called doesn't actually guarantee that
the IRQ will be requested. Admittedly it's silly to call gpio_to_irq()
if you're not going to request the IRQ, adn this can be considered a
bug, but it can be done. This might happen (at least temporarily) due to
deferred probe.
