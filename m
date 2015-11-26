From: Martin Schiller <mschiller@tdt.de>
Subject: [PATCH v3 3/5] pinctrl/lantiq: update devicetree binding in dts file
Date: Thu, 26 Nov 2015 11:00:08 +0100
Message-ID: <1448532010-30930-3-git-send-email-mschiller@tdt.de>
References: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxout51.expurgate.net ([194.37.255.51]:37180 "EHLO
	mxout51.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbbKZKBi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2015 05:01:38 -0500
In-Reply-To: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ralf@linux-mips.org, blogic@openwrt.org, hauke@hauke-m.de, jogo@openwrt.org, daniel.schwierzeck@gmail.com, Martin Schiller <mschiller@tdt.de>

This patch updates the compatible string in the easy50712.dts file to the new
"lantiq,danube-pinctrl".

Signed-off-by: Martin Schiller <mschiller@tdt.de>
---
Changes in v3:
None

Changes in v2:
-changed "lantiq,pinctrl-danube" to "lantiq,danube-pinctrl"

 arch/mips/boot/dts/lantiq/easy50712.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/easy50712.dts b/arch/mips/boot/dts/lantiq/easy50712.dts
index 143b8a3..b599625 100644
--- a/arch/mips/boot/dts/lantiq/easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/easy50712.dts
@@ -52,7 +52,7 @@
 		};
 
 		gpio: pinmux@E100B10 {
-			compatible = "lantiq,pinctrl-xway";
+			compatible = "lantiq,danube-pinctrl";
 			pinctrl-names = "default";
 			pinctrl-0 = <&state_default>;
 
-- 
2.1.4

