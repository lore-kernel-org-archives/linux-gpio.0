From: Andrew Cooks <andrew.cooks@opengear.com>
Subject: [PATCH] gpio-pca953x: fall back to byte-at-a-time for 24-bit io
Date: Tue,  5 Dec 2017 12:17:22 +1000
Message-ID: <1512440242-8983-1-git-send-email-andrew.cooks@opengear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0073.outbound.protection.outlook.com ([104.47.38.73]:38086
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751756AbdLECSH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Dec 2017 21:18:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: platypus-sw@opengear.com, Andrew Cooks <andrew.cooks@opengear.com>

Using TCA6424A with i2c-piix4 bus driver requires byte-at-a-time IO,
because the i2c-piix4 driver (and probably some SMBus controllers) don't
support I2C_SMBUS_I2C_BLOCK_DATA.

Signed-off-by: Andrew Cooks <andrew.cooks@opengear.com>
---
 drivers/gpio/gpio-pca953x.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1b9dbf6..9e74934 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -205,11 +205,23 @@ static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
 {
+	int ret, i;
 	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 
-	return i2c_smbus_write_i2c_block_data(chip->client,
+	if (i2c_check_functionality(chip->client->adapter,
+				    I2C_FUNC_SMBUS_WRITE_I2C_BLOCK)) {
+		return i2c_smbus_write_i2c_block_data(chip->client,
 					      (reg << bank_shift) | REG_ADDR_AI,
 					      NBANK(chip), val);
+	} else {
+		for (i = 0; i < NBANK(chip); i++) {
+			ret = i2c_smbus_write_byte_data(chip->client,
+							(reg << 1) + i, val[i]);
+			if (ret < 0)
+				return ret;
+		}
+		return ret;
+	}
 }
 
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
@@ -249,7 +261,7 @@ static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
 {
 	int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 
-	return i2c_smbus_read_i2c_block_data(chip->client,
+	return i2c_smbus_read_i2c_block_data_or_emulated(chip->client,
 					     (reg << bank_shift) | REG_ADDR_AI,
 					     NBANK(chip), val);
 }
-- 
2.7.4

