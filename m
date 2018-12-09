From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/6] pinctrl: meson: meson8: rename the "gpio" function to "gpio_periphs"
Date: Sun,  9 Dec 2018 20:50:53 +0100
Message-ID: <20181209195055.26813-5-martin.blumenstingl@googlemail.com>
References: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, carlo@caione.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

Rename the existing "gpio" function to "gpio_periphs". This makes it
consistent with the "gpio_aobus" function. Also GXBB and GXL are also
using the "gpio_periphs" naming, so this makes the code here consistent
with other Amlogic pinctrl drivers.

No functional changes since thee "gpio" function is currently not used.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 91cffc051055..b455e0c7a282 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -622,7 +622,7 @@ static struct meson_pmx_group meson8b_aobus_groups[] = {
 	GROUP(i2s_lr_clk_in,	0,	14),
 };
 
-static const char * const gpio_groups[] = {
+static const char * const gpio_periphs_groups[] = {
 	"GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3", "GPIOX_4",
 	"GPIOX_5", "GPIOX_6", "GPIOX_7", "GPIOX_8", "GPIOX_9",
 	"GPIOX_10", "GPIOX_11", "GPIOX_16", "GPIOX_17", "GPIOX_18",
@@ -839,7 +839,7 @@ static const char * const tsin_b_groups[] = {
 };
 
 static struct meson_pmx_func meson8b_cbus_functions[] = {
-	FUNCTION(gpio),
+	FUNCTION(gpio_periphs),
 	FUNCTION(sd_a),
 	FUNCTION(sdxc_a),
 	FUNCTION(pcm_a),
-- 
2.19.2
