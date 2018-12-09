From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/6] pinctrl: meson: meson8b: fix the GPIO function for the GPIOAO pins
Date: Sun,  9 Dec 2018 20:50:51 +0100
Message-ID: <20181209195055.26813-3-martin.blumenstingl@googlemail.com>
References: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com, carlo@caione.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

The GPIOAO pins (as well as the two exotic GPIO_BSD_EN and GPIO_TEST_N)
only belong to the pin controller in the AO domain. With the current
definition these pins cannot be referred to in .dts files as group
(which is possible on GXBB and GXL for example).

Add a separate "gpio_aobus" function to fix the mapping between the pin
controller and the GPIO pins in the AO domain. This is similar to how
the GXBB and GXL drivers implement this functionality.

Fixes: 9dab1868ec0db4 ("pinctrl: amlogic: Make driver independent from two-domain configuration")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 647ad15d5c3c..91cffc051055 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -646,16 +646,18 @@ static const char * const gpio_groups[] = {
 	"BOOT_10", "BOOT_11", "BOOT_12", "BOOT_13", "BOOT_14",
 	"BOOT_15", "BOOT_16", "BOOT_17", "BOOT_18",
 
-	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3",
-	"GPIOAO_4", "GPIOAO_5", "GPIOAO_6", "GPIOAO_7",
-	"GPIOAO_8", "GPIOAO_9", "GPIOAO_10", "GPIOAO_11",
-	"GPIOAO_12", "GPIOAO_13", "GPIO_BSD_EN", "GPIO_TEST_N",
-
 	"DIF_0_P", "DIF_0_N", "DIF_1_P", "DIF_1_N",
 	"DIF_2_P", "DIF_2_N", "DIF_3_P", "DIF_3_N",
 	"DIF_4_P", "DIF_4_N"
 };
 
+static const char * const gpio_aobus_groups[] = {
+	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3",
+	"GPIOAO_4", "GPIOAO_5", "GPIOAO_6", "GPIOAO_7",
+	"GPIOAO_8", "GPIOAO_9", "GPIOAO_10", "GPIOAO_11",
+	"GPIOAO_12", "GPIOAO_13", "GPIO_BSD_EN", "GPIO_TEST_N"
+};
+
 static const char * const sd_a_groups[] = {
 	"sd_d0_a", "sd_d1_a", "sd_d2_a", "sd_d3_a", "sd_clk_a",
 	"sd_cmd_a"
@@ -871,6 +873,7 @@ static struct meson_pmx_func meson8b_cbus_functions[] = {
 };
 
 static struct meson_pmx_func meson8b_aobus_functions[] = {
+	FUNCTION(gpio_aobus),
 	FUNCTION(uart_ao),
 	FUNCTION(uart_ao_b),
 	FUNCTION(i2c_slave_ao),
-- 
2.19.2
