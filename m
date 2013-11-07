From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: msm: make msm_gpio.summary_irq signed for error
 handling
Date: Thu, 7 Nov 2013 10:51:34 +0300
Message-ID: <20131107075134.GI21844@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:38871 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291Ab3KGHvs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2013 02:51:48 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a bug in msm_gpio_probe() where we do:

	msm_gpio.summary_irq = platform_get_irq(pdev, 0);
	if (msm_gpio.summary_irq < 0) {

The problem is that "msm_gpio.summary_irq" is unsigned so the error
handling doesn't work.  I've fixed it by making it signed.

Fixes: 43f68444bce7 ('gpio: msm: Add device tree and irqdomain support for gpio-msm-v2')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-msm-v2.c b/drivers/gpio/gpio-msm-v2.c
index f7a0cc4..7b37300 100644
--- a/drivers/gpio/gpio-msm-v2.c
+++ b/drivers/gpio/gpio-msm-v2.c
@@ -102,7 +102,7 @@ struct msm_gpio_dev {
 	DECLARE_BITMAP(wake_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
 	struct irq_domain *domain;
-	unsigned int summary_irq;
+	int summary_irq;
 	void __iomem *msm_tlmm_base;
 };
 
