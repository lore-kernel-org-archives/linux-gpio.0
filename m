From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] gpiolib: don't bother warning when failing to get gpios
Date: Fri, 29 Nov 2013 13:08:45 +0200
Message-ID: <20131129110845.GA3942@xps8300>
References: <1385716566-9810-1-git-send-email-heikki.krogerus@linux.intel.com>
 <CAAVeFuJUWcOKos3ds-ekRv6T0=sU6dtx5M3rQNTGKMDCVj68Eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:56156 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753813Ab3K2LJM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 06:09:12 -0500
Content-Disposition: inline
In-Reply-To: <CAAVeFuJUWcOKos3ds-ekRv6T0=sU6dtx5M3rQNTGKMDCVj68Eg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

On Fri, Nov 29, 2013 at 06:37:35PM +0900, Alexandre Courbot wrote:
> On Fri, Nov 29, 2013 at 6:16 PM, Heikki Krogerus
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 4e10b10..2f0305e 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2434,10 +2434,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
> >                 desc = gpiod_find(dev, con_id, idx, &flags);
> >         }
> >
> > -       if (IS_ERR(desc)) {
> > -               dev_warn(dev, "lookup for GPIO %s failed\n", con_id);
> > +       if (IS_ERR(desc))
> >                 return desc;
> > -       }
> >
> >         status = gpiod_request(desc, con_id);
> 
> I kind of agree with the logic that motivates this patch, but how
> about turning this warning into dev_dbg() instead so that people who
> wish so can still continue using it?

Sure, I'll send v2 of this and do just that.

Thanks,

-- 
heikki
