From: Shailendra Verma <shailendra.v@samsung.com>
Subject: [PATCH] Pinctrl: mvebu - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 10:21:43 +0530
Message-ID: <1485751903-29284-1-git-send-email-shailendra.v@samsung.com>
References: <CGME20170130045153epcas3p37f0c1815f13d6701dd4da3c50c54b35a@epcas3p3.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48562 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751032AbdA3GFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 01:05:45 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andreas Klinger <ak@it-klinger.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Jamie Lentin <jm@lentin.co.uk>, Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.v@samsung.com>, Shailendra Verma <shailendra.capricorn@gmail.com>

of_match_device could return NULL, and so can cause a NULL
pointer dereference later.

Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>
---
 drivers/pinctrl/mvebu/pinctrl-dove.c     |    4 ++++
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c |    4 ++++
 drivers/pinctrl/mvebu/pinctrl-orion.c    |    4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index f93ae0d..f9fe6d4 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -769,6 +769,10 @@ static int dove_pinctrl_probe(struct platform_device *pdev)
 	struct resource fb_res;
 	const struct of_device_id *match =
 		of_match_device(dove_pinctrl_of_match, &pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
 	pdev->dev.platform_data = (void *)match->data;
 
 	/*
diff --git a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
index 5f89c26..75efb83 100644
--- a/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
+++ b/drivers/pinctrl/mvebu/pinctrl-kirkwood.c
@@ -472,6 +472,10 @@ static int kirkwood_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	const struct of_device_id *match =
 		of_match_device(kirkwood_pinctrl_of_match, &pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
 	pdev->dev.platform_data = (void *)match->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
diff --git a/drivers/pinctrl/mvebu/pinctrl-orion.c b/drivers/pinctrl/mvebu/pinctrl-orion.c
index 84e1441..559ac32 100644
--- a/drivers/pinctrl/mvebu/pinctrl-orion.c
+++ b/drivers/pinctrl/mvebu/pinctrl-orion.c
@@ -225,6 +225,10 @@ static int orion_pinctrl_probe(struct platform_device *pdev)
 		of_match_device(orion_pinctrl_of_match, &pdev->dev);
 	struct resource *res;
 
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
 	pdev->dev.platform_data = (void*)match->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.9.5

