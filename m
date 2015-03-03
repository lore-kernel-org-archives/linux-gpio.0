From: "qipeng.zha" <qipeng.zha@intel.com>
Subject: [PATCH] pinctrl: update direction_output function of cherryview driver
Date: Tue,  3 Mar 2015 18:13:22 +0800
Message-ID: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:29268 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751241AbbCCCLl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 2 Mar 2015 21:11:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, mika.westerberg@intel.com, qipeng.zha@intel.com, "jason.cj.chen" <jason.cj.chen@intel.com>

From: "qipeng.zha" <qipeng.zha@intel.com>

>From the comments of gpiod_direction_output(), need to set @value
as initial output, so update the lowlevel routine to make it work.

Signed-off-by: jason.cj.chen<jason.cj.chen@intel.com>
Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index e9f8b39..ee6a6de 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1206,6 +1206,7 @@ static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
+	chv_gpio_set(chip, offset, value);
 	return pinctrl_gpio_direction_output(chip->base + offset);
 }
 
-- 
1.8.3.2

