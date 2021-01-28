Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4DFC433E0
	for <linux-gpio@archiver.kernel.org>; Thu, 28 Jan 2021 12:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5DC364DDD
	for <linux-gpio@archiver.kernel.org>; Thu, 28 Jan 2021 12:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhA1MW0 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 28 Jan 2021 07:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhA1MWW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 07:22:22 -0500
X-Greylist: delayed 87819 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Jan 2021 04:21:41 PST
Received: from forward100p.mail.yandex.net (forward100p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68407C061756;
        Thu, 28 Jan 2021 04:21:41 -0800 (PST)
Received: from sas1-f3a441df9f84.qloud-c.yandex.net (sas1-f3a441df9f84.qloud-c.yandex.net [IPv6:2a02:6b8:c14:2726:0:640:f3a4:41df])
        by forward100p.mail.yandex.net (Yandex) with ESMTP id 1168759806F8;
        Thu, 28 Jan 2021 15:21:39 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-f3a441df9f84.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 0v2XXUOuty-LcGOcLdd;
        Thu, 28 Jan 2021 15:21:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836498;
        bh=JSyHC+PpP1PhO9j9TTM4tfNyC7KWz39+4w9IvoNJtak=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=hHBK4/I8UmIosf4FY4eh1TEsvUBTmCX/rtMCvnSvpi6U4Z8VnvaTEwBIdnI0aYCXK
         o02WMzGTdjdG/suLdKMAj/5+NreY5n1yOT13s8mkSuN7w+DKmaTudsafaarGkPCtnR
         AMBzmgko9G1ygN7aMoAo0MO+sgvdjWvqo5Up6TR0=
Authentication-Results: sas1-f3a441df9f84.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-Lcn8Me1l;
        Thu, 28 Jan 2021 15:21:38 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] gpio: gpio-ep93xx: Fix wrong irq numbers in port F
Date:   Thu, 28 Jan 2021 15:21:19 +0300
Message-Id: <20210128122123.25341-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port F irq's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.

So we need to specify girq->first otherwise:

"If device tree is used, then first_irq will be 0 and
irqs get mapped dynamically on the fly"

And that's not the thing we want.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index b990d37da143..dc88115e34da 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -430,6 +430,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		gc->to_irq = ep93xx_gpio_f_to_irq;
+		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.29.2

