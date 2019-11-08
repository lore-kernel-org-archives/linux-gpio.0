Return-Path: <SRS0=igvf=ZA=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8A5FC6196
	for <linux-gpio@archiver.kernel.org>; Fri,  8 Nov 2019 11:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 899AD222C2
	for <linux-gpio@archiver.kernel.org>; Fri,  8 Nov 2019 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573213122;
	bh=b8J4MxCR33d36gDUpia1X9tMWmKY6k0ovzSnBa1tW+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=IXq/SsYqewtE/GOXXIX5UcaRwBXfZpU7Z1LGmz+eQs2fDXeieBdcz32u7hpEloacX
	 FWrZd4PJBiWGdRK4/tUL5RzFJopN6JFCvU+ACTjZoznGug+pGjzeFRh1Ji5NNxsP7m
	 ltj8TjR402fcJIqiW1Td0VwBiKngk9AzSkrk5I4s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732780AbfKHLil (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:38:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:51584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732752AbfKHLij (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Nov 2019 06:38:39 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0834420869;
        Fri,  8 Nov 2019 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213118;
        bh=b8J4MxCR33d36gDUpia1X9tMWmKY6k0ovzSnBa1tW+E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z20l18vjnP1kOM49pgk7tZQfaK5ADDSl+8yIU6Gxg4/lsYzGdENXUDOGCBE5cK/0J
         FBI7P4xkf91V1q21MRj2oXr156rcX88k2PTqvHvZJXhV+1537r1FT9ZTwQJtt+c1t9
         LdLa/0pv5ZYkHbk9c3RGzHt10DvDjp1jBAB3ph7M=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 038/205] pinctrl: ingenic: Probe driver at subsys_initcall
Date:   Fri,  8 Nov 2019 06:35:05 -0500
Message-Id: <20191108113752.12502-38-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit 556a36a71ed80e17ade49225b58513ea3c9e4558 ]

Using postcore_initcall() makes the driver try to initialize way too
early.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 628817c40e3bb..a5accffbc8c91 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -847,4 +847,4 @@ static int __init ingenic_pinctrl_drv_register(void)
 {
 	return platform_driver_register(&ingenic_pinctrl_driver);
 }
-postcore_initcall(ingenic_pinctrl_drv_register);
+subsys_initcall(ingenic_pinctrl_drv_register);
-- 
2.20.1

