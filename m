From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH] gpio: syscon: fix a possible NULL dereference
Date: Thu,  5 Nov 2015 17:02:35 +0100
Message-ID: <1446739355-25849-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>
List-Id: linux-gpio@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later at line 199:
priv->flags = of_id->data;

Reported-by: coverity (CID 1324140)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/gpio/gpio-syscon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 045a952..e673c58 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -192,6 +192,9 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	int ret;
 
+	if (!of_id)
+		return -ENODEV;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.4.10
