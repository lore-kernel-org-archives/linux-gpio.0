From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH v2] drivers: gpio: sprd: use devm_platform_ioremap_resource()
Date: Tue, 12 Mar 2019 09:08:54 +0100
Message-ID: <1552378134-3678-1-git-send-email-info@metux.net>
References: <AMz4kuKC5haGbhyVJ4gQ6nMRzdaxJnd3SmeCSM-096p7TAp8cA@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AMz4kuKC5haGbhyVJ4gQ6nMRzdaxJnd3SmeCSM-096p7TAp8cA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-eic-sprd.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index f0223ce..462cdf4 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -567,7 +567,6 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	const struct sprd_eic_variant_data *pdata;
 	struct gpio_irq_chip *irq;
 	struct sprd_eic *sprd_eic;
-	struct resource *res;
 	int ret, i;
 
 	pdata = of_device_get_match_data(&pdev->dev);
@@ -596,13 +595,9 @@ static int sprd_eic_probe(struct platform_device *pdev)
 		 * have one bank EIC, thus base[1] and base[2] can be
 		 * optional.
 		 */
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-		if (!res)
-			continue;
-
-		sprd_eic->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		sprd_eic->base[i] = devm_platform_ioremap_resource(pdev, i);
 		if (IS_ERR(sprd_eic->base[i]))
-			return PTR_ERR(sprd_eic->base[i]);
+			continue;
 	}
 
 	sprd_eic->chip.label = sprd_eic_label_name[sprd_eic->type];
-- 
1.9.1
