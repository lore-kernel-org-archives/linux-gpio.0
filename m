From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] dt-bindings: oxnas: Update Pinctrl and GPIO for OX820 Support
Date: Tue,  4 Oct 2016 15:41:48 +0200
Message-ID: <20161004134148.23028-4-narmstrong@baylibre.com>
References: <20161004134148.23028-1-narmstrong@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35684 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753522AbcJDNmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 09:42:13 -0400
Received: by mail-wm0-f50.google.com with SMTP id f193so168768631wmg.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2016 06:42:12 -0700 (PDT)
In-Reply-To: <20161004134148.23028-1-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/gpio/gpio_oxnas.txt       | 2 +-
 Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
index 928ed4f..9665147 100644
--- a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
@@ -3,7 +3,7 @@
 Please refer to gpio.txt for generic information regarding GPIO bindings.
 
 Required properties:
- - compatible: "oxsemi,ox810se-gpio"
+ - compatible: "oxsemi,ox810se-gpio" or "oxsemi,ox820-gpio"
  - reg: Base address and length for the device.
  - interrupts: The port interrupt shared by all pins.
  - gpio-controller: Marks the port as GPIO controller.
diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
index d607432..09e81a9 100644
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
@@ -9,7 +9,7 @@ used for a specific device or function. This node represents configurations of
 pins, optional function, and optional mux related configuration.
 
 Required properties for pin controller node:
- - compatible: "oxsemi,ox810se-pinctrl"
+ - compatible: "oxsemi,ox810se-pinctrl" or "oxsemi,ox820-pinctrl"
  - oxsemi,sys-ctrl: a phandle to the system controller syscon node
 
 Required properties for pin configuration sub-nodes:
-- 
2.7.0

