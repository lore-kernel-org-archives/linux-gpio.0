From: <tthayer@opensource.altera.com>
Subject: [PATCH 05/11] ARM: socfpga: dts: Add SPI Master1 for Arria10 System Resource chip
Date: Fri, 22 Apr 2016 10:33:33 -0500
Message-ID: <1461339219-15255-6-git-send-email-tthayer@opensource.altera.com>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0055.outbound.protection.outlook.com ([157.56.111.55]:56491
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932198AbcDVP3F (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 22 Apr 2016 11:29:05 -0400
In-Reply-To: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Thor Thayer <tthayer@opensource.altera.com>

From: Thor Thayer <tthayer@opensource.altera.com>

Add the Altera Arria10 SPI Master Node in preparation for the A10SR
MFD node.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 17e81dc..e7b6c4a 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -567,6 +567,21 @@
 			status = "disabled";
 		};
 
+		spi1: spi@ffda5000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xffda5000 0x100>;
+			interrupts = <0 102 4>;
+			num-chipselect = <4>;
+			bus-num = <0>;
+			/*32bit_access;*/
+			tx-dma-channel = <&pdma 16>;
+			rx-dma-channel = <&pdma 17>;
+			clocks = <&spi_m_clk>;
+			status = "disabled";
+		};
+
 		sdr: sdr@ffc25000 {
 			compatible = "syscon";
 			reg = <0xffcfb100 0x80>;
-- 
1.7.9.5

