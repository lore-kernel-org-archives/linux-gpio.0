From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: dt-binding: fix typo
Date: Mon,  9 Mar 2015 21:56:39 +0200
Message-ID: <b00c9bfaf2cf46d594881d689bd7e664260c6e5d.1425930999.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:45904 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752275AbbCIT46 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 15:56:58 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index 47d84b6ee91b..950580c92448 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -38,7 +38,7 @@ property exists to define the pin configuration. Each state may also be
 assigned a name. When names are used, another property exists to map from
 those names to the integer IDs.
 
-Each client device's own binding determines the set of states the must be
+Each client device's own binding determines the set of states that must be
 defined in its device tree node, and whether to define the set of state
 IDs that must be provided, or whether to define the set of state names that
 must be provided.
-- 
2.1.4

