From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] gpio/gpio-mxs : Unmap region obtained by of_iomap
Date: Wed,  5 Oct 2016 15:08:36 +0530
Message-ID: <1475660316-11949-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:34010 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751913AbcJEJj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 05:39:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Free memory mapping, if mxs_gpio_probe is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpio/gpio-mxs.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index b9daa0b..ee17248 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -308,8 +308,10 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	writel(~0U, port->base + PINCTRL_IRQSTAT(port) + MXS_CLR);
 
 	irq_base = irq_alloc_descs(-1, 0, 32, numa_node_id());
-	if (irq_base < 0)
-		return irq_base;
+	if (irq_base < 0) {
+		err = irq_base;
+		goto out_iounmap;
+	}
 
 	port->domain = irq_domain_add_legacy(np, 32, irq_base, 0,
 					     &irq_domain_simple_ops, NULL);
@@ -349,6 +351,8 @@ out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_irqdesc_free:
 	irq_free_descs(irq_base, 32);
+out_iounmap:
+	iounmap(port->base);
 	return err;
 }
 
-- 
1.7.9.5

