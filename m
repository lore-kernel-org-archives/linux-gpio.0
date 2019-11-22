Return-Path: <SRS0=WqBB=ZO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D89C43215
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 06:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0E8B20715
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 06:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574403204;
	bh=qiar1VaVBvPmu92UC81QiJx1uqOjg2HjOpaJCa2CW2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mUr0ng7CNzLql+QI378FWSRSCnfhRgFzI9EVc1J2XNW99zDYyIVCTVb/GS7QeZnsC
	 yaPp/Vzj4gQUWkpZG8vN/6zB7mz/eObAN6xfBiTlI6u0jTb9+gThIVBHwq7r6ceZQt
	 DqgoXFi9ETK2PwxDZx/NizSP+sHloFX1tGWX0HLc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbfKVGNX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Nov 2019 01:13:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:50588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729282AbfKVGNX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Nov 2019 01:13:23 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61A2E2070E;
        Fri, 22 Nov 2019 06:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574403203;
        bh=qiar1VaVBvPmu92UC81QiJx1uqOjg2HjOpaJCa2CW2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YbvKiV+S3Jc0hkCsifGqLj7xqNmWWuRIjwY0iScH0xvHxLKKzZfoalrxgJSCuIcpm
         O9Y23X13L03PmNQT6KiiBx7EG9dwrkczoHB8AGsM6iH3LrFPhSlOJrZIo0JrCezlJ8
         DiLx5eLGTPKXy/7a8mN3QsyGYTrHKESPtN3uJ9FM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 19/68] gpiolib: Fix return value of gpio_to_desc() stub if !GPIOLIB
Date:   Fri, 22 Nov 2019 01:12:12 -0500
Message-Id: <20191122061301.4947-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122061301.4947-1-sashal@kernel.org>
References: <20191122061301.4947-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit c5510b8dafce5f3f5a039c9b262ebcae0092c462 ]

If CONFIG_GPOILIB is not set, the stub of gpio_to_desc() should return
the same type of error as regular version: NULL.  All the callers
compare the return value of gpio_to_desc() against NULL, so returned
ERR_PTR would be treated as non-error case leading to dereferencing of
error value.

Fixes: 79a9becda894 ("gpiolib: export descriptor-based GPIO interface")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/gpio/consumer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fb0fde686cb1f..4a9838feb0866 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -398,7 +398,7 @@ static inline int gpiod_to_irq(const struct gpio_desc *desc)
 
 static inline struct gpio_desc *gpio_to_desc(unsigned gpio)
 {
-	return ERR_PTR(-EINVAL);
+	return NULL;
 }
 
 static inline int desc_to_gpio(const struct gpio_desc *desc)
-- 
2.20.1

