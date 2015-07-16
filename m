From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 4/4] dt-bindings: gpio: document bindings supported by gpio-mpc8xxx.c
Date: Thu, 16 Jul 2015 21:08:24 +0200
Message-ID: <1437073704-13881-4-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37434 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262AbbGPTKJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 15:10:09 -0400
In-Reply-To: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      | 24 ++++++++++++++=
++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx=
=2Etxt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/=
Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
new file mode 100644
index 000000000000..0449fc4013f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -0,0 +1,24 @@
+* Freescale MPC512x/MPC8xxx GPIO controller
+
+Required properties:
+- compatible : Should be "fsl,<soc>-gpio"
+  The following <soc>s are known to be supported:
+    mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq
+- reg : Address and length of the register set for the device
+- interrupts : Should be the port interrupt shared by all 32 pins.
+- #gpio-cells : Should be two.  The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+      0 =3D active high
+      1 =3D active low
+
+Example:
+
+gpio0: gpio@1100 {
+	compatible =3D "fsl,mpc5125-gpio";
+	#gpio-cells =3D <2>;
+	reg =3D <0x1100 0x080>;
+	interrupts =3D <78 0x8>;
+	status =3D "okay";
+};
+
+
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
