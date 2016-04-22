From: <tthayer@opensource.altera.com>
Subject: [PATCH 11/11] ARM: socfpga: dts: Add A10-SR Devkit power supply alarms
Date: Fri, 22 Apr 2016 10:33:39 -0500
Message-ID: <1461339219-15255-12-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0062.outbound.protection.outlook.com ([157.56.111.62]:63018
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754405AbcDVP3K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 22 Apr 2016 11:29:10 -0400
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Thor Thayer <tthayer@opensource.altera.com>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the Altera Arria10 Devkit power supply alarms.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index e2addf9..dc4457b 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -107,6 +107,10 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		ps_alarm {
+			compatible = "altr,a10sr-hwmon";
+		};
 	};
 };
 
-- 
1.7.9.5

