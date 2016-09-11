From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/2] ARM64: dts: meson-gxbb: add the SDIO pins
Date: Sun, 11 Sep 2016 14:39:03 +0200
Message-ID: <20160911123903.20027-3-martin.blumenstingl@googlemail.com>
References: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
 <20160911123903.20027-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33646 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755542AbcIKMjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2016 08:39:18 -0400
Received: by mail-wm0-f65.google.com with SMTP id b187so9685046wme.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2016 05:39:17 -0700 (PDT)
In-Reply-To: <20160911123903.20027-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>

From: Neil Armstrong <narmstrong@baylibre.com>

This is used to configure the pins of the sd_emmc_a controller to
which an SDIO module is connected (when available).

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index c84cacf..fe2a1fc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -394,6 +394,25 @@
 					};
 				};
 
+				sdio_pins: sdio {
+					mux {
+						groups = "sdio_d0",
+						       "sdio_d1",
+						       "sdio_d2",
+						       "sdio_d3",
+						       "sdio_cmd",
+						       "sdio_clk";
+						function = "sdio";
+					};
+				};
+
+				sdio_irq_pins: sdio_irq {
+					mux {
+						groups = "sdio_irq";
+						function = "sdio";
+					};
+				};
+
 				uart_a_pins: uart_a {
 					mux {
 						groups = "uart_tx_a",
-- 
2.9.3

