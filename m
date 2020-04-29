Return-Path: <SRS0=NTAR=6N=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9005C83000
	for <linux-gpio@archiver.kernel.org>; Wed, 29 Apr 2020 00:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9341C20737
	for <linux-gpio@archiver.kernel.org>; Wed, 29 Apr 2020 00:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BA2K2kqq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgD2AYC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 28 Apr 2020 20:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2AYC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 20:24:02 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1BCDC03C1AC
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:24:00 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so146883pgl.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 17:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmncuCu+aKZhegSzTt7aF9ZhKop8EJqfLP9aJCLGrf4=;
        b=BA2K2kqqewuaVRpteNeRs5dZSrjrzRp1kWnQ0GjL5CAtO8roNP3gMiRhYo799seH4o
         TdW8F03C3/bt5Vbj520wGNlDyEVWyZpsCMREl+NazKoJUhi6wvyhQnVlA5ZKJ1hRRZ5D
         mKk2eulKJ7muzlbGc1BOpt1wi6VGpDgo3b8Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmncuCu+aKZhegSzTt7aF9ZhKop8EJqfLP9aJCLGrf4=;
        b=fteF6qFPedM2yNpZPyq50J7WmBcgn841mP6RcK1f9D6iCWhGF1vMxPDu8UHdiYomlu
         hKQjRaMHFRyBdLf73xXwTSmT59OM92KX5+vDTP4kD6F9V6YQHm0xCLqQmvElIwA2d43+
         V9ATJIbUMDQrMJEIJR+VucnGdWNCMI7koye7DaaQWrhKLyXgahapCwxeR4/ka8hht+1U
         rKoOG+El5HQKYDQvlFq6l4rM8ot8QvIUoKexZPbAf31KPDPHJfWMkNuvXI1taJUgrM+J
         mqf3mEjQM4BsKFZHPx801UOrfEEoaTt7M+vu1FBXFyEGRXrvombyOQMoaIBWJzczEcg+
         tYvw==
X-Gm-Message-State: AGi0Pub8IpnOBTqPT5L2ROrYtRx8MONahHTQfenR53jh6RYhKE2cn4ti
        zqeETikLwP8Vl09+126Gaei6PA==
X-Google-Smtp-Source: APiQypLM3czQW9EKrQcTgAQqT0/w5bYQiwPnPbqMlCzllO78rB6OL5shUwpeY3R9Ce2tt7QL1NQrsw==
X-Received: by 2002:a62:780b:: with SMTP id t11mr31963820pfc.196.1588119840119;
        Tue, 28 Apr 2020 17:24:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id g6sm3102818pjx.48.2020.04.28.17.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 17:23:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     linus.walleij@linaro.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: Document proper return value for gpio drivers
Date:   Tue, 28 Apr 2020 17:23:27 -0700
Message-Id: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The legacy defines GPIOF_DIR_XXX are only for consumers. Document the
proper ones.  Also: don't use "_XXX" since that's harder to find with
"git grep".  Just list both of the values.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/gpio/driver.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b8fc92c177eb..7b5f5681b7e4 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -267,9 +267,9 @@ struct gpio_irq_chip {
  * @free: optional hook for chip-specific deactivation, such as
  *	disabling module power and clock; may sleep
  * @get_direction: returns direction for signal "offset", 0=out, 1=in,
- *	(same as GPIOF_DIR_XXX), or negative error.
- *	It is recommended to always implement this function, even on
- *	input-only or output-only gpio chips.
+ *	(same as GPIO_LINE_DIRECTION_OUT / GPIO_LINE_DIRECTION_IN),
+ *	or negative error. It is recommended to always implement this
+ *	function, even on input-only or output-only gpio chips.
  * @direction_input: configures signal "offset" as input, or returns error
  *	This can be omitted on input-only or output-only gpio chips.
  * @direction_output: configures signal "offset" as output, or returns error
-- 
2.26.2.303.gf8c07b1a785-goog

