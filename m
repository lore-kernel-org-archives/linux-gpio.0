From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: pinctrl-imx: don't use invalid value of conf_reg
Date: Tue, 3 Feb 2015 20:01:41 +0100
Message-ID: <20150203190141.GE10842@pengutronix.de>
References: <1422399025-25636-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdbtpGU57-tPn9Z0rNvY4zLk+QE6A9Pd87vLUHOmRiB2yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:36620 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966193AbbBCTBr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 14:01:47 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbtpGU57-tPn9Z0rNvY4zLk+QE6A9Pd87vLUHOmRiB2yg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dong Aisheng <dong.aisheng@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 03, 2015 at 02:01:09PM +0100, Linus Walleij wrote:
> On Tue, Jan 27, 2015 at 11:50 PM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > The right check for conf_reg to be invalid it testing against -1 no=
t 0
> > as is done in the rest of the driver.
> >
> > This fixes an oops that can be triggered by:
> >
> >         cat /sys/kernel/debug/pinctrl/43fac000.iomuxc/*
> >
> > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core dr=
iver")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Patch applied.
>=20
> But...
>=20
> > -       if (!pin_reg || !pin_reg->conf_reg) {
> > +       if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {
>=20
> I can see that the other code checks for -1 in this variable.
> But where is conf_reg ever set to -1?
>=20
> freescale]$ git grep "\-1"
> pinctrl-imx.c:          if (pin_reg->mux_reg =3D=3D -1) {
> pinctrl-imx.c:  if (pin_reg->mux_reg =3D=3D -1)
> pinctrl-imx.c:  if (pin_reg->mux_reg =3D=3D -1)
> pinctrl-imx.c:  if (pin_reg->conf_reg =3D=3D -1) {
> pinctrl-imx.c:  if (pin_reg->conf_reg =3D=3D -1) {
> pinctrl-imx.c:  if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {
Uah, ugly. This member gets -1 by means of:

	memset(info->pin_regs, 0xff, sizeof(*info->pin_regs) * info->npins);

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
