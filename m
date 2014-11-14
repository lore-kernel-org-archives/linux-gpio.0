From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] dt: img,tz1090-pinctrl.txt: Fix typo in binding
Date: Fri, 14 Nov 2014 15:45:53 +0000
Message-ID: <1415979953-22401-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:41959 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965555AbaKNPqE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Nov 2014 10:46:04 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-gpio@vger.kernel.org

Fix a typo, s/which which/which/ in the img,tz1090-pinctrl.txt binding.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
index 4b27c99f7f9d..0a3f50217a17 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
@@ -67,7 +67,7 @@ Valid values for pin and group names are:
     They also all support the some form of muxing. Any pins which are contained
     in one of the mux groups (see below) can be muxed only to the functions
     supported by the mux group. All other pins can be muxed to the "perip"
-    function which which enables them with their intended peripheral.
+    function which enables them with their intended peripheral.
 
     Different pins in the same mux group cannot be muxed to different functions,
     however it is possible to mux only a subset of the pins in a mux group to a
-- 
2.0.4

