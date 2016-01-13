From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: [PATCH 1/2] gpio: add bindings for TS-4800 gpio controller
Date: Wed, 13 Jan 2016 11:57:42 -0500
Message-ID: <1452704263-16763-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:56130 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753050AbcAMQ6s (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 11:58:48 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@savoirfairelinux.com, Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

Device tree binding documentation for the TS-4800
GPIO controller.

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
 .../devicetree/bindings/gpio/gpio-ts4800.txt        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4800.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-ts4800.txt b/Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
new file mode 100644
index 0000000..57749f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
@@ -0,0 +1,21 @@
+* TS-4800 FPGA's GPIO controller bindings
+
+Required properties:
+- compatible: Must be "technologic,ts4800-gpio".
+- #gpio-cells: Should be two. The first cell is the pin number.
+- reg: Physical base address of the controller and length
+       of memory mapped region.
+
+Optional property:
+- ngpios: Number of gpios this controller has. If not set,
+	  the default value (16) is used.
+
+Example:
+
+gpio1: gpio {
+	compatible = "technologic,ts4800-gpio";
+	reg = <0x10020 0x6>;
+	ngpios = <8>;
+	gpio-controller;
+	#gpio-cells = <2>;
+};
-- 
2.5.0

