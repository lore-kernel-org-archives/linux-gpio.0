From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] RFC: let gpiod_get_optional et all return NULL when
 GPIOLIB is not enabled
Date: Fri, 6 Mar 2015 09:59:57 +0100
Message-ID: <20150306085957.GC10717@pengutronix.de>
References: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43264 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750926AbbCFJAY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 04:00:24 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, kernel@pengutronix.de, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello,

On Fri, Mar 06, 2015 at 09:26:26AM +0100, Linus Walleij wrote:
> On Thu, Feb 12, 2015 at 10:03 AM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > I wonder if gpiod_get_optional et all should be changed to return N=
ULL
> > instead.
>=20
> This is actually the norm in most subsystems returning cookie
> pointers, clk, regulator, pinctrl... a NULL pointer is a functional
> noop. But normally then NULL is returned from all stubs, not
> just optional.
>=20
> Alexandre, what do you say?
>=20
> > The obvious downside is that if the device tree specifies a
> > reset-gpio and the kernel just fails to use it because there is som=
e
> > code missing, this should better be an error. (The adau1977 code ha=
s
> > this problem already know, but when changing devm_gpiod_get_optiona=
l all
> > callers are affected.)
>=20
> Device Tree-specific problems is not something we design
> subsystems for, we try to just accomodate them. I'm not
> sure I fully understand what you mean here.
Consider you have a device that has:

	enable-gpio =3D <&gpio3 12 0>;

and you do in your driver:

	enablegpio =3D devm_gpiod_get_optional(... "enable" ...);

=2E If GPIOLIB is off, enablegpio gets assigned NULL and the driver
continues happily without enabling the device which most likely is a
bug.

So IMHO the logic in devm_gpiod_get_optional for the GPIOLIB=3Dn case
should be:

	if (device_has_gpio())
		return ERR_PTR(-ENOSYS);
	else
		return NULL;

=2E device_has_gpio should use similar logic like gpiod_get_index to ch=
eck
if there is a gpio. If this is considered to be too complicated for a
disabled subsystem, returning -ENOSYS unconditionally is better than
NULL.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
