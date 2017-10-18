From: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v2] pinctrl: mcp23s08: fix interrupt handling regression
Date: Wed, 18 Oct 2017 17:21:02 +0300
Message-ID: <1508336462-9378-1-git-send-email-mastichi@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:51019 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751136AbdJROXI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2017 10:23:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: mastichi@gmail.com, sebastian.reichel@collabora.co.uk, preid@electromag.com.au, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

interrupt handling was broken with conversion to using regmap caching.
cached_gpio value was updated by boolean status instead of gpio reading.

Fixes: 8f38910ba4f6 ("pinctrl: mcp23s08: switch to regmap caching")
Tested-by: Phil Reid <preid@electromag.com.au>
Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3e40d42..9c950bbf 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -407,10 +407,10 @@ static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 	ret = mcp_read(mcp, MCP_GPIO, &status);
 	if (ret < 0)
 		status = 0;
-	else
+	else {
+		mcp->cached_gpio = status;
 		status = !!(status & (1 << offset));
-
-	mcp->cached_gpio = status;
+	}
 
 	mutex_unlock(&mcp->lock);
 	return status;
-- 
2.7.4

