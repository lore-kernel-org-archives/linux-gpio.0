Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706B4C4332F
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Dec 2022 16:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiLOQnL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Dec 2022 11:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbiLOQnI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 11:43:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B7631EF4;
        Thu, 15 Dec 2022 08:43:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2A5A61E3B;
        Thu, 15 Dec 2022 16:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3B1C433D2;
        Thu, 15 Dec 2022 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671122587;
        bh=EJbzFTzdiVnx0DkBjvBmxcdCKoZgTncI1xo0FQ9Ph00=;
        h=From:To:Cc:Subject:Date:From;
        b=cVDq0W3vD9FvmjOGUWuYhrlG6cSOWaJu5/TlD2iP/9YBDHp+8h2gd4gsUpLFD4qgc
         We3FbLRJ2UrJZ52IjLRssK93sSYVDvx1l5nwjYBX+ibedXTjkqUnZIJqgO7zPhCgS3
         hGaRWq9LgLIqYMq48RikZhlEumapRzeOWqMqJR/QFJqP+IMnDtgi5DWgD3ughZ56au
         jSBo2C3rXVTuXYb38ZxP0CZ63rm0SZVV9qoeu9JGbpDIH9r3yR0cfjxL55U339wx1l
         CHtUg34/cUXb3uv1FkfGkXzkvZc0fiyl7hrh1V+ijLgAssP9kmrS2FnafwV/G5yDui
         nj6RkTUPGfO3w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Slark Xiao <slark_xiao@163.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: at91: convert to NOIRQ_SYSTEM_SLEEP_PM_OPS
Date:   Thu, 15 Dec 2022 17:42:54 +0100
Message-Id: <20221215164301.934805-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

With the old SET_NOIRQ_SYSTEM_SLEEP_PM_OPS, some configs result in a
build warning:

drivers/pinctrl/pinctrl-at91.c:1668:12: error: 'at91_gpio_resume' defined but not used [-Werror=unused-function]
 1668 | static int at91_gpio_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-at91.c:1650:12: error: 'at91_gpio_suspend' defined but not used [-Werror=unused-function]
 1650 | static int at91_gpio_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/pinctrl-at91.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 1e1813d7c550..cf2423855a80 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1923,7 +1923,7 @@ static int at91_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops at91_gpio_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(at91_gpio_suspend, at91_gpio_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(at91_gpio_suspend, at91_gpio_resume)
 };
 
 static struct platform_driver at91_gpio_driver = {
-- 
2.35.1

