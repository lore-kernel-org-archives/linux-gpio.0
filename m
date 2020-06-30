Return-Path: <SRS0=pBZy=AL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5E1C433E0
	for <linux-gpio@archiver.kernel.org>; Tue, 30 Jun 2020 13:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A6AD206C0
	for <linux-gpio@archiver.kernel.org>; Tue, 30 Jun 2020 13:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDOoBlOc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388193AbgF3NeB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 30 Jun 2020 09:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388172AbgF3Nd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:56 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA7DC08C5DF
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r12so20129717wrj.13
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ed8H2szCHThwNArdetIOxqgfOUbWnaN816hTwHMkdbs=;
        b=LDOoBlOcdm5PNPBUjDlyXJMjFJoTSFbyLvEFfk2MSUYrchcD9tFEd0BZXO9SrTscoH
         eA/vQ6GAXtpXOUjef9fBRpi0CJvg8ckXzJXuEz09kLvdNWWqgqE1w+ordm7P5ftaJrHD
         a0mfbn07kQRfTm7ePl7W2Q76YlUgaNcjabzztkrqEVWKBpwBuKDZpQ0ySSp7J3V99l2j
         FbzF3FM16U5AgKguFp3o6KOWA4WGAskO5BV+OW1Ott1uuGymscZa01d/Fo66kvqK+Cnd
         3apKWuCiSlV53s2VaJ5tXUiP4AQaF9MKFHjnCVFdG0y9wiripankDZXkPRCESZJ47G42
         r9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ed8H2szCHThwNArdetIOxqgfOUbWnaN816hTwHMkdbs=;
        b=n2msv9OjbtVD0SVZrxtjLwzhSWOhQOn3ljmojgsFopGv9eCTmn3vua1SWlC1XPMpnz
         ra4TmvzSJQd7QXQZgRyeMORwQ028FDPNYw3fps95lXHvXwHn1ddUumItLvyHre/9p7Ys
         ShrutsI3gXmM0XxgZs4jXY6JZkgpSJvhfENAOGTeSt3ApbZturnC9wjiicIgXZDat/1x
         O20jQjqAlH5ZIXIv875X9/sdCbMDN0zvGV0fgTHVoHkSD9nepVCmuEUK5mMsG3k3Y5XG
         R/l7xwflmCbNMeolGGEA9au587syOYeqfepbQfflXal5rCYliutPbRT551IANmoiAATi
         u00A==
X-Gm-Message-State: AOAM531/tFx/wkhJYo1lSLuggxpq/Wx1pRtQcJ52i4A7Pxl2Jin+RYPG
        hrwO8o4h5g6+fTtYuEeGe9698g==
X-Google-Smtp-Source: ABdhPJyIWL/M5/vUrifTjtGsuJrzIOD9u8Z0C8MXhKYor95Ji0p/tqz8z4BB9eU13U9cbdzmuzJG4g==
X-Received: by 2002:a05:6000:1006:: with SMTP id a6mr20905598wrx.332.1593524035124;
        Tue, 30 Jun 2020 06:33:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 06/10] gpio: gpio-syscon: Fix formatting issues which confuse kerneldoc
Date:   Tue, 30 Jun 2020 14:33:41 +0100
Message-Id: <20200630133345.2232932-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kerneldoc expects struct properties to be documented using the syntax
'@.*: ', but no '@' has been provided in 'struct syscon_gpio_data's
header.  Add them to stop confusing kerneldoc.

Fixes the following W=1 warnings:

 drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'compatible' not described in 'syscon_gpio_data'
 drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'flags' not described in 'syscon_gpio_data'
 drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'bit_count' not described in 'syscon_gpio_data'
 drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'dat_bit_offset' not described in 'syscon_gpio_data'
 drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'dir_bit_offset' not described in 'syscon_gpio_data'
 drivers/gpio/gpio-syscon.c:48: warning: Function parameter or member 'set' not described in 'syscon_gpio_data'

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-syscon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 31f332074d7d5..fdd3d497b5350 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -24,16 +24,16 @@
 
 /**
  * struct syscon_gpio_data - Configuration for the device.
- * compatible:		SYSCON driver compatible string.
- * flags:		Set of GPIO_SYSCON_FEAT_ flags:
+ * @compatible:		SYSCON driver compatible string.
+ * @flags:		Set of GPIO_SYSCON_FEAT_ flags:
  *			GPIO_SYSCON_FEAT_IN:	GPIOs supports input,
  *			GPIO_SYSCON_FEAT_OUT:	GPIOs supports output,
  *			GPIO_SYSCON_FEAT_DIR:	GPIOs supports switch direction.
- * bit_count:		Number of bits used as GPIOs.
- * dat_bit_offset:	Offset (in bits) to the first GPIO bit.
- * dir_bit_offset:	Optional offset (in bits) to the first bit to switch
+ * @bit_count:		Number of bits used as GPIOs.
+ * @dat_bit_offset:	Offset (in bits) to the first GPIO bit.
+ * @dir_bit_offset:	Optional offset (in bits) to the first bit to switch
  *			GPIO direction (Used with GPIO_SYSCON_FEAT_DIR flag).
- * set:		HW specific callback to assigns output value
+ * @set:		HW specific callback to assigns output value
  *			for signal "offset"
  */
 
-- 
2.25.1

