From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: ssbi: fix function name typo
Date: Fri, 16 Oct 2015 22:41:31 +0200
Message-ID: <6327573.Mj84IgUkQi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:59300 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbbJPUlf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:41:35 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org

The two newly added qcom ssbi pinctrl drivers have the same bug
from a function name that apparently got changed in one place
but not another, resulting in a build error when CONFIG_DEBUG_FS
is disabled:

drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:652:14: error: 'pm8xxx_mpp_dbg_show' undeclared here (not in a function)

This fixes the two identifiers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: b4c45fe974bc ("pinctrl: qcom: ssbi: Family A gpio & mpp drivers")

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index e1a3721bc8e5..d809c9eaa323 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -584,7 +584,7 @@ static void pm8xxx_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 }
 
 #else
-#define msm_gpio_dbg_show NULL
+#define pm8xxx_gpio_dbg_show NULL
 #endif
 
 static struct gpio_chip pm8xxx_gpio_template = {
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 6652b8d7f707..8982027de8e8 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -639,7 +639,7 @@ static void pm8xxx_mpp_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 }
 
 #else
-#define msm_mpp_dbg_show NULL
+#define pm8xxx_mpp_dbg_show NULL
 #endif
 
 static struct gpio_chip pm8xxx_mpp_template = {

