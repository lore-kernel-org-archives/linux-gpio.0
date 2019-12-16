Return-Path: <SRS0=Awkk=2G=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24BEC43603
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Dec 2019 09:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2851206D7
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Dec 2019 09:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4dtqBX2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLPJQ3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 Dec 2019 04:16:29 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36571 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfLPJQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 04:16:29 -0500
Received: by mail-lf1-f65.google.com with SMTP id n12so3669219lfe.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 01:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8b0OtjpPJJdyoVxLXyaGO1QKMzg69JkVTugQtXst8A=;
        b=u4dtqBX2aZX0qpf8a/6sjW8bBUkSYgIdfwdlxYVgEG58JxnwWeiMOtkXge+Ao/Duyn
         GSQjrIgs3SifbD+QdVIpKj173Pc4BpY/bXA9Fe1eKPxmOrjxFGqASPKBplx9cssmPk4t
         4o/KmNFa27gKO1/6QFQM8KB/hkuBw5EcoJEEYKBKhfzS9bWe2mJfROmGFKMcDWvepCKH
         IAYb54Btjv3HItoJFcLTvmoVnNC2paJKx6eOI6wwDCSqDqAfCOapjITM2tasXhCoBpPp
         a6IbA13SqhmWZbErIYxhMS0u3oVW9DCLqeluzg6UVKYF7q3RCy/XE1fba1cLQ3umyFgV
         yOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8b0OtjpPJJdyoVxLXyaGO1QKMzg69JkVTugQtXst8A=;
        b=DXDjXX7D0+/7TTAcLbLncNUr4grYKGfaRS6PIvOTtb7de/I1vT+GCDKJm1UGFDjcHj
         KlfSlsocNpzu0YWszEns5XMmfm0B9a85ePckZ4/uCUY5/Ckk4EarG6MvSlI7BbfKFjHg
         0ZrflNXXakAqldzBDa7WLCtK1LDy5Y3mx8B/3QywwTy12eW7mXVAskGufj2TcBZyZLd4
         JoVe4EM0jVPmgWEiY+LNP/lguz4TDs7SjI01sQnVwoyVyBF3nKi+0pcPy1MUi0WXb+nm
         MTfhIVB2VuIrl6skfgB/+RIJL1+QIxZIuQVqr+W8Fa90OTxTO2pbqsWXRLROmBhHiyKt
         r7SA==
X-Gm-Message-State: APjAAAV5xlo31fZ2wMdh456hBw13pYMKIKObClOhCYg9a1bjmcJTLuYy
        hfFkZdIO4gZt/5DpKgFQOud2N7+PFPs=
X-Google-Smtp-Source: APXvYqwOtW6WIxgoj3XvGio1IsmUL8YP4rLhOMoT2q4hvVAL4NZAWZR6NVYLnBypPckPSzkuvObsdg==
X-Received: by 2002:a19:cb46:: with SMTP id b67mr16431417lfg.40.1576487786745;
        Mon, 16 Dec 2019 01:16:26 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z7sm10083316lfa.81.2019.12.16.01.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 01:16:26 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiaotao Yin <Xiaotao.Yin@windriver.com>
Subject: [PATCH] gpio: thunderx: Fix up irqdomain push
Date:   Mon, 16 Dec 2019 10:16:23 +0100
Message-Id: <20191216091623.7766-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After registering the hierarchical irqdomain, the thunderX
driver proceeds to push the domain on top of all IRQs on the
chip, however the third parameter to irq_domain_push_irq()
needs to be a fwspec for the IRQ since this is whate the
gpiolib .alloc() callback expects. Fix it up.

Fixes: a7fc89f9d5fc ("gpio: thunderx: Switch to GPIOLIB_IRQCHIP")
Cc: Xiaotao Yin <Xiaotao.Yin@windriver.com>
Reported-by: Xiaotao Yin <Xiaotao.Yin@windriver.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-thunderx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index d08d86a22b1f..e885a6d08a25 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -524,9 +524,15 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 
 	/* Push on irq_data and the domain for each line. */
 	for (i = 0; i < ngpio; i++) {
-		err = irq_domain_push_irq(chip->irq.domain,
+		struct irq_fwspec fwspec;
+
+		fwspec.fwnode = of_node_to_fwnode(dev->of_node);
+		fwspec.param_count = 2;
+		fwspec.param[0] = i;
+		fwspec.param[1] = IRQ_TYPE_NONE;
+		err = irq_domain_push_irq(girq->domain,
 					  txgpio->msix_entries[i].vector,
-					  chip);
+					  &fwspec);
 		if (err < 0)
 			dev_err(dev, "irq_domain_push_irq: %d\n", err);
 	}
-- 
2.23.0

