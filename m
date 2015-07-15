From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH] pinctrl/qcom Kconfig CFG repeated
Date: Wed, 15 Jul 2015 20:23:47 +0530
Message-ID: <1436972027-2914-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:33273 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863AbbGOOyL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 10:54:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Joonwoo Park <joonwoop@codeaurora.org>, Georgi Djakov <gdjakov@mm-sol.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vinay Simha BN <simhavcs@gmail.com>

repeatation of the same configs
obj-$(CONFIG_PINCTRL_APQ8084)   += pinctrl-apq8084.o

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
 drivers/pinctrl/qcom/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 3666c70..d26a878 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -1,7 +1,6 @@
 # Qualcomm pin control drivers
 obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm.o
 obj-$(CONFIG_PINCTRL_APQ8064)	+= pinctrl-apq8064.o
-obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
 obj-$(CONFIG_PINCTRL_IPQ8064)	+= pinctrl-ipq8064.o
 obj-$(CONFIG_PINCTRL_MSM8660)	+= pinctrl-msm8660.o
 obj-$(CONFIG_PINCTRL_MSM8960)	+= pinctrl-msm8960.o
-- 
2.1.2

