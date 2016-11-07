From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 03/15] bindings: pinctrl-sx150x: Document SX1503 compatibility string
Date: Mon,  7 Nov 2016 08:53:11 -0800
Message-ID: <1478537603-23653-4-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
index c293c8a..25b4ec8 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
@@ -9,7 +9,8 @@ Required properties:
 			"semtech,sx1506q",
 			"semtech,sx1508q",
 			"semtech,sx1509q",
-			"semtech,sx1502q".
+			"semtech,sx1502q",
+			"semtech,sx1503q".
 
 - reg: The I2C slave address for this device.
 
-- 
2.5.5
