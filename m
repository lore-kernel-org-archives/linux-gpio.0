From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: gpio: pca953x: document the nxp,pca6416
Date: Tue,  9 Apr 2019 14:35:45 +0200
Message-ID: <20190409123546.13960-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

The NXP PCA6416 is a variant of the PCA GPIO expander, with 16 GPIOs.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index fb144e2b6522..22fb905a1b2d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -2,6 +2,7 @@
 
 Required properties:
  - compatible: Has to contain one of the following:
+	nxp,pca6416
 	nxp,pca9505
 	nxp,pca9534
 	nxp,pca9535
-- 
2.20.1
