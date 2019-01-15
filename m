From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/2] gpio: sprd: Fix the incorrect data register
Date: Tue, 15 Jan 2019 15:52:58 +0800
Message-ID: <732ea4f8ff1bf3ad28bda543ae8e1727c78f8b3b.1547538574.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, orsonzhai@gmail.com, zhang.lyra@gmail.com
Cc: baolin.wang@linaro.org, neo.hou@unisoc.com, broonie@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Neo Hou <neo.hou@unisoc.com>

Since differnt type EICs have its own data register to read, thus fix the
incorrect data register.

Signed-off-by: Neo Hou <neo.hou@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/gpio/gpio-eic-sprd.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index e0d6a0a..257df59 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -180,7 +180,18 @@ static void sprd_eic_free(struct gpio_chip *chip, unsigned int offset)
 
 static int sprd_eic_get(struct gpio_chip *chip, unsigned int offset)
 {
-	return sprd_eic_read(chip, offset, SPRD_EIC_DBNC_DATA);
+	struct sprd_eic *sprd_eic = gpiochip_get_data(chip);
+
+	switch (sprd_eic->type) {
+	case SPRD_EIC_DEBOUNCE:
+		return sprd_eic_read(chip, offset, SPRD_EIC_DBNC_DATA);
+	case SPRD_EIC_ASYNC:
+		return sprd_eic_read(chip, offset, SPRD_EIC_ASYNC_DATA);
+	case SPRD_EIC_SYNC:
+		return sprd_eic_read(chip, offset, SPRD_EIC_SYNC_DATA);
+	default:
+		return -ENOTSUPP;
+	}
 }
 
 static int sprd_eic_direction_input(struct gpio_chip *chip, unsigned int offset)
-- 
1.7.9.5
