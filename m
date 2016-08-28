From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] ARM64: dts: meson-gxbb: add the SDIO pins
Date: Sun, 28 Aug 2016 18:47:25 +0200
Message-ID: <20160828164725.19429-3-martin.blumenstingl@googlemail.com>
References: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33153 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755600AbcH1Qrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Aug 2016 12:47:36 -0400
Received: by mail-wm0-f68.google.com with SMTP id o80so6502382wme.0
        for <linux-gpio@vger.kernel.org>; Sun, 28 Aug 2016 09:47:36 -0700 (PDT)
In-Reply-To: <20160828164725.19429-1-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, khilman@baylibre.com, carlo@caione.org
Cc: linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>

This can be passed to the sd_emmc_a controller to which the SDIO module
is connected (when available).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e2dae1a..6864523 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -355,6 +355,18 @@
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
 				uart_a_pins: uart_a {
 					mux {
 						groups = "uart_tx_a",
-- 
2.9.3

