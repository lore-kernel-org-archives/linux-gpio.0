From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: pinctrl-imx: calculation of pinid bogus for i.MX25
Date: Wed, 28 Jan 2015 00:24:40 +0100
Message-ID: <20150127232440.GK29856@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:44326 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753002AbbA0XYs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jan 2015 18:24:48 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hello,

for an i.MX25 based machine I used the same pin for two different
devices (which obviously is an error). The pinctrl driver detected this
just fine, but the error message it issued is bogus. It said:

	imx25-pinctrl 43fac000.iomuxc: pin MX25_PAD_CSI_D9 already requested b=
y 43fac000.iomuxc; cannot claim for gpio-leds
	imx25-pinctrl 43fac000.iomuxc: could not request pin 80 (MX25_PAD_CSI_=
D9) from group gpioleds  on device 43fac000.iomuxc

but actually it was pin MX25_PAD_CSI_MCLK that I used twice.

The problem is=20

 - drivers/pinctrl/freescale/pinctrl-imx25.c has:

	enum ... {
		...
		MX25_PAD_CSI_D9 =3D 80,
		MX25_PAD_CSI_MCLK =3D 81,
		...
	};

 - arch/arm/boot/dts/imx25-pinfunc.h has:

 	#define MX25_PAD_CSI_MCLK__GPIO_1_8             0x140 0x338 0x000 0x1=
5 0x000

 - and to determine the pin of a given pinconfig tuple the first value
   is divided by 4. 0x140 / 4 =3D=3D 80.

All entries in the enum above are affected. Is the right fix to
decrement all the values by one (and drop MX25_PAD_RESERVE1)?

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
