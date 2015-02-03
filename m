From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-imx: don't use invalid value of conf_reg
Date: Tue, 3 Feb 2015 14:01:09 +0100
Message-ID: <CACRpkdbtpGU57-tPn9Z0rNvY4zLk+QE6A9Pd87vLUHOmRiB2yg@mail.gmail.com>
References: <1422399025-25636-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:64070 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965313AbbBCNBK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 08:01:10 -0500
Received: by mail-ob0-f180.google.com with SMTP id vb8so21845703obc.11
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2015 05:01:09 -0800 (PST)
In-Reply-To: <1422399025-25636-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dong Aisheng <dong.aisheng@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 27, 2015 at 11:50 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The right check for conf_reg to be invalid it testing against -1 not =
0
> as is done in the rest of the driver.
>
> This fixes an oops that can be triggered by:
>
>         cat /sys/kernel/debug/pinctrl/43fac000.iomuxc/*
>
> Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driv=
er")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

But...

> -       if (!pin_reg || !pin_reg->conf_reg) {
> +       if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {

I can see that the other code checks for -1 in this variable.
But where is conf_reg ever set to -1?

freescale]$ git grep "\-1"
pinctrl-imx.c:          if (pin_reg->mux_reg =3D=3D -1) {
pinctrl-imx.c:  if (pin_reg->mux_reg =3D=3D -1)
pinctrl-imx.c:  if (pin_reg->mux_reg =3D=3D -1)
pinctrl-imx.c:  if (pin_reg->conf_reg =3D=3D -1) {
pinctrl-imx.c:  if (pin_reg->conf_reg =3D=3D -1) {
pinctrl-imx.c:  if (!pin_reg || pin_reg->conf_reg =3D=3D -1) {

Only checked for, never assigned.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
