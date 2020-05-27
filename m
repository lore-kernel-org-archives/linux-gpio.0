Return-Path: <SRS0=LgQb=7J=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D88AC433DF
	for <linux-gpio@archiver.kernel.org>; Wed, 27 May 2020 14:10:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D3B5207D3
	for <linux-gpio@archiver.kernel.org>; Wed, 27 May 2020 14:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHlj7LdS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgE0OKE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 27 May 2020 10:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgE0OKD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 10:10:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEBEC08C5C2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 07:10:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z13so19413187ljn.7
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 07:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U6Aq753fSWkcPpm1lYT5i7o7P3imqMnz5CDV1j1IMmA=;
        b=pHlj7LdSVCwnTJDiLsVCpTqvxw+XGKbSW8iGWV1AK4K8cgOxM5G6b7b0NrbsFvMObq
         Hr3LNEelIN4phEllVTITojvVKbbTFjJGAQ9ic96QOxXhxt+Di3jL+GlHWLDPX58wrggS
         8vkN6IXZKc3I28hKyJziC/RKXBPeBSGP0hupcob4KQ3MKl69ePCMaWDOFuCpoGQxbrei
         1FNBvC85Rmcfize5BKo7JwgTFzIj7xE1PvOmnsDeA/KAhsrNMwySO49Rg69V1gn+BccD
         zLQKMm5XdrpVtkPu+soaEdnqI36zFB/Ezd38sTa7hunZzTsatO6/xmLn04nzebsErhd0
         w7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U6Aq753fSWkcPpm1lYT5i7o7P3imqMnz5CDV1j1IMmA=;
        b=dNrhSQpBhL/wW4ShLvmyPIKCUDT+rdPXgu4HLLjUdx5qbL+Ly/l31itjWXblJw7gTn
         8NNVaKlO4LfNwmDcmiEF730iALmSHjy8521dI+QivFaUUTycy6dmaWuNikXTt4lMe7bj
         0JQ7HvYJGbDZmHyb+iBRARMGZiIXSFNPlHaRxtBhv26MyWG7sIbt5111ezP/aK69P/la
         2y5JTI4hwWFRhI2vYKyYA2hveLvq9EvAFGEptSgPFYcsx/TB0+x4ky5/ll2YrP9fES2f
         v/+Yqr1RdyISMLY3QL1aYvsfvFFtxnkCYxXHkADSJblyfPoKbjxrsuIrcjoK7G5NEdqK
         82XA==
X-Gm-Message-State: AOAM533c9bxuzvSTVQezXJG43Qu5jy1/DIM3iDTU+9O1/mQgH6lSkFO1
        7DVploUuCJo/uVtGc3BUGVnF94FqfJc=
X-Google-Smtp-Source: ABdhPJz0hJ46/D9Hi3/qtyf9Yhnt3YMVhSBHkDCyzA2c+urgaMwIPn+2to3o9n5ncmG6s13Ym/yzew==
X-Received: by 2002:a2e:b524:: with SMTP id z4mr3305899ljm.48.1590588600757;
        Wed, 27 May 2020 07:10:00 -0700 (PDT)
Received: from localhost.localdomain (c-8cdb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.219.140])
        by smtp.gmail.com with ESMTPSA id w25sm833568lfn.42.2020.05.27.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 07:10:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org
Subject: [PATCH] gpio: fix locking open drain IRQ lines
Date:   Wed, 27 May 2020 16:07:58 +0200
Message-Id: <20200527140758.162280-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We provided the right semantics on open drain lines being
by definition output but incidentally the irq set up function
would only allow IRQs on lines that were "not output".

Fix the semantics to allow output open drain lines to be used
for IRQs.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Russell King <linux@armlinux.org.uk>
Cc: stable@vger.kernel.org
Fixes: 256efaea1fdc ("gpiolib: fix up emulated open drain outputs")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b4b5792fe2ff..edd74ff31cea 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4220,7 +4220,9 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset)
 		}
 	}
 
-	if (test_bit(FLAG_IS_OUT, &desc->flags)) {
+	/* To be valid for IRQ the line needs to be input or open drain */
+	if (test_bit(FLAG_IS_OUT, &desc->flags) &&
+	    !test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		chip_err(gc,
 			 "%s: tried to flag a GPIO set as output for IRQ\n",
 			 __func__);
-- 
2.25.4

