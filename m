From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 5/5] gpiolib: uniform messages in gpiod_find()
Date: Thu, 05 Dec 2013 11:13:52 +0200
Message-ID: <1386234832.1871.67.camel@smile>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1386164580-32288-6-git-send-email-andriy.shevchenko@linux.intel.com>
	 <529FE2A4.3040101@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:36343 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751996Ab3LEJOV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 04:14:21 -0500
In-Reply-To: <529FE2A4.3040101@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, 2013-12-05 at 11:19 +0900, Alex Courbot wrote:
> On 12/04/2013 10:43 PM, Andy Shevchenko wrote:
> > This patch uniforms messages in gpiod_find() to follow what chip_* do.
> >
> > There is no functional change.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   drivers/gpio/gpiolib.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 013e5a5..cbd7b34 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2391,13 +2391,13 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
> >   		chip = find_chip_by_name(p->chip_label);
> >
> >   		if (!chip) {
> > -			dev_warn(dev, "cannot find GPIO chip %s\n",
> > +			dev_warn(dev, "%s: GPIO chip: cannot find\n",
> >   				 p->chip_label);
> 
> Changing the format of the message makes it look like the chip has 
> already been resolved while this is not the case yet.
> 
> >   			continue;
> >   		}
> >
> >   		if (chip->ngpio <= p->chip_hwnum) {
> > -			dev_warn(dev, "GPIO chip %s has %d GPIOs\n",
> > +			dev_warn(dev, "%s: GPIO chip: has %d GPIOs\n",
> >   				 chip->label, chip->ngpio);
> >   			continue;
> >   		}
> 
> The message is going to look something like:
> 
> foo.0: gpiochip.0: GPIO chip: has X GPIOs
> 
> ... which seems kind of confusing.
> 
> All in all I'm not convinced this patch is necessary.

Okay, will drop it away.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

