From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH v2 1/2] gpio: dt-bindings: add brcm,bcm6345-gpio bindings
Date: Wed,  3 Aug 2016 14:05:56 +0200
Message-ID: <1470225957-5692-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36543 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757640AbcHCMGP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Aug 2016 08:06:15 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, chunkeey@googlemail.com, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>

This patch adds the device tree bindings for the Broadcom's BCM6345
memory-mapped GPIO controllers.

The gpios will be supported by gpio-mmio code of the
GPIO generic library.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: add improvements suggested by Jonas Gorski:
  - use native-endian instead of big-endian.
  - use gpio alias instead of gpio0.
  - be less dramatic with newer Broadcom SoCs.
  - reorder patches.

 .../devicetree/bindings/gpio/brcm,bcm6345-gpio.txt | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
new file mode 100644
index 0000000..e785314
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
@@ -0,0 +1,46 @@
+Bindings for the Broadcom's brcm,bcm6345-gpio memory-mapped GPIO controllers.
+
+These bindings can be used on any BCM63xx SoC. However, BCM6338 and BCM6345
+are the only ones which don't need a pinctrl driver.
+BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
+and/or written, and the direction changed from input to output.
+BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
+and/or written, and the direction changed from input to output.
+
+Required properties:
+	- compatible: should be "brcm,bcm6345-gpio"
+	- reg-names: must contain
+		"dat" - data register
+		"dirout" - direction (output) register
+	- reg: address + size pairs describing the GPIO register sets;
+		order must correspond with the order of entries in reg-names
+	- #gpio-cells: must be set to 2. The first cell is the pin number and
+			the second cell is used to specify the gpio polarity:
+			0 = active high
+			1 = active low
+	- gpio-controller: Marks the device node as a gpio controller.
+
+Optional properties:
+	- native-endian: use native endian memory.
+
+Examples:
+	- BCM6338:
+	gpio: gpio-controller@fffe0407 {
+		compatible = "brcm,bcm6345-gpio";
+		reg-names = "dirout", "dat";
+		reg = <0xfffe0407 1>, <0xfffe040f 1>;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	- BCM6345:
+	gpio: gpio-controller@fffe0406 {
+		compatible = "brcm,bcm6345-gpio";
+		reg-names = "dirout", "dat";
+		reg = <0xfffe0406 2>, <0xfffe040a 2>;
+		native-endian;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
-- 
2.1.4

