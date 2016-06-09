From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH] gpio: pca953x: Fix NBANK calculation for PCA9536
Date: Thu, 9 Jun 2016 11:02:04 +0530
Message-ID: <20160609053204.32398-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([198.47.19.11]:53181 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbcFIFcR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Jun 2016 01:32:17 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>

NBANK() macro assumes that ngpios is a multiple of 8(BANK_SZ) and
hence results in 0 banks for PCA9536 which has just 4 gpios. This is
wrong as PCA9356 has 1 bank with 4 gpios. This results in uninitialized
PCA953X_INVERT register. Fix this by using DIV_ROUND_UP macro in
NBANK().

Cc: stable@vger.kernel.org
Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 763028562d22..f31b141c05de 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -90,7 +90,7 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 #define MAX_BANK 5
 #define BANK_SZ 8
 
-#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
+#define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
 
 struct pca953x_chip {
 	unsigned gpio_start;
-- 
2.8.3

