From: Y Vo <yvo@apm.com>
Subject: [PATCH v3 3/3] arm64: dts: Add APM X-Gene standby GPIO controller DTS entries
Date: Wed, 21 Jan 2015 09:59:25 +0700
Message-ID: <1421809165-8520-1-git-send-email-yvo@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og107.obsmtp.com ([64.18.0.184]:48793 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751533AbbAUC7i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jan 2015 21:59:38 -0500
Received: by mail-pa0-f50.google.com with SMTP id bj1so49801898pad.9
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2015 18:59:38 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches@apm.com

Add standby domain gpio controller for APM X-Gene SoC platform.

Signed-off-by: Y Vo <yvo@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index f1ad9c2..2e1c438 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -587,6 +587,19 @@
 			phy-names = "sata-phy";
 		};
 
+		sbgpio: sbgpio@17001000{
+			compatible = "apm,xgene-gpio-sb";
+			reg = <0x0 0x17001000 0x0 0x400>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupts = 	<0x0 0x28 0x1>,
+					<0x0 0x29 0x1>,
+					<0x0 0x2a 0x1>,
+					<0x0 0x2b 0x1>,
+					<0x0 0x2c 0x1>,
+					<0x0 0x2d 0x1>;
+		};
+
 		rtc: rtc@10510000 {
 			compatible = "apm,xgene-rtc";
 			reg = <0x0 0x10510000 0x0 0x400>;
-- 
1.7.1

