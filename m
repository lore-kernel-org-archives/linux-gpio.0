From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: mvebu: Delete an error message for a failed memory
 allocation in mvebu_pinctrl_probe()
Date: Tue, 19 Dec 2017 22:37:51 +0100
Message-ID: <ba1158ce-87be-6033-72b6-b08d7babc443@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:62648 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752716AbdLSViE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Dec 2017 16:38:04 -0500
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Dec 2017 22:30:36 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 163d4614b0f8..9e05cfaf75f0 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -636,10 +636,9 @@ int mvebu_pinctrl_probe(struct platform_device *pdev)
 	 */
 	size = pctl->num_groups * sizeof(*pctl->groups) + noname * 8;
 	p = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
-	if (!p) {
-		dev_err(&pdev->dev, "failed to alloc group data\n");
+	if (!p)
 		return -ENOMEM;
-	}
+
 	pctl->groups = p;
 	noname_buf = p + pctl->num_groups * sizeof(*pctl->groups);
 
-- 
2.15.1

