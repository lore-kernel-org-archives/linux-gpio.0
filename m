Return-Path: <SRS0=WqBB=ZO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E39C432C0
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 13:27:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BCF920706
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 13:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMc0cdHn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfKVN1o (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Nov 2019 08:27:44 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42459 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVN1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:27:44 -0500
Received: by mail-lj1-f193.google.com with SMTP id n5so7341176ljc.9
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tdqdc6GlLGKNFIVpHsNHNB/9gnpCM649CYJvlrBtXXU=;
        b=gMc0cdHnX/Yvn/AGWg04HeYarp0o5t4XKrnKA09KndSOlhYSGhzEv8K7FDHetoqirr
         kvXrg98JATd4kcwQhJskvtlUgKLFLu2LXwzIvad/RK64bAoZ6xvZqwLXLu/rflOhW8tv
         3lba/Z8WAA5j5uQOFQHysT5dEVIMg8AJMQddmtvBq2EnIo8Fd0k5whndvDPPcwxNFPn1
         WGyxrPK6Q0n0EbdJhb+vvi/sLCsKR35XBj9QNrMsUHh1VRdN9YbhbwjHiczWgibXHpWw
         n5G/RpKuupEjv455sLt9xAo4gPXfdWO8JZS+5AQXuKAMbMyQoRmMqJ8GjDvBBc823bxD
         te3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tdqdc6GlLGKNFIVpHsNHNB/9gnpCM649CYJvlrBtXXU=;
        b=uGlNeQn7y+XorsJxIiEZT+8S86xFGmOwUreJdAqWZOAZIURzmYuQjiCWj7sCQEJU8/
         qCzppuptlw7PS3CkCKl6mM0mz1UPddxpZwnrPr9dSlSFkjVRu94lVdR00z31Qqw5bv3T
         dR0gnk3FOz+rp7c4s1zdPKG6l/NUFY7IQo498svUEJZDhDifQEyZx13MJ9QveQTK31ks
         c83gEm42T9WDzGOqaqkFJcaCTITUeV0mkqj+khZYsxMIZDxzMazxKcvqxgxTl6eugfgn
         6OG8Nfq3O+ePtK6ZZnkSgnDqSMFfuqYdLAXVR+PRbL6KnSETSoba+lcPrEU0DVc/mCw5
         H2kw==
X-Gm-Message-State: APjAAAVBWpXOMPMfuD7CpGextxi3nhuAi9Y4A6nmyMumFUzImatCvGtq
        u5ZRdFbUkxObvgYuCn3xrDcJUUwZ9XU=
X-Google-Smtp-Source: APXvYqzLr8qUrTfYhkw3JyTo4MTPASkr39Qo8LHBvJMEAxPE1vos57CqlaF3oeK3mNqzYO1U5lfKlw==
X-Received: by 2002:a2e:9905:: with SMTP id v5mr12277652lji.213.1574429261649;
        Fri, 22 Nov 2019 05:27:41 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s23sm3035106ljm.20.2019.11.22.05.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 05:27:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Add TODO item for regmap helper
Date:   Fri, 22 Nov 2019 14:27:38 +0100
Message-Id: <20191122132738.8857-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a TODO item for a generic MMIO regmap helper.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/TODO | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 9c048f10c9ad..76f8c7ff18ff 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -80,6 +80,10 @@ Work items:
 - Look over and identify any remaining easily converted drivers and
   dry-code conversions to MMIO GPIO for maintainers to test
 
+- Expand the MMIO GPIO or write a new library for regmap-based I/O
+  helpers for GPIO drivers on regmap that simply use offsets
+  0..n in some register to drive GPIO lines
+
 - Expand the MMIO GPIO or write a new library for port-mapped I/O
   helpers (x86 inb()/outb()) and convert port-mapped I/O drivers to use
   this with dry-coding and sending to maintainers to test
-- 
2.23.0

