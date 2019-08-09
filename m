Return-Path: <SRS0=5jam=WF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78111C433FF
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Aug 2019 14:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48027214C6
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Aug 2019 14:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SlJPUg4R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406644AbfHIOAN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Aug 2019 10:00:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35008 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIOAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 10:00:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id l14so2251020lje.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2019 07:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HyUof/mwxdOEZdyC/A+vsjwRCqlv2heX14QepBpZerQ=;
        b=SlJPUg4Ryc4GqxZzt9hzsZf79kgami27y4EzRuAmQjSwfzXsFSQgqu0b52hAcPhNol
         +Ushr4V6bmeyWq+2/WRWivZNdhq57juehOwhlV5rn+/im1pAvUp5qzZeE6fYZHSXj25i
         djF7oVfXX7KCweZuNfvkYsNIetM+KiulNnOdCkpH7Py7whSv5K5NwlR8J6f0T5dsh+x+
         aYFnhnik0paQjNS1yIWs69zzJXT0XnHFCZQ50eCOVnl0ODMChxgzB4NDV9TLKFbh98gz
         bEb4Xwq2dpZFVTfynnTMq9YlZR/jet47WixzYQ9wk7sjnComQM4+5hrwn32mTHbUPdXr
         VZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HyUof/mwxdOEZdyC/A+vsjwRCqlv2heX14QepBpZerQ=;
        b=Z6z8ymZGvF7KuH6grm8+pytngDlYsJQhVv/92S6ZKu6+ijrcA/HXymZNfqkLLBgdD8
         3vGB/wqZ8zSCllhd6GFJosJGNzhHTD95IgTctIL4LLiZl4uvsinAm+N22DczNOwwGaRA
         W3yBYFu25EftK1o7zzD2jDrOMH6tzzv9DrcKz/1FBgMjGOS7+geeYos5sXfkYAEDbmbK
         17gV4JXg8woJx8i4lAy2huF92jZX4HM9ozGIpCdAfXFaQOIDuTAEfLgwf9WgCPPanq2I
         lNlb1kqvjdfM823fTkFk2HLPB0NSoz+2/wwquvIvJKHcR480kt1cMu84gJsV07xB4KzO
         JM3Q==
X-Gm-Message-State: APjAAAU+7x3diStULRbeMPfTCUnMxrloYKoWEhKeq4TgSM+IaEqb8xPS
        7BtnJF1L4Rh6y2Wo0kDIH6GXUTDf0xs=
X-Google-Smtp-Source: APXvYqynaK3+3q/2H+OvhelkxtCGcFCW98HmHkFMjAgoz8sQaDGcR7M0JmBV7UOTLI9xxDHv4khyZQ==
X-Received: by 2002:a2e:8756:: with SMTP id q22mr11638362ljj.108.1565359210664;
        Fri, 09 Aug 2019 07:00:10 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e62sm19488123ljf.82.2019.08.09.07.00.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:00:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: hlwd: Pass irqchip when adding gpiochip
Date:   Fri,  9 Aug 2019 16:00:05 +0200
Message-Id: <20190809140005.11654-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-hlwd.c | 58 +++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index e5fa00f8145f..4a17599f6d44 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -244,43 +244,45 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 		ngpios = 32;
 	hlwd->gpioc.ngpio = ngpios;
 
-	res = devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
-	if (res)
-		return res;
-
 	/* Mask and ack all interrupts */
 	iowrite32be(0, hlwd->regs + HW_GPIOB_INTMASK);
 	iowrite32be(0xffffffff, hlwd->regs + HW_GPIOB_INTFLAG);
 
 	/*
 	 * If this GPIO controller is not marked as an interrupt controller in
-	 * the DT, return.
+	 * the DT, skip interrupt support.
 	 */
-	if (!of_property_read_bool(pdev->dev.of_node, "interrupt-controller"))
-		return 0;
-
-	hlwd->irq = platform_get_irq(pdev, 0);
-	if (hlwd->irq < 0) {
-		dev_info(&pdev->dev, "platform_get_irq returned %d\n",
-			 hlwd->irq);
-		return hlwd->irq;
+	if (of_property_read_bool(pdev->dev.of_node, "interrupt-controller")) {
+		struct gpio_irq_chip *girq;
+
+		hlwd->irq = platform_get_irq(pdev, 0);
+		if (hlwd->irq < 0) {
+			dev_info(&pdev->dev, "platform_get_irq returned %d\n",
+				 hlwd->irq);
+			return hlwd->irq;
+		}
+
+		hlwd->irqc.name = dev_name(&pdev->dev);
+		hlwd->irqc.irq_mask = hlwd_gpio_irq_mask;
+		hlwd->irqc.irq_unmask = hlwd_gpio_irq_unmask;
+		hlwd->irqc.irq_enable = hlwd_gpio_irq_enable;
+		hlwd->irqc.irq_set_type = hlwd_gpio_irq_set_type;
+
+		girq = &hlwd->gpioc.irq;
+		girq->chip = &hlwd->irqc;
+		girq->parent_handler = hlwd_gpio_irqhandler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = hlwd->irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
 	}
 
-	hlwd->irqc.name = dev_name(&pdev->dev);
-	hlwd->irqc.irq_mask = hlwd_gpio_irq_mask;
-	hlwd->irqc.irq_unmask = hlwd_gpio_irq_unmask;
-	hlwd->irqc.irq_enable = hlwd_gpio_irq_enable;
-	hlwd->irqc.irq_set_type = hlwd_gpio_irq_set_type;
-
-	res = gpiochip_irqchip_add(&hlwd->gpioc, &hlwd->irqc, 0,
-				   handle_level_irq, IRQ_TYPE_NONE);
-	if (res)
-		return res;
-
-	gpiochip_set_chained_irqchip(&hlwd->gpioc, &hlwd->irqc,
-				     hlwd->irq, hlwd_gpio_irqhandler);
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
 }
 
 static const struct of_device_id hlwd_gpio_match[] = {
-- 
2.21.0

