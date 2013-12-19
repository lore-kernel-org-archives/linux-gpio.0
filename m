From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH] gpio: add missing word in gpio dt binding doc
Date: Thu, 19 Dec 2013 15:21:30 +0100
Message-ID: <1387462890-675-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index e2295e3..4019ce1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -56,7 +56,7 @@ and empty GPIO flags as accepted by the "qe_pio_e" gpio-controller.
 2) gpio-controller nodes
 ------------------------
 
-Every GPIO controller node must both an empty "gpio-controller"
+Every GPIO controller node must contain both an empty "gpio-controller"
 property, and have #gpio-cells contain the size of the gpio-specifier.
 
 It might contain GPIO hog definitions. GPIO hogging is a mechanism providing
-- 
1.7.9.5

