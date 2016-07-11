From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Mon, 11 Jul 2016 12:45:55 +0300
Message-ID: <1468230355.30123.536.camel@linux.intel.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <CACRpkdZVvdTy6VRLEUQ_p_G3Eio-afY8czVaRAhPJn0_cCYw4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:23676 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751847AbcGKJqA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 05:46:00 -0400
In-Reply-To: <CACRpkdZVvdTy6VRLEUQ_p_G3Eio-afY8czVaRAhPJn0_cCYw4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>, "Wood, Brian J" <brian.j.wood@intel.com>

On Mon, 2016-07-11 at 11:06 +0200, Linus Walleij wrote:
> On Fri, Jul 8, 2016 at 1:08 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>=20
> > Intel Merrifield platform has a special GPIO controller to drive
> > pads when they
> > are muxed in corresponding mode.
> >=20
> > Intel Merrifield GPIO IP is slightly different here and there in
> > comparison to
> > the older Intel MID platforms. These differences include in
> > particular the
> > shaked register offsets, specific support of level triggered
> > interrupts and
> > wake capable sources, as well as a pinctrl which is a separate IP.
> >=20
> > Instead of uglifying existing driver I decide to provide a new one
> > slightly
> > based on gpio-intel-mid.c. So, anyone can easily compare what
> > changes are
> > happened to be here.
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> That is a nice driver.
>=20
> I'm especially fond of the way you carefully handle the edge vs
> level IRQs, good job.

Thanks!

>=20
> > +static const struct mrfld_gpio_pinrange mrfld_gpio_ranges[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(0, 11, 146=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(12, 13, 14=
4),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(14, 15, 35=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(16, 16, 16=
4),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(17, 18, 10=
5),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(19, 22, 10=
1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(23, 30, 10=
7),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(32, 43, 67=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(44, 63, 19=
5),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(64, 67, 14=
0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(68, 69, 16=
5),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(70, 71, 65=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(72, 76, 22=
8),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(77, 86, 37=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(87, 87, 48=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(88, 88, 47=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(89, 96, 49=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(97, 97, 34=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(102, 119, =
83),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(120, 123, =
79),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(124, 135, =
115),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(137, 142, =
158),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(154, 163, =
24),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(164, 176, =
215),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(177, 189, =
127),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPIO_PINRANGE(190, 191, =
178),
> > +};
>=20
> In device tree we put this into the hardware description (the device
> tree),
> and I'm expecting ACPI to come up with something similar, but I guess
> that
> for a pure PCI device you have no choice but to do it this way.
>=20
> And you also do it the elegant way by associating with the gpiochip
> rather than the other way around from the pin controller side.

Unfortunately this all Intel MID era is scary SFI, we have no other
choice for most of the drivers for it.

But for ACPI we would really try hard to do our best and provide
information in some tables/properties.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
