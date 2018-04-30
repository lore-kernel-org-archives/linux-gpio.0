From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/12] gpio: pca953x: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:14 +0200
Message-ID: <20180430073819.31827-7-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-pca953x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d2ead4b1cf61..9a06b8a4f5be 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -810,13 +810,11 @@ static int pca953x_probe(struct i2c_client *client,
 		chip->driver_data = i2c_id->driver_data;
 	} else {
 		const struct acpi_device_id *acpi_id;
-		const struct of_device_id *match;
+		struct device *dev = &client->dev;
 
-		match = of_match_device(pca953x_dt_ids, &client->dev);
-		if (match) {
-			chip->driver_data = (int)(uintptr_t)match->data;
-		} else {
-			acpi_id = acpi_match_device(pca953x_acpi_ids, &client->dev);
+		chip->driver_data = (uintptr_t)of_device_get_match_data(dev);
+		if (!chip->driver_data) {
+			acpi_id = acpi_match_device(pca953x_acpi_ids, dev);
 			if (!acpi_id) {
 				ret = -ENODEV;
 				goto err_exit;
-- 
2.17.0
