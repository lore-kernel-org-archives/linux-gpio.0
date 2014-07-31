From: Feng Kan <fkan@apm.com>
Subject: [PATCH V6 3/3] arm64:dts: Add APM X-Gene SoC GPIO controller DTS entries
Date: Thu, 31 Jul 2014 12:03:27 -0700
Message-ID: <1406833407-28316-4-git-send-email-fkan@apm.com>
References: <1406833407-28316-1-git-send-email-fkan@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og122.obsmtp.com ([64.18.0.192]:53299 "HELO
	exprod5og122.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750859AbaGaTCi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Jul 2014 15:02:38 -0400
Received: by mail-pd0-f177.google.com with SMTP id p10so3999913pdj.22
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2014 12:02:37 -0700 (PDT)
In-Reply-To: <1406833407-28316-1-git-send-email-fkan@apm.com>
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
index 40aa96c..cf38b6f 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -397,5 +397,12 @@
 			#clock-cells = <1>;
 			clocks = <&rtcclk 0>;
 		};
+
+		gfcgpio: gpio0@1701c000 {
+			compatible = "apm,xgene-gpio";
+			reg = <0x0 0x1701c000 0x0 0x40>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
 	};
 };
-- 
1.9.1

