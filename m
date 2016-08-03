From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 2/2] gpio: dt-bindings: add brcm,bcm6345-gpio bindings
Date: Wed,  3 Aug 2016 13:02:15 +0200
Message-ID: <1470222135-4731-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35362 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679AbcHCLCE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Aug 2016 07:02:04 -0400
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
 .../devicetree/bindings/gpio/brcm,bcm6345-gpio.txt | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
new file mode 100644
index 0000000..48e35ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
@@ -0,0 +1,46 @@
+Bindings for the Broadcom's brcm,bcm6345-gpio memory-mapped GPIO controllers.
+
+These bindings should only be used for BCM6338 and BCM6345 SoCs, since newer
+ones need a proper pinctrl driver.
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
+	- big-endian: Memory is big endian.
+
+Examples:
+	- BCM6338:
+	gpio0: gpio-controller@fffe0407 {
+		compatible = "brcm,bcm6345-gpio";
+		reg-names = "dirout", "dat";
+		reg = <0xfffe0407 1>, <0xfffe040f 1>;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	- BCM6345:
+	gpio0: gpio-controller@fffe0406 {
+		compatible = "brcm,bcm6345-gpio";
+		reg-names = "dirout", "dat";
+		reg = <0xfffe0406 2>, <0xfffe040a 2>;
+		big-endian;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
-- 
2.1.4

