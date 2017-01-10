From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/6] pinctrl: broxton: Use correct PADCFGLOCK offset
Date: Tue, 10 Jan 2017 17:31:56 +0300
Message-ID: <20170110143201.53539-2-mika.westerberg@linux.intel.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

PADCFGLOCK (and PADCFGLOCK_TX) offset in Broxton actually starts at 0x060
and not 0x090 as used in the driver. Fix it to use the correct offset.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 59cb7a6fc5be..901b356b09d7 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -19,7 +19,7 @@
 
 #define BXT_PAD_OWN	0x020
 #define BXT_HOSTSW_OWN	0x080
-#define BXT_PADCFGLOCK	0x090
+#define BXT_PADCFGLOCK	0x060
 #define BXT_GPI_IE	0x110
 
 #define BXT_COMMUNITY(s, e)				\
-- 
2.11.0
