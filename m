From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [PATCH RFT] gpio: zevio: Get correct gpio output value
Date: Mon, 7 Apr 2014 21:10:35 +0200
Message-ID: <20140407191035.GH11339@book.gsilab.sittig.org>
References: <1396852492.26619.1.camel@phoenix>
 <1456321.rfNnq0vY8Z@fabians-laptop.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:34345 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752718AbaDGTKh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 15:10:37 -0400
Content-Disposition: inline
In-Reply-To: <1456321.rfNnq0vY8Z@fabians-laptop.fritz.box>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Mon, 2014-04-07 at 17:17 +0200, Fabian Vogt wrote:
> 
> Hi,
> 
> IIRC I tested that and input and output are independant of each other.
> If you set a pin as output and write a 1 into the output register, but you connect the pin to ground physically output is "1" and input "0".
> Which behaviour is the correct one for gpio_get?

Please don't top-post, and wrap overly long lines!  Thanks.

I'd assume that gpio_get() should return the information about
the pin level ("is"), regardless of internal "want" state.  But
that's a guess (gut feeling), can't tell whether there is a
specified semantics, or whether this is supposed to be
"implementation defined".  Different hardware may have different
capabilites (like lack of support to read back what's on the
line, thus having to rely on internal registers which may differ
from the pin level).

> Am Montag, 7. April 2014, 14:34:52 schrieb Axel Lin:
> > Read gpio output value from ZEVIO_GPIO_OUTPUT.
> > The spin_lock is required to ensure the direction is not changed before reading
> > input/output value.
> > 
> > [ ... ]
> > @@ -81,9 +81,15 @@ static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
> >  static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
> >  {
> >  	struct zevio_gpio *controller = to_zevio_gpio(chip);
> > +	u32 val, dir;
> >  
> > -	/* Only reading allowed, so no spinlock needed */
> > -	u32 val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
> > +	spin_lock(&controller->lock);
> > +	dir = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_DIRECTION);
> > +	if (dir | BIT(ZEVIO_GPIO_BIT(pin)))
> > +		val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_INPUT);
> > +	else
> > +		val = zevio_gpio_port_get(controller, pin, ZEVIO_GPIO_OUTPUT);
> > +	spin_unlock(&controller->lock);

As a side effect of your making me look at the code:

Is the if() not an "always true" condition?  Should this be
s/|/\&/ instead?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
