Return-Path: <SRS0=HCPu=ED=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15634C5DF9E
	for <linux-gpio@archiver.kernel.org>; Wed, 28 Oct 2020 22:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B643C2071A
	for <linux-gpio@archiver.kernel.org>; Wed, 28 Oct 2020 22:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbgJ1WaV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:30:21 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:51674 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387683AbgJ1WaU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:30:20 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Oct 2020 18:30:19 EDT
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4CLrFD5tdKzMr2M9
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:15:12 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id lSFC2300D4C55Sk01SFCDu; Wed, 28 Oct 2020 15:15:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEK-000oZ5-01; Wed, 28 Oct 2020 15:15:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmEJ-007FpU-C1; Wed, 28 Oct 2020 15:15:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] gpio: rcar: Cache gpiochip_get_data() return value
Date:   Wed, 28 Oct 2020 15:15:01 +0100
Message-Id: <20201028141504.1729093-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028141504.1729093-1-geert+renesas@glider.be>
References: <20201028141504.1729093-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit 43c54ecade400cf6 ("gpio: move the subdriver data pointer
into gpio_device") changed gpiochip_get_data() to an out-of-line
function, it is now worthwhile to avoid multiple calls in a row by
caching its return value in a local variable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 3ef19cef8da9b240..a75bbc9af1f14b06 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -295,14 +295,15 @@ static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int gpio_rcar_get(struct gpio_chip *chip, unsigned offset)
 {
+	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	u32 bit = BIT(offset);
 
 	/* testing on r8a7790 shows that INDT does not show correct pin state
 	 * when configured as output, so use OUTDT in case of output pins */
-	if (gpio_rcar_read(gpiochip_get_data(chip), INOUTSEL) & bit)
-		return !!(gpio_rcar_read(gpiochip_get_data(chip), OUTDT) & bit);
+	if (gpio_rcar_read(p, INOUTSEL) & bit)
+		return !!(gpio_rcar_read(p, OUTDT) & bit);
 	else
-		return !!(gpio_rcar_read(gpiochip_get_data(chip), INDT) & bit);
+		return !!(gpio_rcar_read(p, INDT) & bit);
 }
 
 static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.25.1

