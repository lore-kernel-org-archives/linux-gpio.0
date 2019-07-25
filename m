Return-Path: <SRS0=OcjB=VW=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AFFC7618B
	for <linux-gpio@archiver.kernel.org>; Thu, 25 Jul 2019 13:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABDCF2238C
	for <linux-gpio@archiver.kernel.org>; Thu, 25 Jul 2019 13:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfGYNPk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 25 Jul 2019 09:15:40 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:57334 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729960AbfGYNPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 09:15:40 -0400
X-Greylist: delayed 328 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Jul 2019 09:15:39 EDT
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 785EC73A34D; Thu, 25 Jul 2019 15:10:06 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: mockup: don't depend twice on GPIOLIB
Date:   Thu, 25 Jul 2019 15:10:02 +0200
Message-Id: <20190725131002.14597-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

config GPIO_MOCKUP is defined in a big if GPIOLIB ... endif block so it
doesn't need to depend explicitly on GPIOLIB.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bb13c266c329..856fcd260ba2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1465,7 +1465,6 @@ endmenu
 
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
-	depends on GPIOLIB
 	select IRQ_SIM
 	help
 	  This enables GPIO Testing driver, which provides a way to test GPIO
-- 
2.20.1

