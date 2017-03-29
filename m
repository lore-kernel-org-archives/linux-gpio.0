From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add a quirk to make Acer Chromebook
 keyboard work again
Date: Wed, 29 Mar 2017 16:19:37 +0300
Message-ID: <20170329131937.GW2957@lahna.fi.intel.com>
References: <20170329095932.73368-1-mika.westerberg@linux.intel.com>
 <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:30248 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755825AbdC2NTm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Mar 2017 09:19:42 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYm_wzJWskrkStgjXPM=F93S3K3HO-c5Tt=qSVJOxkGAw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Adam S Levy <theadamlevy@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 29, 2017 at 02:58:19PM +0200, Linus Walleij wrote:
> On Wed, Mar 29, 2017 at 11:59 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > However, it seems some CYAN Chromebooks, including Acer Chromebook
> > hardcodes these Linux IRQ numbers in the ACPI tables of the machine.
> > Since the numbering is different now, the IRQ meant for keyboard does
> > not match the Linux virtual IRQ number anymore making the keyboard
> > non-functional.
> 
> Well ain't that great. They made the totally unstable Linux IRQ number
> space into an ABI.
> 
> I wonder what the irqchip people think about that. I think Grant warned us
> that this could happen.
> 
> > Work this around by adding special quirk just for these machines where
> > we add back all GPIOs to the irqdomain. Rest of the Cherryview/Braswell
> > based machines will not be affected by the change.
> 
> Quirking seems right. But:
> 
> > +/*
> > + * Certain machines seem to hardcode Linux IRQ numbers in their ACPI
> > + * tables. Since we leave GPIOs that are not capable of generating
> > + * interrupts out of the irqdomain the numbering will be different and
> > + * cause devices using the hardcoded IRQ numbers fail. In order not to
> > + * break such machines we will only mask pins from irqdomain if the machine
> > + * is not listed below.
> > + */
> > +static const struct dmi_system_id chv_no_valid_mask[] = {
> > +       {
> > +               /* See https://bugzilla.kernel.org/show_bug.cgi?id=194945 */
> > +               .ident = "Acer Chromebook (CYAN)",
> > +               .matches = {
> > +                       DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> > +                       DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
> > +               },
> > +       }
> > +};
> 
> We match but...
> 
> >         const struct chv_gpio_pinrange *range;
> >         struct gpio_chip *chip = &pctrl->chip;
> > +       bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
> >         int ret, i, offset;
> >
> >         *chip = chv_gpio_chip;
> > @@ -1536,7 +1557,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
> >         chip->label = dev_name(pctrl->dev);
> >         chip->parent = pctrl->dev;
> >         chip->base = -1;
> > -       chip->irq_need_valid_mask = true;
> > +       chip->irq_need_valid_mask = need_valid_mask;
> 
> Isn't the right solution to translate this back to the offset from the "Linux
> IRQ" and use that offset? This quirk seems pretty violent.

So based on DMI strings instead of doing this, just correct the offset
and be done with it? Works for me.
