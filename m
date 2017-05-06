From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 4/4] pinctrl: meson: meson8: add the AO HDMI CEC pin
Date: Sat,  6 May 2017 18:57:51 +0200
Message-ID: <20170506165751.12442-5-martin.blumenstingl@googlemail.com>
References: <20170504184932.5372-1-martin.blumenstingl@googlemail.com>
 <20170506165751.12442-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36863 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750967AbdEFQ6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 May 2017 12:58:11 -0400
Received: by mail-wm0-f66.google.com with SMTP id u65so6915756wmu.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 May 2017 09:58:10 -0700 (PDT)
In-Reply-To: <20170506165751.12442-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, carlo@caione.org, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This adds another missing pin found in the Meson8 SoCs. Currently
there's no driver which would use this pin yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 2716d991af8c..e1bdf1f3b75c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -416,6 +416,8 @@ static const unsigned int i2s_ao_clk_out_ao_pins[] = { PIN(GPIOAO_9, AO_OFF) };
 static const unsigned int i2s_lr_clk_out_ao_pins[] = { PIN(GPIOAO_10, AO_OFF) };
 static const unsigned int i2s_out_ch01_ao_pins[] = { PIN(GPIOAO_11, AO_OFF) };
 
+static const unsigned int hdmi_cec_ao_pins[] = { PIN(GPIOAO_12, AO_OFF) };
+
 static struct meson_pmx_group meson8_cbus_groups[] = {
 	GPIO_GROUP(GPIOX_0, 0),
 	GPIO_GROUP(GPIOX_1, 0),
@@ -769,6 +771,8 @@ static struct meson_pmx_group meson8_aobus_groups[] = {
 	GROUP(i2s_ao_clk_out_ao,	0,	29),
 	GROUP(i2s_lr_clk_out_ao,	0,	28),
 	GROUP(i2s_out_ch01_ao,		0,	27),
+
+	GROUP(hdmi_cec_ao,		0,	17),
 };
 
 static const char * const gpio_groups[] = {
@@ -985,6 +989,10 @@ static const char * const i2s_ao_groups[] = {
 	"i2s_out_ch01_ao"
 };
 
+static const char * const hdmi_cec_ao_groups[] = {
+	"hdmi_cec_ao"
+};
+
 static struct meson_pmx_func meson8_cbus_functions[] = {
 	FUNCTION(gpio),
 	FUNCTION(sd_a),
@@ -1029,6 +1037,7 @@ static struct meson_pmx_func meson8_aobus_functions[] = {
 	FUNCTION(i2c_mst_ao),
 	FUNCTION(pwm_f_ao),
 	FUNCTION(i2s_ao),
+	FUNCTION(hdmi_cec_ao),
 };
 
 static struct meson_bank meson8_cbus_banks[] = {
-- 
2.12.2

