From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] MAINTAINERS: GPIO-INTEL-MID: add maintainer
Date: Fri, 11 Oct 2013 16:22:20 +0200
Message-ID: <1381501340-16542-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:56117 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932Ab3JKOW2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 10:22:28 -0400
Received: by mail-wi0-f181.google.com with SMTP id l12so955990wiv.14
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 07:22:27 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Cohen <david.a.cohen@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>

From: David Cohen <david.a.cohen@linux.intel.com>

Assign david.a.cohen@linux.intel.com as maintainer of Intel MID gpio
driver at drivers/gpio/gpio-intel-mid.c.

Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a0cbf3..7534a80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1910,6 +1910,12 @@ W:	http://bu3sch.de/btgpio.php
 S:	Maintained
 F:	drivers/gpio/gpio-bt8xx.c
 
+INTEL-MID GPIO DRIVER
+M:	David Cohen <david.a.cohen@linux.intel.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-intel-mid.c
+
 BTRFS FILE SYSTEM
 M:	Chris Mason <chris.mason@fusionio.com>
 L:	linux-btrfs@vger.kernel.org
-- 
1.8.3.1

