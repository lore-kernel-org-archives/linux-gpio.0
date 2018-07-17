From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH] pinctrl/amd: fix gpio irq level in debugfs
Date: Mon, 16 Jul 2018 19:07:41 -0600
Message-ID: <20180717010742.1847-1-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

According to the AMD BKDG, the GPIO ActiveLevel bits (10:9) map to:
 00 Active High
 01 Active Low
 10 Active on both edges iff LevelTrig (bit 8) == 0
 11 Reserved

The current code has a bug where it interprets 00 => Active Low, and
01 => Active High.

Fix the bug, restrict "Active on both" to just the edge trigger case, and
refactor a bit to make the logic more readable.

Change-Id: Id7775ae4cb61d193fa7fbb83967a8c5a7cdd0de6
Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/pinctrl/pinctrl-amd.c | 14 +++++++-------
 drivers/pinctrl/pinctrl-amd.h |  4 ++++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 04ae139671c8a8..5df5e8d64c57e7 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -247,16 +247,16 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
 			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
+				u8 level = (pin_reg >> ACTIVE_LEVEL_OFF) &
+						ACTIVE_LEVEL_MASK;
 				interrupt_enable = "interrupt is enabled|";
 
-				if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF)) &&
-				    !(pin_reg & BIT(ACTIVE_LEVEL_OFF + 1)))
-					active_level = "Active low|";
-				else if (pin_reg & BIT(ACTIVE_LEVEL_OFF) &&
-					 !(pin_reg & BIT(ACTIVE_LEVEL_OFF + 1)))
+				if (level == ACTIVE_LEVEL_HIGH)
 					active_level = "Active high|";
-				else if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF)) &&
-					 pin_reg & BIT(ACTIVE_LEVEL_OFF + 1))
+				else if (level == ACTIVE_LEVEL_LOW)
+					active_level = "Active low|";
+				else if (!(pin_reg & BIT(LEVEL_TRIG_OFF)) &&
+					 level == ACTIVE_LEVEL_BOTH)
 					active_level = "Active on both|";
 				else
 					active_level = "Unknown Active level|";
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 8fa453a59da5e6..22af7edfdb38e8 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -54,6 +54,10 @@
 #define ACTIVE_LEVEL_MASK	0x3UL
 #define DRV_STRENGTH_SEL_MASK	0x3UL
 
+#define ACTIVE_LEVEL_HIGH	0x0UL
+#define ACTIVE_LEVEL_LOW	0x1UL
+#define ACTIVE_LEVEL_BOTH	0x2UL
+
 #define DB_TYPE_NO_DEBOUNCE               0x0UL
 #define DB_TYPE_PRESERVE_LOW_GLITCH       0x1UL
 #define DB_TYPE_PRESERVE_HIGH_GLITCH      0x2UL
-- 
2.18.0.203.gfac676dfb9-goog
