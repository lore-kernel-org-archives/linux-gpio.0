From: Feng Kan <fkan@apm.com>
Subject: [PATCH V6 2/3] Documentation: gpio: Add APM X-Gene SoC GPIO controller DTS binding
Date: Thu, 31 Jul 2014 12:03:26 -0700
Message-ID: <1406833407-28316-3-git-send-email-fkan@apm.com>
References: <1406833407-28316-1-git-send-email-fkan@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og111.obsmtp.com ([64.18.0.22]:50410 "HELO
	exprod5og111.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750859AbaGaTCj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Jul 2014 15:02:39 -0400
Received: by mail-pd0-f171.google.com with SMTP id z10so4016384pdj.30
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2014 12:02:36 -0700 (PDT)
In-Reply-To: <1406833407-28316-1-git-send-email-fkan@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patches@apm.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Feng Kan <fkan@apm.com>

Documentation for APM X-Gene SoC GPIO controller DTS binding.

Signed-off-by: Feng Kan <fkan@apm.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 .../devicetree/bindings/gpio/gpio-xgene.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
new file mode 100644
index 0000000..86dbb05
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
@@ -0,0 +1,22 @@
+APM X-Gene SoC GPIO controller bindings
+
+This is a gpio controller that is part of the flash controller.
+This gpio controller controls a total of 48 gpios.
+
+Required properties:
+- compatible: "apm,xgene-gpio" for X-Gene GPIO controller
+- reg: Physical base address and size of the controller's registers
+- #gpio-cells: Should be two.
+	- first cell is the pin number
+	- second cell is used to specify the gpio polarity:
+		0 = active high
+		1 = active low
+- gpio-controller: Marks the device node as a GPIO controller.
+
+Example:
+	gpio0: gpio0@1701c000 {
+		compatible = "apm,xgene-gpio";
+		reg = <0x0 0x1701c000 0x0 0x40>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
1.9.1

