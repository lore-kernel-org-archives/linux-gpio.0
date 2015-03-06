From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH] pinctrl: update direction_output function of cherryview
 driver
Date: Fri, 6 Mar 2015 07:31:48 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD018452E6@SHSMSX104.ccr.corp.intel.com>
References: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:11006 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752224AbbCFHcU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 02:32:20 -0500
In-Reply-To: <1425377602-6649-1-git-send-email-qipeng.zha@intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>

Hi Linus

Are you checking to merge this patch, thanks:)



Best wishes
Qipeng


-----Original Message-----
From: Zha, Qipeng 
Sent: Tuesday, March 03, 2015 6:13 PM
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org; Westerberg, Mika; Zha, Qipeng; Chen, Jason CJ
Subject: [PATCH] pinctrl: update direction_output function of cherryview driver

From: "qipeng.zha" <qipeng.zha@intel.com>

>From the comments of gpiod_direction_output(), need to set @value as initial output, so update the lowlevel routine to make it work.

Signed-off-by: jason.cj.chen<jason.cj.chen@intel.com>
Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index e9f8b39..ee6a6de 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1206,6 +1206,7 @@ static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned offset)  static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
+	chv_gpio_set(chip, offset, value);
 	return pinctrl_gpio_direction_output(chip->base + offset);  }
 
--
1.8.3.2

