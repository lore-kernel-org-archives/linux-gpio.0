From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: pca953x: remove incorrect le16_to_cpu calls
Date: Mon,  3 Jul 2017 20:45:30 +0300
Message-ID: <20170703174530.81298-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:7087 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755825AbdGCRpf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Jul 2017 13:45:35 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

i2c_smbus commands handle the correct byte order for smbus transactions
internally. This will currently result in incorrect operation on big
endian systems.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 4c9e21300a26..1b9dbf691ae7 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -187,10 +187,9 @@ static int pca953x_write_regs_8(struct pca953x_chip *chip, int reg, u8 *val)
 
 static int pca953x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 {
-	__le16 word = cpu_to_le16(get_unaligned((u16 *)val));
+	u16 word = get_unaligned((u16 *)val);
 
-	return i2c_smbus_write_word_data(chip->client,
-					 reg << 1, (__force u16)word);
+	return i2c_smbus_write_word_data(chip->client, reg << 1, word);
 }
 
 static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
@@ -241,8 +240,7 @@ static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
 	int ret;
 
 	ret = i2c_smbus_read_word_data(chip->client, reg << 1);
-	val[0] = (u16)ret & 0xFF;
-	val[1] = (u16)ret >> 8;
+	put_unaligned(ret, (u16 *)val);
 
 	return ret;
 }
-- 
2.11.0

