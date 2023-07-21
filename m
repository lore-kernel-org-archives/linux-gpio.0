Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CADC04E69
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Jul 2023 21:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjGUVME (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Jul 2023 17:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjGUVMD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 17:12:03 -0400
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Jul 2023 14:11:57 PDT
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D26E359C;
        Fri, 21 Jul 2023 14:11:57 -0700 (PDT)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
        by mx.skole.hr (mx.skole.hr) with ESMTP id 8B8B486D1B;
        Fri, 21 Jul 2023 23:06:11 +0200 (CEST)
From:   =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
To:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.com,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH 03/10] gpio: pxa: make pxa_gpio_has_pinctrl return false for MMP_GPIO
Date:   Fri, 21 Jul 2023 22:37:45 +0200
Message-ID: <20230721210042.21535-4-duje.mihanovic@skole.hr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721210042.21535-1-duje.mihanovic@skole.hr>
References: <20230721210042.21535-1-duje.mihanovic@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes the incorrect assumption that mmp-gpio needs a pinctrl handle,
causing devices consuming GPIO to be indefinitely deferred.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 076ee6dff4d5..b48d142b736d 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -238,6 +238,7 @@ static bool pxa_gpio_has_pinctrl(void)
 	switch (gpio_type) {
 	case PXA3XX_GPIO:
 	case MMP2_GPIO:
+	case MMP_GPIO:
 		return false;
 
 	default:
-- 
2.41.0


