From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv2 1/2] gpio: xilinx: dt-binding: Add clock node
Date: Wed, 9 Nov 2016 10:39:50 +0530
Message-ID: <1478668191-26322-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam03on0083.outbound.protection.outlook.com ([104.47.42.83]:40395
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751615AbcKIFKA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Nov 2016 00:10:00 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: soren.brinkmann@xilinx.com, michal.simek@xilinx.com, shubhrajyoti.datta@gmail.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add the clock node to the dt binding.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2: 
Make clocks optional
Add clock name

 .../devicetree/bindings/gpio/gpio-xilinx.txt       |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
index 63bf4be..1372007 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
@@ -25,12 +25,16 @@ Optional properties:
 - xlnx,dout-default-2 : as above but the second channel
 - xlnx,gpio2-width : as above but for the second channel
 - xlnx,tri-default-2 : as above but for the second channel
+- clocks: Input clock specifier. Refer to common clock bindings.
+- clock-names: Input clock name, should be s_axi_aclk.
 
 
 Example:
 gpio: gpio@40000000 {
 	#gpio-cells = <2>;
 	compatible = "xlnx,xps-gpio-1.00.a";
+	clocks = <&clkc 15>;
+	clock-names = "s_axi_aclk";
 	gpio-controller ;
 	interrupt-parent = <&microblaze_0_intc>;
 	interrupts = < 6 2 >;
-- 
1.7.1

