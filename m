From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: of_get_named_gpio on non-dt systems
Date: Fri, 29 Jul 2016 21:05:31 +0200
Message-ID: <20160729190531.GD17874@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:34705 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751960AbcG2TFe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Jul 2016 15:05:34 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: kernel@pengutronix.de

Hello,

I have a non-dt i.MX35 system here using 4.6.4-rt and it oopses when th=
e
i2c-imx driver is loaded. That happes because i2c_imx_init_recovery_inf=
o calls:

	rinfo->sda_gpio =3D of_get_named_gpio(pdev->dev.of_node, "sda-gpios", =
0);

with pdev->dev.of_node =3D=3D NULL. In this end this stumbles over:

	pr_debug("%s: can't parse '%s' property of node '%s[%d]'\n",
		 __func__, propname, np->full_name, index);

in of_get_named_gpiod_flags() because np =3D=3D pdev->dev.of_node.

=46or now I disabled CONFIG_DEBUG_GPIO but this obviously isn't the rig=
ht
fix.

My question now is: is it allowed to call of_get_named_gpio with
np=3DNULL? Depending on the answer to this question either i2c-imx or
of_get_named_gpiod_flags should be fixed.

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
