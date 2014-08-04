From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] gpio: add missing includes in machine.h
Date: Mon, 4 Aug 2014 13:05:56 +0900
Message-ID: <1407125156-14269-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13466 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbaHDEGL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Aug 2014 00:06:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <treding@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

linux/types.h and linux/list.h should be included so the typed used in
the header file are always properly declared.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 include/linux/gpio/machine.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index b8ad87fab4ce..e2706140eaff 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -1,6 +1,9 @@
 #ifndef __LINUX_GPIO_MACHINE_H
 #define __LINUX_GPIO_MACHINE_H
 
+#include <linux/types.h>
+#include <linux/list.h>
+
 enum gpio_lookup_flags {
 	GPIO_ACTIVE_HIGH = (0 << 0),
 	GPIO_ACTIVE_LOW = (1 << 0),
-- 
2.0.3

