Return-Path: <SRS0=Wjcg=A3=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FA6C433E0
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Jul 2020 10:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 282312074B
	for <linux-gpio@archiver.kernel.org>; Thu, 16 Jul 2020 10:06:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VU1lzn0u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgGPKGn (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 16 Jul 2020 06:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgGPKGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 06:06:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F3DC061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 03:06:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so6435522ljm.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=assvlrGhZdtMJ0Zn3X2YWbUyaJC6SrxIJ2dc8swcu0c=;
        b=VU1lzn0ulnKeWhfbf1+CeuxeKiVQSIGyVdBoOuDSjBKasSKPx69v48p+ejV5Ce+64P
         Hkv3FBfVA9MZs5C6AsXEHnr5xid9XyhV6oGjqHyRSPWZ5XYuXstozA9yvUhuy1nvoBP2
         fGFMQ84W3vtB4eBNwWxAlnpGJhY9veqBZCnFZ5iTON9O53lBUdReHsitkrHNjbTl8woc
         +4LJqAImcSzUQgYcr+F7rS0+L1cMuKzcpZyXZGQu55910QaNYOWIG/asWVLLHx+WmgGx
         ytZc1RyvvDFmr38GodxosIf7ATz7kWGddSxQxlNOwFsJKBBeC+nfmzdff6VKvLOqPdbW
         Fe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=assvlrGhZdtMJ0Zn3X2YWbUyaJC6SrxIJ2dc8swcu0c=;
        b=hGGja61qLi6sYbmModEI2CLxo1B+baZAwdNsaO9nOOSm5dYTrp7YdEHaaEvemOASHt
         FUORNqZViCWZml3F5XLAqPUssZ0xVg6n+wbcgXsu2ho3BQcf12xilNcJSHkabz9gx29e
         mGCIlHHwv3mns8ZHLF4L5o1JMIiTRNOFRr7PPeMC5sPvxt+7eGpqId26vmC9qp3bixKA
         PBMvuuOm8+K8X+45sck6Glr+qeqLw4dtY4A1NmT+g77EmlMHC1TVe73xtLz5Cs9B7t8O
         IksJpdexklf352XQ4TqH08JIpW1IRGIPA1vAQHOj2XiFEW3M7a/X7MkSh6K4zz58Juyr
         z52w==
X-Gm-Message-State: AOAM5320ONOWfp4Gui4OvBv3m5410AhN7TRhnLIojcInaiclBX/V9zHj
        Ej4ox5FyebKdCOgu4vp4eDDevlx/vmM=
X-Google-Smtp-Source: ABdhPJzrz/AtEOau+HUQGwPdbwVhqv3rf+EY/IqOn3D6yIcsx8QPsK+DYCV14AxNTkqbly4Sf4oyuw==
X-Received: by 2002:a2e:b607:: with SMTP id r7mr1711617ljn.5.1594894001242;
        Thu, 16 Jul 2020 03:06:41 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z23sm949981ljz.3.2020.07.16.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 03:06:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH] gpio: stmpe: Use irqchip template
Date:   Thu, 16 Jul 2020 12:06:38 +0200
Message-Id: <20200716100638.112451-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit calls to gpiochip_irqchip_add_nested() and
gpiochip_set_nested_irqchip(). The irqchip is instead
added while adding the gpiochip.

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 542706a852e6..395ee51445ea 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -507,6 +507,8 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	}
 
 	if (irq > 0) {
+		struct gpio_irq_chip *girq;
+
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 				stmpe_gpio_irq, IRQF_ONESHOT,
 				"stmpe-gpio", stmpe_gpio);
@@ -514,20 +516,16 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "unable to get irq: %d\n", ret);
 			goto out_disable;
 		}
-		ret =  gpiochip_irqchip_add_nested(&stmpe_gpio->chip,
-						   &stmpe_gpio_irq_chip,
-						   0,
-						   handle_simple_irq,
-						   IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"could not connect irqchip to gpiochip\n");
-			goto out_disable;
-		}
 
-		gpiochip_set_nested_irqchip(&stmpe_gpio->chip,
-					    &stmpe_gpio_irq_chip,
-					    irq);
+		girq = &stmpe_gpio->chip.irq;
+		girq->chip = &stmpe_gpio_irq_chip;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler = NULL;
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
+		girq->threaded = true;
 	}
 
 	platform_set_drvdata(pdev, stmpe_gpio);
-- 
2.26.2

