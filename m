From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] net: mediatek: Explicitly include pinctrl headers
Date: Mon,  5 Feb 2018 13:54:36 +0100
Message-ID: <20180205125436.24005-1-thierry.reding@gmail.com>
References: <20180205124750.19305-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:40714 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753079AbeBEMyk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Feb 2018 07:54:40 -0500
In-Reply-To: <20180205124750.19305-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Mediatek ethernet driver fails to build after commit 23c35f48f5fb
("pinctrl: remove include file from <linux/device.h>") because it relies
on the pinctrl/consumer.h and pinctrl/devinfo.h being pulled in by the
device.h header implicitly.

Include these headers explicitly to avoid the build failure.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 29826dd15204..9e74c165f3ca 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -23,6 +23,8 @@
 #include <linux/reset.h>
 #include <linux/tcp.h>
 #include <linux/interrupt.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/devinfo.h>
 
 #include "mtk_eth_soc.h"
 
-- 
2.15.1

