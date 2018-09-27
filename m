From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH] pinctrl: sprd: Move DT parsing before registering pinctrl device
Date: Thu, 27 Sep 2018 17:15:08 +0800
Message-ID: <07c454a686966823161ebfe1ed7c08f29032fb2c.1538039535.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com
Cc: baolin.wang@linaro.org, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

It will be failed to select default or sleep state for pins hogged
by the pin controller device, since we hadn't parsed pins configuration
in device tree before registering the pin controller device. Thus
we should move the device tree parsing function before registering
the pin controller device.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 78c2f54..4537b54 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -1059,6 +1059,12 @@ int sprd_pinctrl_core_probe(struct platform_device *pdev,
 		return ret;
 	}
 
+	ret = sprd_pinctrl_parse_dt(sprd_pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to parse dt properties\n");
+		return ret;
+	}
+
 	pin_desc = devm_kcalloc(&pdev->dev,
 				pinctrl_info->npins,
 				sizeof(struct pinctrl_pin_desc),
@@ -1083,13 +1089,6 @@ int sprd_pinctrl_core_probe(struct platform_device *pdev,
 		return PTR_ERR(sprd_pctl->pctl);
 	}
 
-	ret = sprd_pinctrl_parse_dt(sprd_pctl);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to parse dt properties\n");
-		pinctrl_unregister(sprd_pctl->pctl);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
1.7.9.5
