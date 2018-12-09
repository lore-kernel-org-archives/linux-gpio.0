From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 6/6] pinctrl: meson: meson8b: add the missing GPIO_GROUPs for BOOT and CARD
Date: Sun,  9 Dec 2018 20:50:55 +0100
Message-ID: <20181209195055.26813-7-martin.blumenstingl@googlemail.com>
References: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, carlo@caione.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

Add the BOOT and CARD pins as GROUP_GROUPs as well so they can be
configured in devicetree using groups = BOOTx or groups = CARDx. This
makes the behavior consistent with other pins inside the same driver as
well as with the BOOT and CARD pins of the GXBB and GXL pinctrl drivers.

Fixes: 0fefcb6876d0d6 ("pinctrl: Add support for Meson8b")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index b455e0c7a282..c69ca95b1ad5 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -403,6 +403,34 @@ static struct meson_pmx_group meson8b_cbus_groups[] = {
 	GPIO_GROUP(GPIOH_8),
 	GPIO_GROUP(GPIOH_9),
 
+	GPIO_GROUP(CARD_0),
+	GPIO_GROUP(CARD_1),
+	GPIO_GROUP(CARD_2),
+	GPIO_GROUP(CARD_3),
+	GPIO_GROUP(CARD_4),
+	GPIO_GROUP(CARD_5),
+	GPIO_GROUP(CARD_6),
+
+	GPIO_GROUP(BOOT_0),
+	GPIO_GROUP(BOOT_1),
+	GPIO_GROUP(BOOT_2),
+	GPIO_GROUP(BOOT_3),
+	GPIO_GROUP(BOOT_4),
+	GPIO_GROUP(BOOT_5),
+	GPIO_GROUP(BOOT_6),
+	GPIO_GROUP(BOOT_7),
+	GPIO_GROUP(BOOT_8),
+	GPIO_GROUP(BOOT_9),
+	GPIO_GROUP(BOOT_10),
+	GPIO_GROUP(BOOT_11),
+	GPIO_GROUP(BOOT_12),
+	GPIO_GROUP(BOOT_13),
+	GPIO_GROUP(BOOT_14),
+	GPIO_GROUP(BOOT_15),
+	GPIO_GROUP(BOOT_16),
+	GPIO_GROUP(BOOT_17),
+	GPIO_GROUP(BOOT_18),
+
 	GPIO_GROUP(DIF_0_P),
 	GPIO_GROUP(DIF_0_N),
 	GPIO_GROUP(DIF_1_P),
-- 
2.19.2
