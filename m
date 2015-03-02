From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] pinctrl: remove maxpin from documentation
Date: Mon,  2 Mar 2015 16:55:02 +0200
Message-ID: <61439260263299de5969469fac565051db478bdb.1425308102.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:58232 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753984AbbCBOzq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 2 Mar 2015 09:55:46 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

struct pinctrl_desc does not contain the maxpin member since commit 0d2006bbf0
(pinctrl: remove unnecessary max pin number).

Fixes: 0d2006bbf0 ('pinctrl: remove unnecessary max pin number')
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/pinctrl.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index b8f2147b96dd..348a8af8d06c 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -72,7 +72,6 @@ static struct pinctrl_desc foo_desc = {
 	.name = "foo",
 	.pins = foo_pins,
 	.npins = ARRAY_SIZE(foo_pins),
-	.maxpin = 63,
 	.owner = THIS_MODULE,
 };
 
-- 
2.1.4

