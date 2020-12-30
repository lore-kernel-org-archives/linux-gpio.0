Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3915BC433E0
	for <linux-gpio@archiver.kernel.org>; Wed, 30 Dec 2020 15:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08E82221FA
	for <linux-gpio@archiver.kernel.org>; Wed, 30 Dec 2020 15:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgL3PrJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 30 Dec 2020 10:47:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbgL3PrJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Dec 2020 10:47:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A670321D1B;
        Wed, 30 Dec 2020 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609343188;
        bh=lVfUpw3lvqT33Z8O0WjwPPEFBoU9imrzV2aT6/td96E=;
        h=From:To:Cc:Subject:Date:From;
        b=kD8jsZxPnCDyVXyVGOjSRbNCNs5XJtvkXibMhuQYfI+Xjd1ZT0NG+4ZN+Z0gH/sJr
         NB1LsGM0DjGJkPJ+AO/xzpjqROSitt0EC/DbE2gTE3U2lHf0UHY1xINmcDJf7KjpTu
         g3JKwW8/SvHMyWcZO5cvFibtG5NnDMSCNXTvJCcDlJTvI6u56WJOLs3wjazZT7NKOJ
         8/DKRNpAb/TRvP7D3bgFd08/FIPo5KyENSiAjuPVEbhWDhEZ38uf9M1VrP20BjIG58
         mdOEC+Uul4Y0v7qRImVbtzv6NL7a2+bpVDwqMTno0uX5LEs50RZKJLkBCVj9GmZbLC
         06JMLJXG43kkA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Halaney <ajhalaney@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: nomadik: remove an unused variable
Date:   Wed, 30 Dec 2020 16:46:17 +0100
Message-Id: <20201230154624.714388-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A recent patch added a local variable twice:

drivers/pinctrl/nomadik/pinctrl-nomadik.c:953:8: error: unused variable 'wake' [-Werror,-Wunused-variable]

Remove the unused outer declaration

Fixes: f3925032d7fd ("pinctrl: nomadik: Use irq_has_action()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index d4ea10803fd9..abfe11c7b49f 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -949,7 +949,6 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 	} else {
 		int irq = chip->to_irq(chip, offset);
 		const int pullidx = pull ? 1 : 0;
-		bool wake;
 		int val;
 		static const char * const pulls[] = {
 			"none        ",
-- 
2.29.2

