From: Feng Kan <fkan@apm.com>
Subject: [PATCH V5 3/3] arm64:dts: Add APM X-Gene SoC GPIO controller DTS entries
Date: Thu, 26 Jun 2014 15:59:47 -0700
Message-ID: <1403823587-23404-4-git-send-email-fkan@apm.com>
References: <1403823587-23404-1-git-send-email-fkan@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og106.obsmtp.com ([64.18.0.182]:50560 "HELO
	exprod5og106.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752070AbaFZW77 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jun 2014 18:59:59 -0400
Received: by mail-pd0-f176.google.com with SMTP id ft15so3596062pdb.35
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2014 15:59:58 -0700 (PDT)
In-Reply-To: <1403823587-23404-1-git-send-email-fkan@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patches@apm.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Feng Kan <fkan@apm.com>

Add gpio dts node for APM X-Gene SoC platform.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 40aa96c..a203a4e 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -397,5 +397,12 @@
 			#clock-cells = <1>;
 			clocks = <&rtcclk 0>;
 		};
+
+		gpio: gpio0@1701c000 {
+			compatible = "apm,xgene-gpio";
+			reg = <0x0 0x1701c000 0x0 0x40>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 };
-- 
1.9.1

