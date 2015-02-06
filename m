From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: pinctrl-imx: don't use invalid value of
 =?UTF-8?Q?conf=5Freg?=
Date: Fri, 06 Feb 2015 15:23:50 +0100
Message-ID: <8c67105fcfe76ae1dd86e8c65954275d@agner.ch>
References: <1422399025-25636-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdbtpGU57-tPn9Z0rNvY4zLk+QE6A9Pd87vLUHOmRiB2yg@mail.gmail.com>
 <20150203190141.GE10842@pengutronix.de>
 <CACRpkdYXW5X7bSiRPTC3uHT=s+hjxj+jS0YJCBWrcmzHWkpqHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:53749 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbbBFOYR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Feb 2015 09:24:17 -0500
In-Reply-To: <CACRpkdYXW5X7bSiRPTC3uHT=s+hjxj+jS0YJCBWrcmzHWkpqHg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org, Dong Aisheng <dong.aisheng@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>

On 2015-02-05 14:53, Linus Walleij wrote:
> On Tue, Feb 3, 2015 at 8:01 PM, Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>> On Tue, Feb 03, 2015 at 02:01:09PM +0100, Linus Walleij wrote:
>>> On Tue, Jan 27, 2015 at 11:50 PM, Uwe Kleine-K=C3=B6nig
>>> <u.kleine-koenig@pengutronix.de> wrote:
>>>
>>> > The right check for conf_reg to be invalid it testing against -1 =
not 0
>>> > as is done in the rest of the driver.
>>> >
>>> > This fixes an oops that can be triggered by:
>>> >
>>> >         cat /sys/kernel/debug/pinctrl/43fac000.iomuxc/*
>>> >
>>> > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core =
driver")

This was actually introduce by me in 3dac1918a491 ("pinctrl: imx: detec=
t
uninitialized pins").

>>> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
=2Ede>
>>>
>>> Patch applied.
>>>
>>> But...
>>>
>>> > -       if (!pin_reg || !pin_reg->conf_reg) {
>>> > +       if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {
>>>
>>> I can see that the other code checks for -1 in this variable.
>>> But where is conf_reg ever set to -1?
>>>
>>> freescale]$ git grep "\-1"
>>> pinctrl-imx.c:          if (pin_reg->mux_reg =3D=3D -1) {
>>> pinctrl-imx.c:  if (pin_reg->mux_reg =3D=3D -1)
>>> pinctrl-imx.c:  if (pin_reg->mux_reg =3D=3D -1)
>>> pinctrl-imx.c:  if (pin_reg->conf_reg =3D=3D -1) {
>>> pinctrl-imx.c:  if (pin_reg->conf_reg =3D=3D -1) {
>>> pinctrl-imx.c:  if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {
>> Uah, ugly. This member gets -1 by means of:
>>
>>         memset(info->pin_regs, 0xff, sizeof(*info->pin_regs) * info-=
>npins);
>=20
> OMG. Uwe can you make a patch changing that initialization
> code to something sane? We can't have it like this.

Oh sorry, this was actually me, in the commit mentioned above. That's
ugly, I agree. I'm wondering how I came to that idea....

Will send a patch for that.

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
