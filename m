From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] pinctrl: cherryview: Add terminate entry for dmi_system_id tables
Date: Mon, 15 May 2017 14:01:02 +0300
Message-ID: <20170515110103.59765-3-mika.westerberg@linux.intel.com>
References: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Make sure dmi_system_id tables are NULL terminated.

Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard work again")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 2debba62fac9..e35d0fe4c737 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1547,7 +1547,8 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
 			DMI_MATCH(DMI_BIOS_DATE, "05/21/2016"),
 		},
-	}
+	},
+	{}
 };
 
 static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
-- 
2.11.0
