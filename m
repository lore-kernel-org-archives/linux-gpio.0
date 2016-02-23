From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO subnodes
Date: Tue, 23 Feb 2016 08:54:48 +0100
Message-ID: <1456214089-13954-3-git-send-email-mpa@pengutronix.de>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:55445 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751926AbcBWHzQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Feb 2016 02:55:16 -0500
In-Reply-To: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>

Reuse the GPIO hogging DT bindings for more generic specifications of
the GPIO. Therefore gpio-hog is declared optional.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 28 ++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 069cdf6f9dac..820898e0649c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -155,13 +155,25 @@ gpio-controller@00000000 {
 	ngpios = <18>;
 }
 
-The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
-providing automatic GPIO request and configuration as part of the
-gpio-controller's driver probe function.
+The GPIO chip may contain subnodes describing specific GPIOs of this
+controller. These GPIO nodes can be used to define GPIO hogging or define GPIO
+names.
+GPIO hogging is a mechanism providing automatic GPIO request and configuration
+as part of the gpio-controller's driver probe function.
 
-Each GPIO hog definition is represented as a child node of the GPIO controller.
+Each GPIO node consists of the following properties:
 Required properties:
+- gpios:      Store the GPIO information (id, flags, ...). Shall contain the
+	      number of cells specified in its parent node (GPIO controller
+	      node).
+
+Optional properties:
+- line-name:  The GPIO name. If not present the node name is used.
 - gpio-hog:   A property specifying that this child node represent a GPIO hog.
+
+For GPIO hogging which is specified by the "gpio-hog" property the following
+additional properties are required.
+Required properties for GPIO hogging:
 - gpios:      Store the GPIO information (id, flags, ...). Shall contain the
 	      number of cells specified in its parent node (GPIO controller
 	      node).
@@ -175,9 +187,6 @@ configuration.
 - output-high A property specifying to set the GPIO direction as output with
 	      the value high.
 
-Optional properties:
-- line-name:  The GPIO label name. If not present the node name is used.
-
 Example of two SOC GPIO banks defined as gpio-controller nodes:
 
 	qe_pio_a: gpio-controller@1400 {
@@ -192,6 +201,11 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
 			output-low;
 			line-name = "foo-bar-gpio";
 		};
+
+		line_c {
+			gpios = <7 0>;
+			line-name = "SCHEMATIC_LINE_NAME";
+		};
 	};
 
 	qe_pio_e: gpio-controller@1460 {
-- 
2.7.0

