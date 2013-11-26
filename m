From: Liu Gang <Gang.Liu@freescale.com>
Subject: Re: [PATCH v2] powerpc/gpio: Fix the wrong GPIO input data on
 MPC8572/MPC8536
Date: Tue, 26 Nov 2013 17:20:44 +0800
Message-ID: <1385457644.10928.7.camel@linux>
References: <1385107960-373-1-git-send-email-Gang.Liu@freescale.com>
	 <D582D1B3-B20B-4860-B1DE-DDCD04B5D0BA@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]:25246
	"EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752815Ab3KZJUs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 04:20:48 -0500
In-Reply-To: <D582D1B3-B20B-4860-B1DE-DDCD04B5D0BA@kernel.crashing.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, agust@denx.de, b07421@freescale.com, linus.walleij@linaro.org, r61911@freescale.com

On Fri, 2013-11-22 at 14:51 -0600, Kumar Gala wrote:
> > drivers/gpio/gpio-mpc8xxx.c | 8 ++++++--
> > 1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> > index 914e859..d7d6d72 100644
> > --- a/drivers/gpio/gpio-mpc8xxx.c
> > +++ b/drivers/gpio/gpio-mpc8xxx.c
> > @@ -70,10 +70,14 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> > 	u32 val;
> > 	struct of_mm_gpio_chip *mm = to_of_mm_gpio_chip(gc);
> > 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
> > +	u32 out_mask, out_shadow;
> > 
> > -	val = in_be32(mm->regs + GPIO_DAT) & ~in_be32(mm->regs + GPIO_DIR);
> > +	out_mask = in_be32(mm->regs + GPIO_DIR);
> > 
> > -	return (val | mpc8xxx_gc->data) & mpc8xxx_gpio2mask(gpio);
> > +	val = in_be32(mm->regs + GPIO_DAT) & ~out_mask;
> > +	out_shadow = mpc8xxx_gc->data & out_mask;
> > +
> > +	return (val | out_shadow) & mpc8xxx_gpio2mask(gpio);
> > }
> 
> I really think a comment is worth adding here about why we do this.
> 
> - k

Hi, Kumar,
Thanks for your comment. In fact, there already had some comments above
the function:

/* Workaround GPIO 1 errata on MPC8572/MPC8536. The status of GPIOs
 * defined as output cannot be determined by reading GPDAT register,
 * so we use shadow data register instead. The status of input pins
 * is determined by reading GPDAT register.
 */

Best Regards,
Liu Gang






