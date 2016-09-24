From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] gpio: pca953x: variable 'id' was used twice
Date: Sat, 24 Sep 2016 11:11:00 +0200
Message-ID: <20160924091100.15686-1-wsa@the-dreams.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:58889 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758767AbcIXJLQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 24 Sep 2016 05:11:16 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>

sparse  rightfully said:

drivers/gpio/gpio-pca953x.c:771:45: warning: symbol 'id' shadows an earlier one
drivers/gpio/gpio-pca953x.c:742:36: originally declared here

So, name them explicitly 'i2c_id' and 'acpi_id' to avoid any confusion.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

Compile tested only. Found while doing review of another patch touching this
driver.

 drivers/gpio/gpio-pca953x.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 892dc043f40b25..018f39cc19c875 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -739,7 +739,7 @@ out:
 static const struct of_device_id pca953x_dt_ids[];
 
 static int pca953x_probe(struct i2c_client *client,
-				   const struct i2c_device_id *id)
+				   const struct i2c_device_id *i2c_id)
 {
 	struct pca953x_platform_data *pdata;
 	struct pca953x_chip *chip;
@@ -765,21 +765,21 @@ static int pca953x_probe(struct i2c_client *client,
 
 	chip->client = client;
 
-	if (id) {
-		chip->driver_data = id->driver_data;
+	if (i2c_id) {
+		chip->driver_data = i2c_id->driver_data;
 	} else {
-		const struct acpi_device_id *id;
+		const struct acpi_device_id *acpi_id;
 		const struct of_device_id *match;
 
 		match = of_match_device(pca953x_dt_ids, &client->dev);
 		if (match) {
 			chip->driver_data = (int)(uintptr_t)match->data;
 		} else {
-			id = acpi_match_device(pca953x_acpi_ids, &client->dev);
-			if (!id)
+			acpi_id = acpi_match_device(pca953x_acpi_ids, &client->dev);
+			if (!acpi_id)
 				return -ENODEV;
 
-			chip->driver_data = id->driver_data;
+			chip->driver_data = acpi_id->driver_data;
 		}
 	}
 
-- 
2.9.3

