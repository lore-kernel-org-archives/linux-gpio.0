From: Quan Nguyen <qnguyen@apm.com>
Subject: [PATCH v5 3/3] arm64: dts: Update X-Gene standby GPIO controller DTS entries
Date: Fri, 29 Jan 2016 11:28:55 +0700
Message-ID: <1454041735-8434-4-git-send-email-qnguyen@apm.com>
References: <1454041735-8434-1-git-send-email-qnguyen@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:33568 "EHLO
	mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751916AbcA2E3V (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 23:29:21 -0500
Received: by mail-pf0-f174.google.com with SMTP id x125so35476980pfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 20:29:21 -0800 (PST)
In-Reply-To: <1454041735-8434-1-git-send-email-qnguyen@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com, Quan Nguyen <qnguyen@apm.com>

Update APM X-Gene standby GPIO controller DTS entries to enable it
as interrupt controller.

Signed-off-by: Y Vo <yvo@apm.com>
Signed-off-by: Quan Nguyen <qnguyen@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index fe30f76..0f733da 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -883,6 +883,9 @@
 					<0x0 0x2b 0x1>,
 					<0x0 0x2c 0x1>,
 					<0x0 0x2d 0x1>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
 		};
 
 		rtc: rtc@10510000 {
-- 
1.7.12.4

