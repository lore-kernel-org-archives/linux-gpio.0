From: wr.phallsma@gmail.com
Subject: [PATCH] Documentation: minor correction of gpio dts example
Date: Wed, 27 Jan 2016 16:38:11 +0100
Message-ID: <1453909091-16955-1-git-send-email-wr.phallsma@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36364 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932922AbcA0Pi6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 10:38:58 -0500
Received: by mail-lf0-f54.google.com with SMTP id h129so8647498lfh.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 07:38:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Per Hallsmark <per.hallsmark@windriver.com>

From: Per Hallsmark <per.hallsmark@windriver.com>

As the example brings up two ranges of 10 pins each, the count
should be 10 in both range definitions.

Signed-off-by: Per Hallsmark <per.hallsmark@windriver.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 069cdf6..ad3d64b 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -252,7 +252,7 @@ Example 1:
 		compatible = "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
 		reg = <0x1460 0x18>;
 		gpio-controller;
-		gpio-ranges = <&pinctrl1 0 20 10>, <&pinctrl2 10 50 20>;
+		gpio-ranges = <&pinctrl1 0 20 10>, <&pinctrl2 10 50 10>;
 	};
 
 Here, a single GPIO controller has GPIOs 0..9 routed to pin controller
-- 
2.5.0

