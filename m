From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Subject: RE: [PATCH 3/3] gpio: sch: Enable IRQ support for Quark X1000
Date: Fri, 26 Sep 2014 09:14:48 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D0FBE89AD@PGSMSX108.gar.corp.intel.com>
References: <1410943745-9354-1-git-send-email-rebecca.swee.fun.chang@intel.com>
 <1410943745-9354-4-git-send-email-rebecca.swee.fun.chang@intel.com>
 <20140918113122.GO10854@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140918113122.GO10854@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Mika Westerberg' <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

> > @@ -203,6 +376,17 @@ static int sch_gpio_probe(struct platform_device
> *pdev)
> >  				 pdev->name))
> >  		return -EBUSY;
> >
> > +	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > +	sch->irq_support = !!irq;
> > +	if (sch->irq_support) {
> > +		sch->irq_num = irq->start;
> > +		if (sch->irq_num < 0) {
> > +			dev_warn(&pdev->dev,
> > +				 "failed to obtain irq number for device\n");
> > +			sch->irq_support = 0;
> > +		}
> > +	}
> > +
> >  	spin_lock_init(&sch->lock);
> >  	sch->iobase = res->start;
> >  	sch->chip = sch_gpio_chip;
> > @@ -251,17 +435,72 @@ static int sch_gpio_probe(struct platform_device
> *pdev)
> >  		return -ENODEV;
> >  	}
> >
> > +	err = gpiochip_add(&sch->chip);
> > +	if (err < 0)
> > +		goto err_sch_gpio;
> > +
> > +	if (sch->irq_support) {
> > +		sch->irq_base = irq_alloc_descs(-1, 0, sch->chip.ngpio,
> > +						NUMA_NO_NODE);
> > +		if (sch->irq_base < 0) {
> > +			dev_err(&pdev->dev,
> > +				"failed to add GPIO IRQ descs\n");
> > +			sch->irq_base = -1;
> > +			goto err_sch_intr_chip;
> > +		}
> 
> Was there some reason why you can't use gpiochip_irqchip_* helpers here?

I will look into the helpers function and see what I can change here.

> 
> > +
> > +		/* disable interrupts */
> > +		sch_gpio_irq_disable_all(sch, sch->chip.ngpio);
> > +
> > +		err = request_irq(sch->irq_num, sch_gpio_irq_handler,
> > +				  IRQF_SHARED, KBUILD_MODNAME, sch);
> 
> This seems weird, typically irqchip drivers don't call request_irq() directly but
> instead irq_set_chained_handler() or similar. With
> gpiochip_irqchip_* stuff you don't need even that.
> 
Regarding this, gpio-sch is actually using shared interrupts and the IRQ resources are from ACPI SCI. As per my understanding, resources from ACPI SCI might be shared for power management purposes. In this case, irq_set_chained_handler() might not be able to use here. What do you think?

Rebecca
