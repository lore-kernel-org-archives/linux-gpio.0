From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Mon, 11 Jul 2016 12:43:07 +0300
Message-ID: <1468230187.30123.533.camel@linux.intel.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160711045503.GF14693@lahna.fi.intel.com>
	 <CACRpkdYHioyktfNojP6U+NQ4PjAos7d=ZvR0uRK16ZKGbuyXwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:40274 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751847AbcGKJnL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 05:43:11 -0400
In-Reply-To: <CACRpkdYHioyktfNojP6U+NQ4PjAos7d=ZvR0uRK16ZKGbuyXwQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Cohen <david.a.cohen@linux.intel.com>, "Wood, Brian J" <brian.j.wood@intel.com>

On Mon, 2016-07-11 at 11:13 +0200, Linus Walleij wrote:
> On Mon, Jul 11, 2016 at 6:55 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Fri, Jul 08, 2016 at 02:08:23PM +0300, Andy Shevchenko wrote:
> > > +static void mrfld_irq_ack(struct irq_data *d)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mrfld_gpio *priv =3D irq_da=
ta_get_irq_chip_data(d);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 gpio =3D irqd_to_hwirq(d);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *gisr =3D gpio_reg(&p=
riv->chip, gpio, GISR);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(BIT(gpio % 32), gisr);
> >=20
> > It just occured me that you actually need to take the lock here. If
> > another thread is doing series of updates on the same register this
> > might step over what the other thread is doing.
>=20
> I accept incremental patches, I think it's safe to begin with this
> merged
> and work from there if there are issues.

You were faster than me in case it's already merged. Otherwise there is
v3 I sent today.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
