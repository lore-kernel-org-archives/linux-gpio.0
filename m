From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] pinctrl: baytrail: Fix compilation warnings when !CONFIG_PM
Date: Tue, 13 Oct 2015 17:51:26 +0300
Message-ID: <1444747886-70568-2-git-send-email-mika.westerberg@linux.intel.com>
References: <1444747886-70568-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27529 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932140AbbJMOvh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 13 Oct 2015 10:51:37 -0400
In-Reply-To: <1444747886-70568-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org

When CONFIG_PM is not set we get following compilation warnings:

 warning: =E2=80=98byt_gpio_runtime_suspend=E2=80=99 defined but not us=
ed [-Wunused-function]
 warning: =E2=80=98byt_gpio_runtime_resume=E2=80=99 defined but not use=
d [-Wunused-function]

=46ix this by guarding byt_gpio_runtime_suspend()/byt_gpio_runtime_resu=
me()
with #ifdef CONFIG_PM.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl=
/intel/pinctrl-baytrail.c
index f79ea430f651..b59ce75b1947 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -696,6 +696,7 @@ static int byt_gpio_resume(struct device *dev)
 }
 #endif
=20
+#ifdef CONFIG_PM
 static int byt_gpio_runtime_suspend(struct device *dev)
 {
 	return 0;
@@ -705,6 +706,7 @@ static int byt_gpio_runtime_resume(struct device *d=
ev)
 {
 	return 0;
 }
+#endif
=20
 static const struct dev_pm_ops byt_gpio_pm_ops =3D {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(byt_gpio_suspend, byt_gpio_resume)
--=20
2.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
