From: Yong Li <sdliyong@gmail.com>
Subject: [PATCH v2] gpio: pca953x: Use correct u16 value for register word write
Date: Wed, 30 Mar 2016 14:49:14 +0800
Message-ID: <1459320554-2455-1-git-send-email-sdliyong@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:23812 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753004AbcC3GxO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 30 Mar 2016 02:53:14 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, alexander.stein@systec-electronic.com, preid@electromag.com.au
Cc: sdliyong@gmail.com

The current implementation only uses the first byte in val,
the second byte is always 0. Change it to use cpu_to_le16
to write the two bytes into the register

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d0d3065..e66084c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -18,6 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/platform_data/pca953x.h>
 #include <linux/slab.h>
+#include <asm/unaligned.h>
 #include <linux/of_platform.h>
 #include <linux/acpi.h>
 
@@ -159,7 +160,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 		switch (chip->chip_type) {
 		case PCA953X_TYPE:
 			ret = i2c_smbus_write_word_data(chip->client,
-							reg << 1, (u16) *val);
+			    reg << 1, cpu_to_le16(get_unaligned((u16 *)val)));
 			break;
 		case PCA957X_TYPE:
 			ret = i2c_smbus_write_byte_data(chip->client, reg << 1,
-- 
2.1.4

