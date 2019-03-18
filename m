From: Aditya Pakki <pakki001@umn.edu>
Subject: [PATCH] pinctrl: berlin: as370: Fix to avoid NULL pointer dereference
Date: Mon, 18 Mar 2019 18:37:27 -0500
Message-ID: <20190318233734.9991-1-pakki001@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pakki001@umn.edu
Cc: kjlu@umn.edu, Linus Walleij <linus.walleij@linaro.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

of_match_device in as370_pinctrl_probe can return a NULL value
when the matching device is not found. The patch avoids a potential
dereference in such scenario.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/pinctrl/berlin/pinctrl-as370.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/berlin/pinctrl-as370.c b/drivers/pinctrl/berlin/pinctrl-as370.c
index 44f8ccdbeeff..78bb5b866c99 100644
--- a/drivers/pinctrl/berlin/pinctrl-as370.c
+++ b/drivers/pinctrl/berlin/pinctrl-as370.c
@@ -337,6 +337,8 @@ static int as370_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 
+	if (!match)
+		return -ENODEV;
 	rmconfig = devm_kzalloc(&pdev->dev, sizeof(*rmconfig), GFP_KERNEL);
 	if (!rmconfig)
 		return -ENOMEM;
-- 
2.17.1
