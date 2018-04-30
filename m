From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/12] gpio: pxa: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:15 +0200
Message-ID: <20180430073819.31827-8-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-pxa.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index f480fb896963..3c1f65bc0fa8 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -579,15 +579,9 @@ static int pxa_gpio_probe_dt(struct platform_device *pdev,
 			     struct pxa_gpio_chip *pchip)
 {
 	int nr_gpios;
-	const struct of_device_id *of_id =
-				of_match_device(pxa_gpio_dt_ids, &pdev->dev);
 	const struct pxa_gpio_id *gpio_id;
 
-	if (!of_id || !of_id->data) {
-		dev_err(&pdev->dev, "Failed to find gpio controller\n");
-		return -EFAULT;
-	}
-	gpio_id = of_id->data;
+	gpio_id = of_device_get_match_data(&pdev->dev);
 	gpio_type = gpio_id->type;
 
 	nr_gpios = gpio_id->gpio_nums;
-- 
2.17.0
