From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] MAINTAINERS: Add INTEL MERRIFIELD GPIO entry
Date: Mon, 11 Jul 2016 16:05:18 +0300
Message-ID: <1468242318-14656-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:57706 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754010AbcGKNFd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 09:05:33 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Add gpio-merrifield.c to MAINTAINERS database per Linus' ask.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c40e9ed..f361848 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6130,6 +6130,12 @@ L:     linux-rdma@vger.kernel.org
 S:     Supported
 F:     drivers/infiniband/hw/i40iw/
 
+INTEL MERRIFIELD GPIO DRIVER
+M:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/gpio/gpio-merrifield.c
+
 INTEL-MID GPIO DRIVER
 M:	David Cohen <david.a.cohen@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.8.1

