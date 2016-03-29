From: Yong Li <sdliyong@gmail.com>
Subject: [PATCH] gpio: pca953x: Use correct u16 value for register word write
Date: Tue, 29 Mar 2016 14:27:32 +0800
Message-ID: <1459232852-15697-1-git-send-email-sdliyong@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:56943 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751041AbcC2Gbk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Mar 2016 02:31:40 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: sdliyong@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The current implementation only uses the first byte in *val,
the second data is always 0. Change it to *(u16 *)val
to write the two bytes into the register

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d0d3065..cf3d410 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -159,7 +159,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 		switch (chip->chip_type) {
 		case PCA953X_TYPE:
 			ret = i2c_smbus_write_word_data(chip->client,
-							reg << 1, (u16) *val);
+							reg << 1, *(u16 *)val);
 			break;
 		case PCA957X_TYPE:
 			ret = i2c_smbus_write_byte_data(chip->client, reg << 1,
-- 
2.1.4

