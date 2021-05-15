Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB6FC433B4
	for <linux-gpio@archiver.kernel.org>; Sat, 15 May 2021 07:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C177D613F2
	for <linux-gpio@archiver.kernel.org>; Sat, 15 May 2021 07:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhEOHyS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 15 May 2021 03:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbhEOHyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 May 2021 03:54:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950FCC061756
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:53:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id m12so1906550eja.2
        for <linux-gpio@vger.kernel.org>; Sat, 15 May 2021 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hNu9kfjNG1tjo/LrCGL5Rnvr9uZgm5fevoZ/tr4zU0=;
        b=hf2iN/3x1+YWUEDcCRLJz6uVPV+WYZ1lTVME58M6+CsrLZi/i0ADLq8Rkk5yOBb/Rr
         ho9ZzNh/mE+PblHuHjIJSLkxOyNBU6sSgSgyBHi4lb+NUlTxTacpZEFprX43Pf8JsTkw
         khFqXkeuhQSmNKvNa+oJ4V0VPga3U+0qKB1HWTqdi83FvldSzDme43FlmzQ9dEKJGuOW
         Zx5inay0JYKUjRm54ET2lg0UjoA4dWNrwDWliyO5sjcZRVWzItGgjvErqlQ7atmhbt5b
         92kEw7MYWkQ/4SOSF7TngkTwIonOYMCkl4WgfJe0qpLcMUvyaQ4CuROZuQLgneEQck8F
         l4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hNu9kfjNG1tjo/LrCGL5Rnvr9uZgm5fevoZ/tr4zU0=;
        b=AnyszMclGs8WaCEkpp9O2imBOIpHKl3635ozJ5eDkpS9+cx2zLR7HbFxTm0Hljy69C
         LOE9xqxhNsDqunKAb7GZ2DIJwQCj3ALM4lGMAFNVWf7B+xehOjFY6qTfNdgCVygR+1Fn
         HVkwHO7f2Lf/Wx22EcqNW9udtOsnaZqfQKXzDvrsFMyTOw1jvAKT7PoQYpqQMTolE6N0
         gsbiS/bQwAKLNihD3ntAn9/BcoI9y5dshUikTyedL3ENM2vRswoRMPqva7VL+Bxc3bqi
         zLrFlrGzJAsod8Zo/jCbLRVonubR0KBcPF+nP+Rx6HgHGXVkr4cG4qN4bcQCmTOlau4c
         nicA==
X-Gm-Message-State: AOAM532lgpeLXV6zxe/r1cOBlHSnC4LVsEBJh7x8Uhq0uSUJfIy9TFCy
        ajybLf6RAt2dd41WkLH9AzbVdNXUk4EAmmYdxy0=
X-Google-Smtp-Source: ABdhPJwSVK4oMEZIwtQ2tFcnyJdOd6KBShwt8hoeq0QyMw88v7TEL5YPpDjtx9YAS57QbP9q9uxzHA==
X-Received: by 2002:a17:906:4e0d:: with SMTP id z13mr6474729eju.343.1621065182116;
        Sat, 15 May 2021 00:53:02 -0700 (PDT)
Received: from neptune.. ([188.27.131.122])
        by smtp.gmail.com with ESMTPSA id z9sm5969890edb.51.2021.05.15.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 00:53:01 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] gpio: gpio-tps65912: remove platform_set_drvdata() + cleanup probe
Date:   Sat, 15 May 2021 10:52:57 +0300
Message-Id: <20210515075257.7918-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The platform_set_drvdata() call is only useful if we need to retrieve back
the private information.
Since the driver doesn't do that, it's not useful to have it.

If this is removed, we can also just do a direct return on
devm_gpiochip_add_data(). We don't need to print that this call failed as
there are other ways to log/see this during probe.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/gpio/gpio-tps65912.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 510d9ed9fd2a..fab771cb6a87 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -99,7 +99,6 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 {
 	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct tps65912_gpio *gpio;
-	int ret;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -109,16 +108,7 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
 	gpio->gpio_chip = template_chip;
 	gpio->gpio_chip.parent = tps->dev;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip,
-				     gpio);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, gpio);
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
 }
 
 static const struct platform_device_id tps65912_gpio_id_table[] = {
-- 
2.31.1

