From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] gpio: zynq: Remove .owner field for driver
Date: Wed, 13 Aug 2014 14:01:21 +0200
Message-ID: <78682b5ace6f31f2b52496823823116076eefd61.1407931277.git.michal.simek@xilinx.com>
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-21106-1407931281-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37520 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652AbaHMMBZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Aug 2014 08:01:25 -0400
Received: by mail-wi0-f182.google.com with SMTP id d1so670749wiv.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2014 05:01:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: linux-arm-kernel@lists.infradead.org, Josh Cartwright <josh.cartwright@ni.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-21106-1407931281-0001

There is no need to init .owner field.

Based on the patch from Peter Griffin <peter.griffin@linaro.org>
"mmc: remove .owner field for drivers using module_platform_driver"

This patch removes the superflous .owner field for drivers which
use the module_platform_driver API, as this is overriden in
platform_driver_register anyway."

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/gpio/gpio-zynq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index c3145f91fda3..a94db67c23b0 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -668,7 +668,6 @@ MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
 static struct platform_driver zynq_gpio_driver = {
 	.driver	= {
 		.name = DRIVER_NAME,
-		.owner = THIS_MODULE,
 		.pm = &zynq_gpio_dev_pm_ops,
 		.of_match_table = zynq_gpio_of_match,
 	},
--
1.8.2.3


--=_mimegpg-monstr-desktop-21106-1407931281-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlPrU5EACgkQykllyylKDCFquQCfTWDDcjbe9gC6kfXNhYP9mpB5
1FkAnj0ZD6QaKnV6gZ1AdhY3RZAtR+YH
=OuH5
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-21106-1407931281-0001--
