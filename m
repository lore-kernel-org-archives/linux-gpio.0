From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0176/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:46:50 +0800
Message-ID: <20160802104650.25471-1-baolex.ni@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:15779 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755893AbcHBLga (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Aug 2016 07:36:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: m@bues.ch, linus.walleij@linaro.org, gnurou@gmail.com, tony.luck@intel.com, matt@codeblueprint.co.uk, m.chehab@samsung.com, lho@apm.com, dougthompson@xmission.com, bp@alien8.de
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, lee.jones@linaro.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/gpio/gpio-bt8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index acefb25..606b3c7 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -74,7 +74,7 @@ struct bt8xxgpio {
 
 
 static int modparam_gpiobase = -1/* dynamic */;
-module_param_named(gpiobase, modparam_gpiobase, int, 0444);
+module_param_named(gpiobase, modparam_gpiobase, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(gpiobase, "The GPIO number base. -1 means dynamic, which is the default.");
 
 
-- 
2.9.2

