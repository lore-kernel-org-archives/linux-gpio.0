Return-Path: <SRS0=sH+f=YL=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36675CA9EA0
	for <linux-gpio@archiver.kernel.org>; Fri, 18 Oct 2019 22:13:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02083222C2
	for <linux-gpio@archiver.kernel.org>; Fri, 18 Oct 2019 22:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571436830;
	bh=/tDzpcVlYPUykGvZzZFMA0ytYIsAYipqOHOn2ds+2O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=P8yGsTvrFkA7ADuV7j0Dm4f9gwFF+C6doiI1LedwlWPShwCfikcMnWIGGXm0qePkz
	 rfPcyjJOXPM1biBTX4lPBKVXRijrdFwYsn31m4RkoTtCqFJpBny/kw9IOa7PzyrvUM
	 /9ZeUQH8T6BOqh2tdmnFI3jl8Oi1Isw5V+LqhdaA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403845AbfJRWNl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 18 Oct 2019 18:13:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389221AbfJRWJq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Oct 2019 18:09:46 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D9BAD22474;
        Fri, 18 Oct 2019 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571436585;
        bh=/tDzpcVlYPUykGvZzZFMA0ytYIsAYipqOHOn2ds+2O4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pFHBFobVg0uoCj9+/VX5o8ZWZARumiN993iT/1HLlhABtlAm1zL8gB1sgPYx3jyi5
         drZbMtqlGhFhRmDtCyuVvbNd+qCIN+bE8asCfnnkTmUWU9nDs4Vnj4IeOIdz/mBhAm
         e0hdzMrHZ9JGCS/VKPzw9NHZfJzpBGJl/ygrHypE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 14/29] gpio: max77620: Use correct unit for debounce times
Date:   Fri, 18 Oct 2019 18:09:05 -0400
Message-Id: <20191018220920.10545-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220920.10545-1-sashal@kernel.org>
References: <20191018220920.10545-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit fffa6af94894126994a7600c6f6f09b892e89fa9 ]

The gpiod_set_debounce() function takes the debounce time in
microseconds. Adjust the switch/case values in the MAX77620 GPIO to use
the correct unit.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Link: https://lore.kernel.org/r/20191002122825.3948322-1-thierry.reding@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index b46b436cb97fe..4fe0be5aa2945 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -167,13 +167,13 @@ static int max77620_gpio_set_debounce(struct gpio_chip *gc,
 	case 0:
 		val = MAX77620_CNFG_GPIO_DBNC_None;
 		break;
-	case 1 ... 8:
+	case 1000 ... 8000:
 		val = MAX77620_CNFG_GPIO_DBNC_8ms;
 		break;
-	case 9 ... 16:
+	case 9000 ... 16000:
 		val = MAX77620_CNFG_GPIO_DBNC_16ms;
 		break;
-	case 17 ... 32:
+	case 17000 ... 32000:
 		val = MAX77620_CNFG_GPIO_DBNC_32ms;
 		break;
 	default:
-- 
2.20.1

