Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5681DC7EE2F
	for <linux-gpio@archiver.kernel.org>; Wed, 31 May 2023 13:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236764AbjEaNqx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 May 2023 09:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236683AbjEaNqN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 09:46:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CEC1FD6;
        Wed, 31 May 2023 06:43:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 48D7C637AA;
        Wed, 31 May 2023 13:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD343C433D2;
        Wed, 31 May 2023 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685540608;
        bh=e7tWL6wTRy34K2JWIZX6jDI78R1WuLGLxqA768ehrHA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HDlj7JXTtZwy2OyXghhA/JEsjH/O1S13O1oqyN0H7dtNcrGei28wJCxzT/KO3ghtQ
         /2vWkxATTH4iCaYJewf1IBwoT7OWT0mfVRz0GXTKpQZ/YqTBl7RuphsBnbjf/JXjNy
         q24mtT2OsVs610QEhI5xi/zQYzH4WCyIpQT0vkQ4akh40i5jOty3QiNHQuoK8NAVsB
         yk+mfFftHtkOHa+jQSMYVsq/l4k1SGe5k/KOzO+Ze8HdfPNug1baIlCoL+3RoAs1fz
         HPJPCfTJkqg6g5MU2Bp3JCB3ZUmlB0DBywOPLbEscavCE6t6fMh4bHYyQ1ZR3h11iq
         6uFs/ne62SKww==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Milo Spadacini <milo.spadacini@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sasha Levin <sashal@kernel.org>, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/24] tools: gpio: fix debounce_period_us output of lsgpio
Date:   Wed, 31 May 2023 09:43:01 -0400
Message-Id: <20230531134320.3384102-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134320.3384102-1-sashal@kernel.org>
References: <20230531134320.3384102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Milo Spadacini <milo.spadacini@gmail.com>

[ Upstream commit eb4b8eca1bad98f4b8574558a74f041f9acb5a54 ]

Fix incorrect output that could occur when more attributes are used and
GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.

Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/gpio/lsgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index c61d061247e17..52a0be45410c9 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -94,7 +94,7 @@ static void print_attributes(struct gpio_v2_line_info *info)
 	for (i = 0; i < info->num_attrs; i++) {
 		if (info->attrs[i].id == GPIO_V2_LINE_ATTR_ID_DEBOUNCE)
 			fprintf(stdout, ", debounce_period=%dusec",
-				info->attrs[0].debounce_period_us);
+				info->attrs[i].debounce_period_us);
 	}
 }
 
-- 
2.39.2

