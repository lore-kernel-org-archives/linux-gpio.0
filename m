From: James Hartley <james.hartley@imgtec.com>
Subject: [PATCH] pinctrl: pistachio: fix mfio pll_lock pinmux
Date: Fri, 19 Aug 2016 12:03:23 +0100
Message-ID: <1471604603-23221-1-git-send-email-james.hartley@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: abrestic@chromium.org, Damien.Horsley@imgtec.com, linux-mips@linux-mips.org, James Hartley <james.hartley@imgtec.com>, "# 4 . 4 . x-" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

A previous patch attempted to fix the pinmuxes for mfio 84 - 89, but it
omitted a change to pistachio_pin_group pistachio_groups, which results
in incorrect pll_lock signals being routed.

Apply the correct mux settings throughout the driver.

fixes: cefc03e5995e ("pinctrl: Add Pistachio SoC pin control driver")
fixes: e9adb336d0bf ("pinctrl: pistachio: fix mfio84-89 function description and pinmux.")

Cc: <stable@vger.kernel.org> # 4.4.x-

Signed-off-by: James Hartley <james.hartley@imgtec.com>
Reviewed-by: Sifan Naeem <Sifan.Naeem@imgtec.com>

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 7bad200..55375b1 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -809,17 +809,17 @@ static const struct pistachio_pin_group pistachio_groups[] = {
 			   PADS_FUNCTION_SELECT2, 12, 0x3),
 	MFIO_MUX_PIN_GROUP(83, MIPS_PLL_LOCK, MIPS_TRACE_DATA, USB_DEBUG,
 			   PADS_FUNCTION_SELECT2, 14, 0x3),
-	MFIO_MUX_PIN_GROUP(84, SYS_PLL_LOCK, MIPS_TRACE_DATA, USB_DEBUG,
+	MFIO_MUX_PIN_GROUP(84, AUDIO_PLL_LOCK, MIPS_TRACE_DATA, USB_DEBUG,
 			   PADS_FUNCTION_SELECT2, 16, 0x3),
-	MFIO_MUX_PIN_GROUP(85, WIFI_PLL_LOCK, MIPS_TRACE_DATA, SDHOST_DEBUG,
+	MFIO_MUX_PIN_GROUP(85, RPU_V_PLL_LOCK, MIPS_TRACE_DATA, SDHOST_DEBUG,
 			   PADS_FUNCTION_SELECT2, 18, 0x3),
-	MFIO_MUX_PIN_GROUP(86, BT_PLL_LOCK, MIPS_TRACE_DATA, SDHOST_DEBUG,
+	MFIO_MUX_PIN_GROUP(86, RPU_L_PLL_LOCK, MIPS_TRACE_DATA, SDHOST_DEBUG,
 			   PADS_FUNCTION_SELECT2, 20, 0x3),
-	MFIO_MUX_PIN_GROUP(87, RPU_V_PLL_LOCK, DREQ2, SOCIF_DEBUG,
+	MFIO_MUX_PIN_GROUP(87, SYS_PLL_LOCK, DREQ2, SOCIF_DEBUG,
 			   PADS_FUNCTION_SELECT2, 22, 0x3),
-	MFIO_MUX_PIN_GROUP(88, RPU_L_PLL_LOCK, DREQ3, SOCIF_DEBUG,
+	MFIO_MUX_PIN_GROUP(88, WIFI_PLL_LOCK, DREQ3, SOCIF_DEBUG,
 			   PADS_FUNCTION_SELECT2, 24, 0x3),
-	MFIO_MUX_PIN_GROUP(89, AUDIO_PLL_LOCK, DREQ4, DREQ5,
+	MFIO_MUX_PIN_GROUP(89, BT_PLL_LOCK, DREQ4, DREQ5,
 			   PADS_FUNCTION_SELECT2, 26, 0x3),
 	PIN_GROUP(TCK, "tck"),
 	PIN_GROUP(TRSTN, "trstn"),
-- 
2.7.4
