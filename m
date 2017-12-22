From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] gpio: of: make example syntactically correct
Date: Fri, 22 Dec 2017 21:08:40 +0100
Message-ID: <20171222200840.8317-1-wsa+renesas@sang-engineering.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: linux-gpio@vger.kernel.org

The ';' was missing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 802402f6cc5d89..53e0a0e01a4ee0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -33,11 +33,11 @@ The following example could be used to describe GPIO pins used as device enable
 and bit-banged data signals:
 
 	gpio1: gpio1 {
-		gpio-controller
+		gpio-controller;
 		 #gpio-cells = <2>;
 	};
 	gpio2: gpio2 {
-		gpio-controller
+		gpio-controller;
 		 #gpio-cells = <1>;
 	};
 	[...]
-- 
2.11.0
