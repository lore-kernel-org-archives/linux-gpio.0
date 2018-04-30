From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/12] gpio: dwapb: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:09 +0200
Message-ID: <20180430073819.31827-2-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-dwapb.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 226977f78482..c25fa72d499f 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -684,13 +684,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 
 	gpio->flags = 0;
 	if (dev->of_node) {
-		const struct of_device_id *of_devid;
-
-		of_devid = of_match_device(dwapb_of_match, dev);
-		if (of_devid) {
-			if (of_devid->data)
-				gpio->flags = (uintptr_t)of_devid->data;
-		}
+		gpio->flags = (uintptr_t)of_device_get_match_data(dev);
 	} else if (has_acpi_companion(dev)) {
 		const struct acpi_device_id *acpi_id;
 
-- 
2.17.0
