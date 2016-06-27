From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] pinctrl: stm32: Modify error handling for pinctrl_register
Date: Mon, 27 Jun 2016 19:53:10 +0530
Message-ID: <20160627142310.GA26798@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36008 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806AbcF0OXP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2016 10:23:15 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

pinctrl_register returns an ERR_PTR on error.

The Coccinelle semantic patch used to make this change is as follows:

@@
expression e,e1,e2;
@@

e = pinctrl_register(...)
... when != e = e1
if (
-   e == NULL
+   IS_ERR(e)
   ) {
     ...
     return
-      e2
+      PTR_ERR(e)
     ;
     }

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 8deb566..857bb3d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -814,9 +814,9 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->dev = &pdev->dev;
 
 	pctl->pctl_dev = pinctrl_register(&pctl->pctl_desc, &pdev->dev, pctl);
-	if (!pctl->pctl_dev) {
+	if (IS_ERR(pctl->pctl_dev)) {
 		dev_err(&pdev->dev, "Failed pinctrl registration\n");
-		return -EINVAL;
+		return PTR_ERR(pctl->pctl_dev);
 	}
 
 	for (i = 0; i < pctl->nbanks; i++)
-- 
1.9.1

