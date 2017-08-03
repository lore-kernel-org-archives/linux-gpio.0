From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] gpio: msic: fix error return code in
 platform_msic_gpio_probe()
Date: Thu, 3 Aug 2017 17:00:01 -0500
Message-ID: <20170803220001.GA7282@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gateway34.websitewelcome.com ([192.185.148.194]:15759 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751736AbdHCWVx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 18:21:53 -0400
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id A6BDE56EB4C
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2017 17:00:04 -0500 (CDT)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

platform_get_irq() returns an error code, but the gpio-msic driver
ignores it and always returns -EINVAL. This is not correct, and
prevents -EPROBE_DEFER from being propagated properly.

Notice that platform_get_irq() no longer returns 0 on error:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e330b9a6bb35dc7097a4f02cb1ae7b6f96df92af

Print and propagate the return value of platform_get_irq on failure.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpio/gpio-msic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 1b7ce7f..6cb6759 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -265,8 +265,8 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
 	int i;
 
 	if (irq < 0) {
-		dev_err(dev, "no IRQ line\n");
-		return -EINVAL;
+		dev_err(dev, "no IRQ line: %d\n", irq);
+		return irq;
 	}
 
 	if (!pdata || !pdata->gpio_base) {
-- 
2.5.0

