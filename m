From: David Daney <david.daney@cavium.com>
Subject: [PATCH v3 4/6] dt-bindings: gpio: Add binding documentation for gpio-thunderx
Date: Tue, 14 Feb 2017 09:49:34 -0800
Message-ID: <1487094576-229208-5-git-send-email-david.daney@cavium.com>
References: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0075.outbound.protection.outlook.com ([104.47.37.75]:26048
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752250AbdBNRuB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Feb 2017 12:50:01 -0500
In-Reply-To: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-thunderx.txt     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
new file mode 100644
index 0000000..3f883ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
@@ -0,0 +1,27 @@
+Cavium ThunderX/OCTEON-TX GPIO controller bindings
+
+Required Properties:
+- reg: The controller bus address.
+- gpio-controller: Marks the device node as a GPIO controller.
+- #gpio-cells: Must be 2.
+  - First cell is the GPIO pin number relative to the controller.
+  - Second cell is a standard generic flag bitfield as described in gpio.txt.
+
+Optional Properties:
+- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells: Must be present and have value of 2 if
+                    "interrupt-controller" is present.
+  - First cell is the GPIO pin number relative to the controller.
+  - Second cell is triggering flags as defined in interrupts.txt.
+
+Example:
+
+gpio_6_0: gpio@6,0 {
+	compatible = "cavium,thunder-8890-gpio";
+	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
-- 
1.8.3.1

