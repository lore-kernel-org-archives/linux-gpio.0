From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] pinctrl: sh-pfc: fix property name in bindings doc
Date: Fri, 10 Jun 2016 17:11:25 +0200
Message-ID: <1465571485-8493-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:39085 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932114AbcFJPLe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jun 2016 11:11:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

It must be "drive-strength", with a hyphen.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index 74e6ec0339d6fb..e4cf022c992ed1 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -72,7 +72,7 @@ Pin Configuration Node Properties:
 
 The pin configuration parameters use the generic pinconf bindings defined in
 pinctrl-bindings.txt in this directory. The supported parameters are
-bias-disable, bias-pull-up, bias-pull-down, drive strength and power-source. For
+bias-disable, bias-pull-up, bias-pull-down, drive-strength and power-source. For
 pins that have a configurable I/O voltage, the power-source value should be the
 nominal I/O voltage in millivolts.
 
-- 
2.8.1

