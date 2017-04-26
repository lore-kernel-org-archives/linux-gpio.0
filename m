From: <sean.wang@mediatek.com>
Subject: [PATCH v2 19/30] arm: dts: mt7623: add rng nodes to the mt7623.dtsi file
Date: Wed, 26 Apr 2017 17:26:03 +0800
Message-ID: <1493198774-4478-20-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:24194 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2997123AbdDZJ1e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2017 05:27:34 -0400
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>

From: Sean Wang <sean.wang@mediatek.com>

Add rng  nodes to the mt7623.dtsi file.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a2b6238..707f0e5 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -197,6 +197,13 @@
 		#clock-cells = <1>;
 	};
 
+	rng: rng@1020f000 {
+		compatible = "mediatek,mt7623-rng";
+		reg = <0 0x1020f000 0 0x1000>;
+		clocks = <&infracfg CLK_INFRA_TRNG>;
+		clock-names = "rng";
+	};
+
 	gic: interrupt-controller@10211000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
-- 
1.9.1

