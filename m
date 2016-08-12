From: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Subject: [PATCH v4 1/2] gpio: add bindings for Technologic I2C-FPGA gpio controller
Date: Fri, 12 Aug 2016 11:16:48 -0400
Message-ID: <1471015009-5925-2-git-send-email-lucile.quirion@savoirfairelinux.com>
References: <1471015009-5925-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471015009-5925-1-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, kernel@savoirfairelinux.com, Lucile Quirion <lucile.quirion@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

Device tree binding documentation for Technologic's I2C-FPGA GPIO
controller.

Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
---
 .../devicetree/bindings/gpio/gpio-ts4900.txt       | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4900.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-ts4900.txt b/Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
new file mode 100644
index 0000000..206fc21
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
@@ -0,0 +1,29 @@
+* Technologic Systems I2C-FPGA's GPIO controller bindings
+
+This bindings describes the GPIO controller for Technologic's FPGA core.
+TS-4900's FPGA encodes the GPIO state on 3 bits, whereas the TS-7970's FPGA
+uses 2 bits: it doesn't use a dedicated input bit.
+
+Required properties:
+- compatible: Should be one of the following
+		"technologic,ts4900-gpio"
+		"technologic,ts7970-gpio"
+- reg: Physical base address of the controller and length
+       of memory mapped region.
+- #gpio-cells: Should be two. The first cell is the pin number.
+- gpio-controller: Marks the device node as a gpio controller.
+
+Optional property:
+- ngpios: Number of GPIOs this controller has, default is 32.
+
+Example:
+
+&i2c2 {
+	gpio8: gpio@28 {
+		compatible = "technologic,ts4900-gpio";
+		reg = <0x28>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		ngpios = <32>;
+	};
+};
-- 
2.5.5
