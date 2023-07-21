Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0149C41513
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Jul 2023 21:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjGUVNr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Jul 2023 17:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjGUVNp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jul 2023 17:13:45 -0400
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFAC30E2;
        Fri, 21 Jul 2023 14:13:16 -0700 (PDT)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
        by mx.skole.hr (mx.skole.hr) with ESMTP id 2EFD888092;
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
Subject: [PATCH 02/10] gpio: pxa: use dynamic allocation of base
Date:   Fri, 21 Jul 2023 22:37:44 +0200
Message-ID: <20230721210042.21535-3-duje.mihanovic@skole.hr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721210042.21535-1-duje.mihanovic@skole.hr>
References: <20230721210042.21535-1-duje.mihanovic@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes the warning in dmesg that static allocation of the base is
deprecated.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index a1630ed4b741..076ee6dff4d5 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -350,6 +350,7 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio, void __iom
 
 	pchip->chip.parent = pchip->dev;
 	pchip->chip.label = "gpio-pxa";
+	pchip->chip.base = -1;
 	pchip->chip.direction_input  = pxa_gpio_direction_input;
 	pchip->chip.direction_output = pxa_gpio_direction_output;
 	pchip->chip.get = pxa_gpio_get;
-- 
2.41.0


