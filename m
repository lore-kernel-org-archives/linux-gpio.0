From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/4] pinctrl: meson: meson8: add support for the AO remote output pin
Date: Thu,  4 May 2017 20:49:31 +0200
Message-ID: <20170504184932.5372-4-martin.blumenstingl@googlemail.com>
References: <20170504184932.5372-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34644 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752062AbdEDStr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2017 14:49:47 -0400
Received: by mail-wm0-f65.google.com with SMTP id z129so5268961wmb.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 May 2017 11:49:46 -0700 (PDT)
In-Reply-To: <20170504184932.5372-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, carlo@caione.org, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This adds another missing pin found in the Meson8 SoCs. Currently
there's no driver which would use this pin yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index d6fc7994cad5..55fbd1a17dbe 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -395,6 +395,7 @@ static const unsigned int uart_cts_ao_a_pins[] = { PIN(GPIOAO_2, AO_OFF) };
 static const unsigned int uart_rts_ao_a_pins[] = { PIN(GPIOAO_3, AO_OFF) };
 
 static const unsigned int remote_input_pins[] = { PIN(GPIOAO_7, AO_OFF) };
+static const unsigned int remote_output_ao_pins[] = { PIN(GPIOAO_13, AO_OFF) };
 
 static const unsigned int i2c_slave_sck_ao_pins[] = { PIN(GPIOAO_4, AO_OFF) };
 static const unsigned int i2c_slave_sda_ao_pins[] = { PIN(GPIOAO_5, AO_OFF) };
@@ -748,6 +749,7 @@ static struct meson_pmx_group meson8_aobus_groups[] = {
 	GROUP(uart_rts_ao_a,		0,	9),
 
 	GROUP(remote_input,		0,	0),
+	GROUP(remote_output_ao,		0,	31),
 
 	GROUP(i2c_slave_sck_ao,		0,	2),
 	GROUP(i2c_slave_sda_ao,		0,	1),
@@ -959,7 +961,7 @@ static const char * const uart_ao_groups[] = {
 };
 
 static const char * const remote_groups[] = {
-	"remote_input"
+	"remote_input", "remote_output_ao"
 };
 
 static const char * const i2c_slave_ao_groups[] = {
-- 
2.12.2

