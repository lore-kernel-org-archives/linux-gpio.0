Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED4BC4332F
	for <linux-gpio@archiver.kernel.org>; Sun, 27 Nov 2022 21:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiK0V7q (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 27 Nov 2022 16:59:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiK0V7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Nov 2022 16:59:45 -0500
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7AEB8DECB
        for <linux-gpio@vger.kernel.org>; Sun, 27 Nov 2022 13:59:44 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id zPZLoGIZNzQOKzPZLocc9q; Sun, 27 Nov 2022 22:52:12 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 27 Nov 2022 22:52:12 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] gpio: Do not include <linux/kernel.h> when not really needed.
Date:   Sun, 27 Nov 2022 22:52:10 +0100
Message-Id: <3f75784c57dc0682b5e1758daddd93fee6bb4b27.1669585920.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

<linux/kernel.h> is included only for using container_of().
Include <linux/container_of.h> instead, it is much lighter.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure if the prefix should be gpio or gpiolib.

Let see if build-bots spot something which is inherit via kernel.h
---
 include/linux/of_gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index a5166eb93437..6db627257a7b 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -34,7 +34,7 @@ enum of_gpio_flags {
 
 #ifdef CONFIG_OF_GPIO
 
-#include <linux/kernel.h>
+#include <linux/container_of.h>
 
 /*
  * OF GPIO chip for memory mapped banks
-- 
2.34.1

