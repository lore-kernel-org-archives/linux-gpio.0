From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] gpio: pl061: constify amba_id
Date: Wed, 23 Aug 2017 21:45:09 +0530
Message-ID: <e3ea7773c305ca105b8564821028f91fb529087a.1503504813.git.arvind.yadav.cs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35263 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932303AbdHWQPT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 12:15:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

amba_id are not supposed to change at runtime. All functions
working with const amba_id. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 3d3d6b6..6aaaab7 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -405,7 +405,7 @@ static const struct dev_pm_ops pl061_dev_pm_ops = {
 };
 #endif
 
-static struct amba_id pl061_ids[] = {
+static const struct amba_id pl061_ids[] = {
 	{
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
-- 
2.7.4

