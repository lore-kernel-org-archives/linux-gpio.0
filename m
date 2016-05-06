From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/7] ARM64: dts: amlogic: add pins for EMMC, SD
Date: Fri,  6 May 2016 07:21:24 -0700
Message-ID: <1462544486-9516-6-git-send-email-khilman@baylibre.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:35171 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757924AbcEFOVd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 May 2016 10:21:33 -0400
Received: by mail-pf0-f178.google.com with SMTP id 77so50231404pfv.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 May 2016 07:21:32 -0700 (PDT)
In-Reply-To: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-meson@googlegroups.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 35397fcc5380..7b22b9d3b9d9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -213,6 +213,27 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 				};
+
+				emmc_pins: emmc {
+					mux {
+						groups = "emmc_nand_d07",
+						       "emmc_cmd",
+						       "emmc_clk";
+						function = "emmc";
+					};
+				};
+
+				sdcard_pins: sdcard {
+					mux {
+						groups = "sdcard_d0",
+						       "sdcard_d1",
+						       "sdcard_d2",
+						       "sdcard_d3",
+						       "sdcard_cmd",
+						       "sdcard_clk";
+						function = "sdcard";
+					};
+				};
 			};
 		};
 
-- 
2.7.4

