From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] fixup! pinctrl: pxa: pxa2xx: add pin control skeleton
Date: Sat, 12 Dec 2015 22:43:05 +0100
Message-ID: <1449956585-17118-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:20556 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219AbbLLVn7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Dec 2015 16:43:59 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The wrong free functions were used to release temporary buffers.

This didn't show up in the normal driver's life. Yet in suspend to RAM,
the managed resource list is walked, and as memory was released, the
list is corrupted and make the kernel Oops.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Linus, if it's time, then this can fixup the commit. If not, I'll
provide a better commit message.
---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index e01914460219..d90e205cf809 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -292,7 +292,7 @@ static int pxa2xx_build_functions(struct pxa_pinctrl *pctl)
 	if (!pctl->functions)
 		return -ENOMEM;
 
-	kfree(functions);
+	devm_kfree(pctl->dev, functions);
 	return 0;
 }
 
@@ -328,7 +328,7 @@ static int pxa2xx_build_groups(struct pxa_pinctrl *pctl)
 		memcpy(func->groups, gtmp, ngroups * sizeof(*gtmp));
 	}
 
-	kfree(gtmp);
+	devm_kfree(pctl->dev, gtmp);
 	return 0;
 }
 
-- 
2.1.4

