From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
Date: Fri, 9 Dec 2016 00:15:51 +0100
Message-ID: <20161208231551.GL21834@bigcity.dyn.berto.se>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
 <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
 <1984659.qgJsdhyW2B@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1984659.qgJsdhyW2B@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On 2016-12-08 23:40:42 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thursday 08 Dec 2016 18:32:28 Niklas Söderlund wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Currently gpio modules are runtime-resumed at probe time. This means the
> > gpio module will be active all the time (except during system suspend,
> > if not configured as a wake-up source).
> > 
> > While an R-Car Gen2 gpio module retains pins configured for output at
> > the requested level while put in standby mode, gpio register cannot be
> > accessed while suspended.  Unfortunately pm_runtime_get_sync() cannot be
> > called from all contexts where gpio register access is needed. Hence
> > move the Runtime PM handling from probe/remove time to gpio request/free
> > time, which is probably the best we can do.
> > 
> > On r8a7791/koelsch, gpio modules 0, 1, 3, and 4 are now suspended during
> > normal use (gpio2 is used for LEDs and regulators, gpio5 for keys, gpio6
> > for SD-Card CD & WP, gpio7 for keys and regulators).
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > [Niklas: s/gpio_to_priv(chip)/gpiochip_get_data(chip)/]
> 
> Just curious, what's the rationale for this ?

This was changed for the whole driver after the original patch was 
applied (at the time of change the patch was not yet reverted), see [1].  
I needed to update this when I resurrected the patch, maybe I could have 
been more clever and reverted the revert patch but this felt cleaner, if 
it's better to do it the other way around and revert a revert please let 
me know so I can do so in the future.

[1] c7b6f457cb53bcee ("gpio: rcar: use gpiochip data pointer").

> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/gpio/gpio-rcar.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> > index 3b77c10..31ad288 100644
> > --- a/drivers/gpio/gpio-rcar.c
> > +++ b/drivers/gpio/gpio-rcar.c
> > @@ -242,11 +242,24 @@ static void
> > gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
> > 
> >  static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
> >  {
> > -	return pinctrl_request_gpio(chip->base + offset);
> > +	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
> > +	int error;
> > +
> > +	error = pm_runtime_get_sync(&p->pdev->dev);
> > +	if (error < 0)
> > +		return error;
> > +
> > +	error = pinctrl_request_gpio(chip->base + offset);
> > +	if (error)
> > +		pm_runtime_put(&p->pdev->dev);
> > +
> > +	return error;
> >  }
> > 
> >  static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
> >  {
> > +	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
> > +
> >  	pinctrl_free_gpio(chip->base + offset);
> > 
> >  	/*
> > @@ -254,6 +267,8 @@ static void gpio_rcar_free(struct gpio_chip *chip,
> > unsigned offset) * drive the GPIO pin as an output.
> >  	 */
> >  	gpio_rcar_config_general_input_output_mode(chip, offset, false);
> > +
> > +	pm_runtime_put(&p->pdev->dev);
> >  }
> > 
> >  static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned
> > offset) @@ -426,7 +441,6 @@ static int gpio_rcar_probe(struct
> > platform_device *pdev) }
> > 
> >  	pm_runtime_enable(dev);
> > -	pm_runtime_get_sync(dev);
> > 
> >  	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > @@ -495,7 +509,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
> > err1:
> >  	gpiochip_remove(gpio_chip);
> >  err0:
> > -	pm_runtime_put(dev);
> >  	pm_runtime_disable(dev);
> >  	return ret;
> >  }
> > @@ -506,7 +519,6 @@ static int gpio_rcar_remove(struct platform_device
> > *pdev)
> > 
> >  	gpiochip_remove(&p->gpio_chip);
> > 
> > -	pm_runtime_put(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  	return 0;
> >  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
