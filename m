From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/6] ARM: STi: DT: STiH407: Fix retime pin mask for PIO5 and PIO35
Date: Wed, 18 Mar 2015 10:51:34 +0000
Message-ID: <1426675899-19882-2-git-send-email-lee.jones@linaro.org>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:36702 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969AbbCRKvw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 06:51:52 -0400
Received: by wetk59 with SMTP id k59so28928416wet.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 03:51:50 -0700 (PDT)
In-Reply-To: <1426675899-19882-1-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com, Karim BEN BELGACEM <karim.ben-belgacem@st.com>

From: Karim BEN BELGACEM <karim.ben-belgacem@st.com>

This will avoid programming the retime registers when not implemented

- PIO5  : no retime registers assigned to pins 6 and 7
- PIO35 : pin 7 is reserved so no retime register assigned to it

Signed-off-by: Karim BEN BELGACEM <karim.ben-belgacem@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 402844c..0a754f2 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -104,6 +104,7 @@
 				#interrupt-cells = <2>;
 				reg = <0x5000 0x100>;
 				st,bank-name = "PIO5";
+				st,retime-pin-mask = <0x3f>;
 			};
 
 			rc {
@@ -519,6 +520,7 @@
 				#interrupt-cells = <2>;
 				reg = <0x5000 0x100>;
 				st,bank-name = "PIO35";
+				st,retime-pin-mask = <0x7f>;
 			};
 
 			i2c4 {
-- 
1.9.1

