From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 2/2] ARM: shmobile: Remove #gpio-ranges-cells DT property
Date: Wed, 11 Sep 2013 15:43:27 +0200
Message-ID: <1378907007-19152-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1378907007-19152-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:60786 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754154Ab3IKNnj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2013 09:43:39 -0400
In-Reply-To: <1378907007-19152-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-sh@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

This property is no longer required by the GPIO binding. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7778.dtsi | 1 -
 arch/arm/boot/dts/r8a7779.dtsi | 1 -
 arch/arm/boot/dts/r8a7790.dtsi | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 45ac404..3577aba 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -96,6 +96,5 @@
 	pfc: pfc@fffc0000 {
 		compatible = "renesas,pfc-r8a7778";
 		reg = <0xfffc000 0x118>;
-		#gpio-range-cells = <3>;
 	};
 };
diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 23a6244..ebbe507 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -188,7 +188,6 @@
 	pfc: pfc@fffc0000 {
 		compatible = "renesas,pfc-r8a7779";
 		reg = <0xfffc0000 0x23c>;
-		#gpio-range-cells = <3>;
 	};
 
 	thermal@ffc48000 {
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 3b879e7..9851398 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -148,7 +148,6 @@
 	pfc: pfc@e6060000 {
 		compatible = "renesas,pfc-r8a7790";
 		reg = <0 0xe6060000 0 0x250>;
-		#gpio-range-cells = <3>;
 	};
 
 	sdhi0: sdhi@ee100000 {
-- 
1.8.1.5

