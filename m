From: Shailendra Verma <shailendra.v@samsung.com>
Subject: [PATCH] Gpio - Fix possible NULL derefrence.
Date: Fri, 27 Jan 2017 16:44:02 +0530
Message-ID: <1485515642-3310-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170127111411epcas4p19f0ff2dc9c16dfa5346d1770338da8eb@epcas4p1.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47135 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934053AbdA0LOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 06:14:14 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.v@samsung.com>, Shailendra Verma <shailendra.capricorn@gmail.com>

of_match_device could return NULL, and so can cause a NULL
pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/gpio/gpio-ge.c  |    5 +++++
 drivers/gpio/gpio-mxs.c |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index 8650b29..395a85d 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -59,6 +59,11 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int ret;
 
+	if (!of_id) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	gc = devm_kzalloc(&pdev->dev, sizeof(*gc), GFP_KERNEL);
 	if (!gc)
 		return -ENOMEM;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index ee17248..e28097f 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -272,6 +272,11 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	int irq_base;
 	int err;
 
+	if (!of_id) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
-- 
1.7.9.5

