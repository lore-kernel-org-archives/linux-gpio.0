From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] pinctrl: intel: Pass CONFIG_DEBUG_PINCTRL to drivers
Date: Thu,  4 Dec 2014 12:32:49 +0200
Message-ID: <1417689170-41627-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:49371 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753805AbaLDKdY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 4 Dec 2014 05:33:24 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

If the user has selected CONFIG_DEBUG_PINCTRL=y make sure that Intel
pinctrl drivers will be compiled with that option as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index 4c210e4139e2..1f63cf1c18b2 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -1,4 +1,6 @@
 # Intel pin control drivers
 
+ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG
+
 obj-$(CONFIG_PINCTRL_BAYTRAIL)		+= pinctrl-baytrail.o
 obj-$(CONFIG_PINCTRL_CHERRYVIEW)	+= pinctrl-cherryview.o
-- 
2.1.3

