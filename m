From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/12] gpio: palmas: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:13 +0200
Message-ID: <20180430073819.31827-6-thierry.reding@gmail.com>
References: <20180430073819.31827-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180430073819.31827-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use of_device_get_match_data() instead of open-coding it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-palmas.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 3d818195e351..ceb2fef2c8ae 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -159,13 +159,9 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	struct palmas_platform_data *palmas_pdata;
 	struct palmas_gpio *palmas_gpio;
 	int ret;
-	const struct of_device_id *match;
 	const struct palmas_device_data *dev_data;
 
-	match = of_match_device(of_palmas_gpio_match, &pdev->dev);
-	if (!match)
-		return -ENODEV;
-	dev_data = match->data;
+	dev_data = of_device_get_match_data(&pdev->dev);
 	if (!dev_data)
 		dev_data = &palmas_dev_data;
 
-- 
2.17.0
