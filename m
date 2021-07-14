Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CB2C11F66
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Jul 2021 12:51:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C528613B7
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Jul 2021 12:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239505AbhGNMyK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 14 Jul 2021 08:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239510AbhGNMyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jul 2021 08:54:07 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AA6C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jul 2021 05:51:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by baptiste.telenet-ops.be with bizsmtp
        id V0rF2500f1ccfby010rGVS; Wed, 14 Jul 2021 14:51:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eM7-0018iq-NP; Wed, 14 Jul 2021 14:51:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eM7-00AaLW-42; Wed, 14 Jul 2021 14:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Always use local variable dev in gpio_rcar_probe()
Date:   Wed, 14 Jul 2021 14:51:13 +0200
Message-Id: <c2d40c6934507ee694be43cda24387a1feef7b10.1626267044.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As we have already have a pointer to the device structure in a local
variable in gpio_rcar_probe(), we can just use "dev" instead of
"p->dev".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index e7092d5fe700d2ce..ae1ffb2b230d4a32 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -564,9 +564,9 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	}
 
 	if (p->info.has_inen) {
-		pm_runtime_get_sync(p->dev);
+		pm_runtime_get_sync(dev);
 		gpio_rcar_enable_inputs(p);
-		pm_runtime_put(p->dev);
+		pm_runtime_put(dev);
 	}
 
 	dev_info(dev, "driving %d GPIOs\n", npins);
-- 
2.25.1

