From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 2/2] gpio-pca953x: Add set_multiple to allow multiple bits to be set in one write.
Date: Fri,  4 Dec 2015 17:06:25 +0800
Message-ID: <1449219985-67261-3-git-send-email-preid@electromag.com.au>
References: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:52066 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755667AbbLDJQE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 04:16:04 -0500
In-Reply-To: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

Tested with TCA6408 / TCA6416 devices.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-pca953x.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2d4892c..7c7229c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -352,6 +352,43 @@ exit:
 	mutex_unlock(&chip->i2c_lock);
 }
 
+
+static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
+		unsigned long *mask, unsigned long *bits)
+{
+	struct pca953x_chip *chip = to_pca(gc);
+	u8 reg_val[MAX_BANK];
+	int ret, offset = 0;
+	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
+	int bank;
+
+	switch (chip->chip_type) {
+	case PCA953X_TYPE:
+		offset = PCA953X_OUTPUT;
+		break;
+	case PCA957X_TYPE:
+		offset = PCA957X_OUT;
+		break;
+	}
+
+	memcpy(reg_val, chip->reg_output, NBANK(chip));
+	mutex_lock(&chip->i2c_lock);
+	for(bank=0; bank<NBANK(chip); bank++) {
+		unsigned bankmask = mask[bank/4] >> ((bank % 4) * 8);
+		if(bankmask) {
+			unsigned bankval  = bits[bank/4] >> ((bank % 4) * 8);
+			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
+		}
+	}
+	ret = i2c_smbus_write_i2c_block_data(chip->client, offset << bank_shift, NBANK(chip), reg_val);
+	if (ret)
+		goto exit;
+
+	memcpy(chip->reg_output, reg_val, NBANK(chip));
+exit:
+	mutex_unlock(&chip->i2c_lock);
+}
+
 static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 {
 	struct gpio_chip *gc;
@@ -362,6 +399,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 	gc->direction_output = pca953x_gpio_direction_output;
 	gc->get = pca953x_gpio_get_value;
 	gc->set = pca953x_gpio_set_value;
+	gc->set_multiple = pca953x_gpio_set_multiple;
 	gc->can_sleep = true;
 
 	gc->base = chip->gpio_start;
-- 
1.8.3.1

