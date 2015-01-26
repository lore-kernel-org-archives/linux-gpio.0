From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] pinctrl: zynq: Fix usb0 pins
Date: Mon, 26 Jan 2015 17:48:14 +0100
Message-ID: <1422290895-4046-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58511 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753526AbbAZQsY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 26 Jan 2015 11:48:24 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Ola Jeppson <ola@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, open list <linux-kernel@vger.kernel.org>

=46ix usb0 pin 19 -> 29 (matching ethernet1 pins and manual).
Pin 19 is used for ethernet0 on the Parallella board.

=46ixes: add958cee967 ("pinctrl: Add driver for Zynq")
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 drivers/pinctrl/pinctrl-zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-z=
ynq.c
index 8aa05e2eb705..6480ed533a87 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -357,7 +357,7 @@ static const unsigned int gpio0_50_pins[] =3D {50};
 static const unsigned int gpio0_51_pins[] =3D {51};
 static const unsigned int gpio0_52_pins[] =3D {52};
 static const unsigned int gpio0_53_pins[] =3D {53};
-static const unsigned int usb0_0_pins[] =3D {28, 19, 30, 31, 32, 33, 3=
4, 35, 36,
+static const unsigned int usb0_0_pins[] =3D {28, 29, 30, 31, 32, 33, 3=
4, 35, 36,
 					   37, 38, 39};
 static const unsigned int usb1_0_pins[] =3D {40, 41, 42, 43, 44, 45, 4=
6, 47, 48,
 					   49, 50, 51};
--=20
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
