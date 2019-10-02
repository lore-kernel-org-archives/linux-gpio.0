Return-Path: <SRS0=5fb4=X3=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328F3C352AA
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Oct 2019 13:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0410D21920
	for <linux-gpio@archiver.kernel.org>; Wed,  2 Oct 2019 13:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQgrj5oX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfJBNEY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 2 Oct 2019 09:04:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40097 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfJBNEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 09:04:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id 7so17020938ljw.7
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=94UZux8KPaILdBQJrP512Ji6mDAWCdcE9WriiNOUKYQ=;
        b=OQgrj5oX1KnPSjzrrECkKGV0KYS358aQfWk9CAav+LQN7euqzzWD+Z51S7D/2slKYE
         jD/v3eI3hve95w3GG7ieAJX6CSmRt/21Oqqnox9UWOkcdMzznpPDuG3i5LdKOOiwCYVH
         +re2ipWmzZltVLJJmpTMOwvZis+bFZEKLMIT3463EhN2aA+HjP3vHqpiytOHejqH+H9V
         jIyiqamGwKpN7rZaS2jyQolWzqaieoMkIMcLViX1LLa7knfN1tZ3wlelJ6aw3uyWmbUt
         VHhwdfO3kkJziVoTTwgcvYf4WPnZo2QEan7h66ou7L02Dh1wC3vwTR12s1gxddNIQo3u
         Syag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=94UZux8KPaILdBQJrP512Ji6mDAWCdcE9WriiNOUKYQ=;
        b=pw2uvO5zJtKbldj/p2GLXQoWr84xVfFWtV9el6kKm+ap03VRbGIFRso00WkoFrUDqS
         VUHq6YLYDBj9OXxjcFmRJAc5R4P0mcsBCfq7FTA9ESAAkozvELATkVM7bHRGHfNi4LKE
         bjOSyZb+m0A8x9j7gaAeYqyTAOe+B4sH5fDYXVV05tKjHg/5SHZWHUZDBDCm/IqlSPJ7
         6teZfYnkb1Xai+ZttLocRAm+PTaM0gfkdW/3blfuhRnUJQmvzwBxPTaBE+dXgHYpnn0k
         JhQbU3cV7GXCJcc+fcQrN4tR/CIJb6BDosZ1ZpWtQs71BxmndflqVCa4b+hVBVTYFQsp
         bPmg==
X-Gm-Message-State: APjAAAWI4VqQMWtQVopbI5TwdPRhPPP8GN9XwZRHKHFDEcreS2YaNVvy
        9bC0TTpo8/t/CDtdmk46TWhL0KRMxoJv/Q==
X-Google-Smtp-Source: APXvYqx92sfmYSI1Mv4ov/+jIOaS8Z2MAhaqAZ3AcMLnkkOZiMGkFhVqhZYFfEaTr8u5bsYtqoOS+w==
X-Received: by 2002:a2e:904c:: with SMTP id n12mr2480357ljg.139.1570021462137;
        Wed, 02 Oct 2019 06:04:22 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id c26sm5730268ljj.45.2019.10.02.06.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 06:04:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pramod Kumar <pramodku@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v2] pinctrl: bcm-iproc: Use SPDX header
Date:   Wed,  2 Oct 2019 15:02:17 +0200
Message-Id: <20191002130217.4491-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This convert the BCM IPROC driver to use the SPDX header
for indicating GPL v2.0 only licensing.

Cc: Pramod Kumar <pramodku@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Don't merge the two comment blocks. Broadcom
  don't like it.
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 6f7d3a2f2e97..61352cc6c0d3 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -1,14 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2014-2017 Broadcom
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 /*
-- 
2.21.0

