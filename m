Return-Path: <SRS0=1EQs=4C=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F78C2BA83
	for <linux-gpio@archiver.kernel.org>; Fri, 14 Feb 2020 14:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEAEB2168B
	for <linux-gpio@archiver.kernel.org>; Fri, 14 Feb 2020 14:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbB2PP8f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgBNOaP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 14 Feb 2020 09:30:15 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46270 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgBNOaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 09:30:15 -0500
Received: by mail-pl1-f193.google.com with SMTP id y8so3786110pll.13
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CR44xV8vqwg+Mfcv+E1ifpBEqvnkBOi3l2fT1rILObU=;
        b=fbB2PP8fhvXbttw1yYlY8h0WEX5TskLvsJocf0xLhVLJrrTkvRRAcXepWTllJSPDCE
         fxL9Db5EGN86xJzNTKDdAnaFeeoBvnjqlQfJU0hhcH4aLQJPdvkTlVPY86WkhywKFsC2
         2Z/lKD3bTd39f8v88iTNSPEPJzrfzjeAkKLRl4SRcS4NFdtc3Hc10ZAuMX7+uU9QN8Gl
         UhbvrV1gmrhmia8QJtpgp8rc1viM2NpFO7c4Pep6W7wB/oC4ZKIASibzAIFrAg6/cxLS
         O9bHbMnhbKn3sSLb/heGN+Tf6XfXApyxak1e2Ufci+fucTZ5kDCYZ7h5AbyNFzD2ddvu
         ZH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CR44xV8vqwg+Mfcv+E1ifpBEqvnkBOi3l2fT1rILObU=;
        b=HUoO22C2ocTs+jWPUEjAC+pSy1AQpKBWBBrm6libN0wWvQ/OVMwzr76xKQaGqlFzQl
         R+j9bD9tgSJsB7olQnjzpqfv2mK/62ocJ1cMlxq8x0npML0fTFqoUM/EdE/i4wNumWDn
         3liXAUaueB2Wewf7RFcWY+Uyk+yiTkrrWA3KP4aWNLJLw/VEpaGQfftXYvjeHdd1l7Bp
         ZUfQQdFpgh9RB0O7vjP/3799Aa0ILwDJw2Rz4EUYbCo7W18WyLj8Gx/Kgarn9WCq3O2H
         yJDu9s/ck6tAsreYpg3pBHm+DndOVeWOZx4pp48f6Y0qi8j7xFLJ4rK0NUsizxNp5BY8
         oAig==
X-Gm-Message-State: APjAAAVOEPhzy2TlKfMpEVBfoy094/j3gQLuMHyoZtszJWM+ipZgj2bn
        5w9IxN42evH6xJwOddpxxzk=
X-Google-Smtp-Source: APXvYqzYCel9zCRngGx5W2a1YUT0Dkng64u+Kxz0vRutH8o9yW9ecd24sk7t2hi4ZnbVnygVoGyT1w==
X-Received: by 2002:a17:90a:928c:: with SMTP id n12mr4095437pjo.45.1581690614192;
        Fri, 14 Feb 2020 06:30:14 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id g22sm7274741pgk.85.2020.02.14.06.30.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 14 Feb 2020 06:30:13 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] gpio: mmio: use devm_platform_ioremap_resource_byname()
Date:   Fri, 14 Feb 2020 22:30:02 +0800
Message-Id: <1581690602-345-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap_resource() separately.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/gpio/gpio-mmio.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f729e3e..5cfef3c 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -655,21 +655,9 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 #if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
 static void __iomem *bgpio_map(struct platform_device *pdev,
-			       const char *name,
-			       resource_size_t sane_sz)
+			       const char *name)
 {
-	struct resource *r;
-	resource_size_t sz;
-
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!r)
-		return NULL;
-
-	sz = resource_size(r);
-	if (sz != sane_sz)
-		return IOMEM_ERR_PTR(-EINVAL);
-
-	return devm_ioremap_resource(&pdev->dev, r);
+	return devm_platform_ioremap_resource_byname(pdev, name);
 }
 
 #ifdef CONFIG_OF
@@ -742,23 +730,23 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 
 	sz = resource_size(r);
 
-	dat = bgpio_map(pdev, "dat", sz);
+	dat = bgpio_map(pdev, "dat");
 	if (IS_ERR(dat))
 		return PTR_ERR(dat);
 
-	set = bgpio_map(pdev, "set", sz);
+	set = bgpio_map(pdev, "set");
 	if (IS_ERR(set))
 		return PTR_ERR(set);
 
-	clr = bgpio_map(pdev, "clr", sz);
+	clr = bgpio_map(pdev, "clr");
 	if (IS_ERR(clr))
 		return PTR_ERR(clr);
 
-	dirout = bgpio_map(pdev, "dirout", sz);
+	dirout = bgpio_map(pdev, "dirout");
 	if (IS_ERR(dirout))
 		return PTR_ERR(dirout);
 
-	dirin = bgpio_map(pdev, "dirin", sz);
+	dirin = bgpio_map(pdev, "dirin");
 	if (IS_ERR(dirin))
 		return PTR_ERR(dirin);
 
-- 
1.9.1

