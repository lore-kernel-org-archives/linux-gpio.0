From: <patrice.chotard@st.com>
Subject: [PATCH 5/8] Documentation: dt: add stmpe1600 compatible string to stmpe mfd
Date: Tue, 19 Apr 2016 14:18:34 +0200
Message-ID: <1461068317-28016-6-git-send-email-patrice.chotard@st.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13230 "EHLO
	mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753494AbcDSMT0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 19 Apr 2016 08:19:26 -0400
In-Reply-To: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com, amelie.delaunay@st.com, shawnguo@kernel.org, kernel@pengutronix.de, dinguyen@opensource.altera.com, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, Patrice Chotard <patrice.chotard@st.com>

From: Patrice Chotard <patrice.chotard@st.com>

This patch adds a new compatible string for stmpe mfd to support
stmpe1600 variant.

Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
---
 Documentation/devicetree/bindings/mfd/stmpe.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Documentation/devicetree/bindings/mfd/stmpe.txt
index 3fb68bf..f9065a5 100644
--- a/Documentation/devicetree/bindings/mfd/stmpe.txt
+++ b/Documentation/devicetree/bindings/mfd/stmpe.txt
@@ -4,7 +4,7 @@ STMPE is an MFD device which may expose the following inbuilt devices: gpio,
 keypad, touchscreen, adc, pwm, rotator.
 
 Required properties:
- - compatible                   : "st,stmpe[610|801|811|1601|2401|2403]"
+ - compatible                   : "st,stmpe[610|801|811|1600|1601|2401|2403]"
  - reg                          : I2C/SPI address of the device
 
 Optional properties:
-- 
1.9.1

