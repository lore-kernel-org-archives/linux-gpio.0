From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: fix example .get_group_pins implementation signature
Date: Mon,  9 Mar 2015 19:20:30 +0200
Message-ID: <209335cc0e7fecceb3ff8ffbae65550cd0776812.1425921630.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:45900 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000AbbCIRUy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 13:20:54 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Stephen Warren <swarren@nvidia.com>

The callback function signature has changed in commit a5818a8bd0 (pinctrl:
get_group_pins() const fixes)

Fixes: a5818a8bd0 ('pinctrl: get_group_pins() const fixes')
Cc: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/pinctrl.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index b8f2147b96dd..d5ba20c8f8c7 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -164,8 +164,8 @@ static const char *foo_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int foo_get_group_pins(struct pinctrl_dev *pctldev, unsigned selector,
-			       unsigned ** const pins,
-			       unsigned * const num_pins)
+			       const unsigned **pins,
+			       unsigned *num_pins)
 {
 	*pins = (unsigned *) foo_groups[selector].pins;
 	*num_pins = foo_groups[selector].num_pins;
-- 
2.1.4

