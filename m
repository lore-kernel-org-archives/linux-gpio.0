From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/7] gpio: rcar: Add optional functional clock to bindings
Date: Thu, 27 Mar 2014 21:47:37 +0100
Message-ID: <1395953262-4290-3-git-send-email-geert@linux-m68k.org>
References: <1395953262-4290-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38447 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757334AbaC0Urz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 16:47:55 -0400
In-Reply-To: <1395953262-4290-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index f61cef74a212..9ccbe50dcec2 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -21,6 +21,10 @@ Required Properties:
     GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
   - gpio-ranges: Range of pins managed by the GPIO controller.
 
+Optional properties:
+
+  - clocks: Must contain a reference to the functional clock.
+
 Please refer to gpio.txt in this directory for details of gpio-ranges property
 and the common GPIO bindings used by client devices.
 
-- 
1.7.9.5

