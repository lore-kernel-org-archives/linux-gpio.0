From: Shailendra Verma <shailendra.v@samsung.com>
Subject: [PATCH] Pinctrl : berlin - Fix possible NULL derefrence.
Date: Fri, 27 Jan 2017 16:40:18 +0530
Message-ID: <1485515418-3006-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170127111027epcas4p2218cc1e0f62b5312eda5e1ccf667cc31@epcas4p2.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49715 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933965AbdA0LWK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 06:22:10 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, vidushi.koul@samsung.com, Shailendra Verma <shailendra.v@samsung.com>, Shailendra Verma <shailendra.capricorn@gmail.com>

of_match_device could return NULL, and so can cause a NULL
pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/pinctrl/berlin/berlin-bg2.c   |    5 +++++
 drivers/pinctrl/berlin/berlin-bg2cd.c |    5 +++++
 drivers/pinctrl/berlin/berlin-bg2q.c  |    5 +++++
 drivers/pinctrl/berlin/berlin-bg4ct.c |    5 +++++
 4 files changed, 20 insertions(+)

diff --git a/drivers/pinctrl/berlin/berlin-bg2.c b/drivers/pinctrl/berlin/berlin-bg2.c
index fabe728..3bdd078 100644
--- a/drivers/pinctrl/berlin/berlin-bg2.c
+++ b/drivers/pinctrl/berlin/berlin-bg2.c
@@ -234,6 +234,11 @@ static int berlin2_pinctrl_probe(struct platform_device *pdev)
 	const struct of_device_id *match =
 		of_match_device(berlin2_pinctrl_match, &pdev->dev);
 
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	return berlin_pinctrl_probe(pdev, match->data);
 }
 
diff --git a/drivers/pinctrl/berlin/berlin-bg2cd.c b/drivers/pinctrl/berlin/berlin-bg2cd.c
index ad8c758..e04133d 100644
--- a/drivers/pinctrl/berlin/berlin-bg2cd.c
+++ b/drivers/pinctrl/berlin/berlin-bg2cd.c
@@ -179,6 +179,11 @@ static int berlin2cd_pinctrl_probe(struct platform_device *pdev)
 	const struct of_device_id *match =
 		of_match_device(berlin2cd_pinctrl_match, &pdev->dev);
 
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	return berlin_pinctrl_probe(pdev, match->data);
 }
 
diff --git a/drivers/pinctrl/berlin/berlin-bg2q.c b/drivers/pinctrl/berlin/berlin-bg2q.c
index cd171ae..3257b22 100644
--- a/drivers/pinctrl/berlin/berlin-bg2q.c
+++ b/drivers/pinctrl/berlin/berlin-bg2q.c
@@ -396,6 +396,11 @@ static int berlin2q_pinctrl_probe(struct platform_device *pdev)
 	const struct of_device_id *match =
 		of_match_device(berlin2q_pinctrl_match, &pdev->dev);
 
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	return berlin_pinctrl_probe(pdev, match->data);
 }
 
diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin/berlin-bg4ct.c
index 0917204..867f3c3 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -468,6 +468,11 @@ static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
 	rmconfig = devm_kzalloc(&pdev->dev, sizeof(*rmconfig), GFP_KERNEL);
 	if (!rmconfig)
 		return -ENOMEM;
-- 
1.7.9.5

