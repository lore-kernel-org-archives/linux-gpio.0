From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/12] gpio: xlp: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:19 +0200
Message-ID: <20180430073819.31827-12-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-xlp.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index e74bd43a6974..8e4275eaa7d7 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -322,14 +322,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 		return irq;
 
 	if (pdev->dev.of_node) {
-		const struct of_device_id *of_id;
-
-		of_id = of_match_device(xlp_gpio_of_ids, &pdev->dev);
-		if (!of_id) {
-			dev_err(&pdev->dev, "Unable to match OF ID\n");
-			return -ENODEV;
-		}
-		soc_type = (uintptr_t) of_id->data;
+		soc_type = (uintptr_t)of_device_get_match_data(&pdev->dev);
 	} else {
 		const struct acpi_device_id *acpi_id;
 
-- 
2.17.0
