From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 3/3] pinctrl / gpio: Introduce .set_config() callback for
 GPIO chips
Date: Fri, 20 Jan 2017 15:36:27 +0200
Message-ID: <20170120133627.GK17297@lahna.fi.intel.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
 <20170119094820.83595-4-mika.westerberg@linux.intel.com>
 <CACRpkdbsOvJkpNtjvCXRNWV6dA6onzomn-E+9n=xJabmcRGbEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbsOvJkpNtjvCXRNWV6dA6onzomn-E+9n=xJabmcRGbEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2017 at 10:13:05AM +0100, Linus Walleij wrote:
> > +static int gpio_set_drive_mode(struct gpio_chip *gc, unsigned offset,
> > +                              enum pin_config_param mode)
> > +{
> > +       unsigned long config = { PIN_CONF_PACKED(mode, 0) };
> > +
> > +       return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
> > +}
> 
> I would name it gpio_set_drive_single_ended() as the open source/open
> drain is all we support here.

OK.

> >         if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
> >                 /* First see if we can enable open drain in hardware */
> > -               if (gc->set_single_ended) {
> > -                       ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
> > -                                                  LINE_MODE_OPEN_DRAIN);
> > -                       if (!ret)
> > -                               goto set_output_value;
> > -               }
> > +               ret = gpio_set_drive_mode(gc, gpio_chip_hwgpio(desc),
> > +                                         PIN_CONFIG_DRIVE_OPEN_DRAIN);
> > +               if (!ret)
> > +                       goto set_output_value;
> 
> Aha I see, so if we fail to set single ended we get to the next step.
> Nice.
> 
> >                 /* Emulate open drain by not actively driving the line high */
> >                 if (val)
> >                         return gpiod_direction_input(desc);
> >         }
> 
> (...)
> 
> > -               if (gc->set_single_ended) {
> > -                       ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
> > -                                                  LINE_MODE_OPEN_SOURCE);
> > -                       if (!ret)
> > -                               goto set_output_value;
> > -               }
> > +               ret = gpio_set_drive_mode(gc, gpio_chip_hwgpio(desc),
> > +                                         PIN_CONFIG_DRIVE_OPEN_SOURCE);
> >                 /* Emulate open source by not actively driving the line low */
> >                 if (!val)
> >                         return gpiod_direction_input(desc);
> 
> But here the handling seems to be wrong? You still need
> the if (!ret) goto set_output_value?

Good point. I'll fix that in the next version.
