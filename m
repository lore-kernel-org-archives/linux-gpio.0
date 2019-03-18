From: Aditya Pakki <pakki001@umn.edu>
Subject: [PATCH] pinctrl: berlin: Fix to avoid NULL pointer dereference
Date: Mon, 18 Mar 2019 18:31:29 -0500
Message-ID: <20190318233131.9642-1-pakki001@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pakki001@umn.edu
Cc: kjlu@umn.edu, Linus Walleij <linus.walleij@linaro.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

of_match_device can return a NULL value when the matching device is
not found. The patch avoids a potential dereference in such scenario.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/pinctrl/berlin/berlin-bg4ct.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin/berlin-bg4ct.c
index 6a7fe929a68b..2d5e82938ef9 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -456,6 +456,9 @@ static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 
+	if (!match)
+		return -ENODEV;
+
 	rmconfig = devm_kzalloc(&pdev->dev, sizeof(*rmconfig), GFP_KERNEL);
 	if (!rmconfig)
 		return -ENOMEM;
-- 
2.17.1
