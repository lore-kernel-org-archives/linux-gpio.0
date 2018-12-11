From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] gpio: mockup: use irq_sim_fire_edge()
Date: Tue, 11 Dec 2018 15:15:09 +0100
Message-ID: <20181211141509.6x74jlzipj6o2exh@pengutronix.de>
References: <20181120134032.31645-1-brgl@bgdev.pl>
 <20181120134032.31645-3-brgl@bgdev.pl>
 <20181203110916.eseh2udxvhi4lf3v@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203110916.eseh2udxvhi4lf3v@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hello Bartosz,

On Mon, Dec 03, 2018 at 12:09:16PM +0100, Uwe Kleine-König wrote:
> On Tue, Nov 20, 2018 at 02:40:32PM +0100, Bartosz Golaszewski wrote:
> > @@ -213,7 +213,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
> >  	chip = priv->chip;
> >  
> >  	gpiod_set_value_cansleep(desc, val);
> > -	irq_sim_fire(&chip->irqsim, priv->offset);
> > +	edge = val == 0 ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> > +	irq_sim_fire_edge(&chip->irqsim, priv->offset, edge);
> 
> If I write 0 twice into the debugfs file, does it fire two irqs or only
> one? I think it fires two but only one would be the right behaviour?!

If you still think that patch 1 of this series is the way to go, I think
this objection is still valid. Then you need to check the state of the
line by at least calling (something like) .get_value to determine if the
previous value was different.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
