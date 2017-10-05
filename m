From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: sx150x: make struct sx150x_regmap_config static
Date: Thu,  5 Oct 2017 11:23:56 +0100
Message-ID: <20171005102356.29944-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38063 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbdJEKX5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2017 06:23:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure sx150x_regmap_config is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'sx150x_regmap_config' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 7450f5118445..c5ab8cef942d 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1087,7 +1087,7 @@ static bool sx150x_reg_volatile(struct device *dev, unsigned int reg)
 	return reg == pctl->data->reg_irq_src || reg == pctl->data->reg_data;
 }
 
-const struct regmap_config sx150x_regmap_config = {
+static const struct regmap_config sx150x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 32,
 
-- 
2.14.1

