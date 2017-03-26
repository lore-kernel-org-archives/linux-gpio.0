From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 8/8] ARM64: dts: meson-gxl: add spdif output pins
Date: Sun, 26 Mar 2017 19:19:23 +0200
Message-ID: <20170326171923.19269-9-jbrunet@baylibre.com>
References: <20170326171923.19269-1-jbrunet@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:36525 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751737AbdCZRTw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Mar 2017 13:19:52 -0400
Received: by mail-wr0-f172.google.com with SMTP id w11so13733551wrc.3
        for <linux-gpio@vger.kernel.org>; Sun, 26 Mar 2017 10:19:46 -0700 (PDT)
In-Reply-To: <20170326171923.19269-1-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Add EE and AO domains pins for the spdif output to the gxl device tree.

Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 3dde55856234..8a08ad552e7a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -174,6 +174,20 @@
 				function = "i2s_out_ao";
 			};
 		};
+
+		spdif_out_ao_6_pins: spdif_out_ao_6 {
+			mux {
+				groups = "spdif_out_ao_6";
+				function = "spdif_out_ao";
+			};
+		};
+
+		spdif_out_ao_9_pins: spdif_out_ao_9 {
+			mux {
+				groups = "spdif_out_ao_9";
+				function = "spdif_out_ao";
+			};
+		};
 	};
 };
 
@@ -447,6 +461,13 @@
 				function = "i2s_out";
 			};
 		};
+
+		spdif_out_h_pins: spdif_out_ao_h {
+			mux {
+				groups = "spdif_out_h";
+				function = "spdif_out";
+			};
+		};
 	};
 
 	eth-phy-mux {
-- 
2.9.3

