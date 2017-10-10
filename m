From: Alan Tull <atull@kernel.org>
Subject: [PATCH] gpio: gpio-dwapb: add optional reset
Date: Tue, 10 Oct 2017 16:26:17 -0500
Message-ID: <20171010212617.3397-1-atull@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756494AbdJJV00 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Oct 2017 17:26:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alan Tull <atull@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Some platforms require reset to be released to allow register
access.

Signed-off-by: Alan Tull <atull@kernel.org>
---
 drivers/gpio/gpio-dwapb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 5cdb7bc..f7ac625 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -25,6 +25,7 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/platform_data/gpio-dwapb.h>
 #include <linux/slab.h>
@@ -98,6 +99,7 @@ struct dwapb_gpio {
 	unsigned int		nr_ports;
 	struct irq_domain	*domain;
 	unsigned int		flags;
+	struct reset_control	*rst;
 };
 
 static inline u32 gpio_reg_v2_convert(unsigned int offset)
@@ -612,6 +614,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	int err;
 	struct device *dev = &pdev->dev;
 	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
+	struct reset_control *rst;
 
 	if (!pdata) {
 		pdata = dwapb_gpio_get_pdata(dev);
@@ -629,6 +632,15 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	gpio->dev = &pdev->dev;
 	gpio->nr_ports = pdata->nports;
 
+	rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(rst)) {
+		if (PTR_ERR(rst) == -EPROBE_DEFER)
+			return PTR_ERR(rst);
+	} else {
+		reset_control_deassert(rst);
+		gpio->rst = rst;
+	}
+
 	gpio->ports = devm_kcalloc(&pdev->dev, gpio->nr_ports,
 				   sizeof(*gpio->ports), GFP_KERNEL);
 	if (!gpio->ports)
@@ -680,6 +692,8 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 
 	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
+	if (gpio->rst)
+		reset_control_assert(gpio->rst);
 
 	return 0;
 }
-- 
2.7.4

