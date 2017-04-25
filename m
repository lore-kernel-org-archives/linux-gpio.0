From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] pinctrl: cherryview: Add terminate entry for dmi_system_id tables
Date: Tue, 25 Apr 2017 06:22:05 +0000
Message-ID: <20170425062205.22627-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36255 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S980737AbdDYGWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 02:22:16 -0400
Received: by mail-pf0-f196.google.com with SMTP id v14so6899481pfd.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 23:22:11 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Make sure dmi_system_id tables are NULL terminated.

Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer
Chromebook keyboard work again")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 9ff7901..1d09097 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1542,7 +1542,8 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
 			DMI_MATCH(DMI_BIOS_DATE, "05/21/2016"),
 		},
-	}
+	},
+	{}
 };
 
 static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)

