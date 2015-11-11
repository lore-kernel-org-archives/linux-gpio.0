From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH 2/3] gpio: syscon: fix a possible NULL dereference
Date: Wed, 11 Nov 2015 21:27:35 +0100
Message-ID: <1447273657-1668-2-git-send-email-clabbe.montjoie@gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later at line 199:
priv->flags = of_id->data;

Reported-by: coverity (CID 1324140)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/gpio/gpio-syscon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 045a952..7b25fdf 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -187,11 +187,15 @@ MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
 static int syscon_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id = of_match_device(syscon_gpio_ids, dev);
+	const struct of_device_id *of_id;
 	struct syscon_gpio_priv *priv;
 	struct device_node *np = dev->of_node;
 	int ret;
 
+	of_id = of_match_device(syscon_gpio_ids, dev);
+	if (!of_id)
+		return -ENODEV;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.4.10
