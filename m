From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0177/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:46:55 +0800
Message-ID: <20160802104655.25537-1-baolex.ni@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:25432 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755873AbcHBLeK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Aug 2016 07:34:10 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, tony.luck@intel.com, matt@codeblueprint.co.uk, m.chehab@samsung.com, lho@apm.com, dougthompson@xmission.com, bp@alien8.de
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, lee.jones@linaro.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/gpio/gpio-cs5535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 90278b1..b17c3f9 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -39,7 +39,7 @@
 #define GPIO_DEFAULT_MASK 0x0F7FFFFF
 
 static ulong mask = GPIO_DEFAULT_MASK;
-module_param_named(mask, mask, ulong, 0444);
+module_param_named(mask, mask, ulong, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(mask, "GPIO channel mask.");
 
 /*
-- 
2.9.2

