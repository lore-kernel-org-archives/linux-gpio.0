From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 3/7 v2] input: misc: ixp4-beeper: use gpiolib strictly
Date: Tue, 17 Sep 2013 12:02:02 -0700
Message-ID: <20130917190202.GC6894@core.coreip.homeip.net>
References: <1379061160-22361-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:41575 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753492Ab3IQTCH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2013 15:02:07 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so7266855pab.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2013 12:02:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1379061160-22361-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 10:32:40AM +0200, Linus Walleij wrote:
> Request and free the GPIO line used for the beeper properly.
> Then use the gpiolib API to flip the output of the GPIO pin
> instead of relying on hacks to poke the register bits.
> 
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> Hi Dmitry, requesting an ACK for this to take it through the
> GPIO tree as part of an IXP4 clean-up attempt.
> 
> ChangeLog v1->v2:
> - Invert using the bang ! instead of XOR ~
> ---
>  drivers/input/misc/ixp4xx-beeper.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/ixp4xx-beeper.c b/drivers/input/misc/ixp4xx-beeper.c
> index f14afd0..17ccba8 100644
> --- a/drivers/input/misc/ixp4xx-beeper.c
> +++ b/drivers/input/misc/ixp4xx-beeper.c
> @@ -76,11 +76,13 @@ static int ixp4xx_spkr_event(struct input_dev *dev, unsigned int type, unsigned
>  
>  static irqreturn_t ixp4xx_spkr_interrupt(int irq, void *dev_id)
>  {
> +	unsigned int pin = (unsigned int) dev_id;
> +
>  	/* clear interrupt */
>  	*IXP4XX_OSST = IXP4XX_OSST_TIMER_2_PEND;
>  
>  	/* flip the beeper output */
> -	*IXP4XX_GPIO_GPOUTR ^= (1 << (unsigned int) dev_id);
> +	gpio_set_value(pin, !gpio_get_value(pin));
>  
>  	return IRQ_HANDLED;
>  }
> @@ -108,11 +110,15 @@ static int ixp4xx_spkr_probe(struct platform_device *dev)
>  	input_dev->sndbit[0] = BIT_MASK(SND_BELL) | BIT_MASK(SND_TONE);
>  	input_dev->event = ixp4xx_spkr_event;
>  
> +	err = gpio_request(dev->id, "ixp4-beeper");
> +	if (err)
> +		goto err_free_device;
> +
>  	err = request_irq(IRQ_IXP4XX_TIMER2, &ixp4xx_spkr_interrupt,
>  			  IRQF_NO_SUSPEND, "ixp4xx-beeper",
>  			  (void *) dev->id);
>  	if (err)
> -		goto err_free_device;
> +		goto err_free_gpio;
>  
>  	err = input_register_device(input_dev);
>  	if (err)
> @@ -124,6 +130,8 @@ static int ixp4xx_spkr_probe(struct platform_device *dev)
>  
>   err_free_irq:
>  	free_irq(IRQ_IXP4XX_TIMER2, (void *)dev->id);
> + err_free_gpio:
> +	gpio_free(dev->id);
>   err_free_device:
>  	input_free_device(input_dev);
>  
> @@ -142,6 +150,7 @@ static int ixp4xx_spkr_remove(struct platform_device *dev)
>  	ixp4xx_spkr_control(pin, 0);
>  
>  	free_irq(IRQ_IXP4XX_TIMER2, (void *)dev->id);
> +	gpio_free(dev->id);
>  
>  	return 0;
>  }
> -- 
> 1.8.3.1
> 

-- 
Dmitry
