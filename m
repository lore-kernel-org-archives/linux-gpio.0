From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: ingenic: make function ingenic_pinctrl_probe static
Date: Thu,  5 Oct 2017 11:11:37 +0100
Message-ID: <20171005101137.29664-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:37824 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751415AbdJEKLj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2017 06:11:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function ingenic_pinctrl_probe is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warnings
symbol 'ingenic_pinctrl_probe' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d84761822243..372ddf386bdb 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -717,7 +717,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{},
 };
 
-int ingenic_pinctrl_probe(struct platform_device *pdev)
+static int ingenic_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ingenic_pinctrl *jzpc;
-- 
2.14.1

