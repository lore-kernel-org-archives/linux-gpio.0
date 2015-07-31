From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 1/2] gpio: don't override irq_*_resources() callbacks
Date: Fri, 31 Jul 2015 17:54:27 +0300
Message-ID: <55BB8C23.1050200@ti.com>
References: <1438346937-9020-1-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:52708 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754504AbbGaOyd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2015 10:54:33 -0400
In-Reply-To: <1438346937-9020-1-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>, linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/31/2015 03:48 PM, Rabin Vincent wrote:
> If the driver has specified its own irq_{request/release}_resources()
> functions, don't override them.  The gpio-etraxfs driver will use this.
> 
> Signed-off-by: Rabin Vincent <rabin@rab.in>
> ---
>   drivers/gpio/gpiolib.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bf4bd1d..6865874 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -636,8 +636,12 @@ int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
>   		gpiochip->irqchip = NULL;
>   		return -EINVAL;
>   	}
> -	irqchip->irq_request_resources = gpiochip_irq_reqres;
> -	irqchip->irq_release_resources = gpiochip_irq_relres;
> +
> +	if (!irqchip->irq_request_resources &&
> +	    !irqchip->irq_release_resources) {
> +		irqchip->irq_request_resources = gpiochip_irq_reqres;
> +		irqchip->irq_release_resources = gpiochip_irq_relres;
> +	}

I think, it will be better to handle req/rel cases separately.

>   
>   	/*
>   	 * Prepare the mapping since the irqchip shall be orthogonal to
> 

Nice, thanks. I need the same actually, but I propose to make
gpiochip_irq_reqres/gpiochip_irq_relres public also, so drivers can re-use them.

-- 
regards,
-grygorii
