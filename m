Return-Path: <SRS0=WqBB=ZO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09E8C432C3
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 06:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF34720409
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Nov 2019 06:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574404018;
	bh=5PXEbBylnnhAkoiwvd/bOD51FRWOQedouhurN35w0Hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Op9oEpk4FdpSzo31PO4MzhqZ1gQyOTbjvmLyZqBL/Umh+JmAJ6iYdM6EQwqR1X0ck
	 BcqWxA/EwnpHpbpHd5ZIVvkqx352deQCf8ckc1P6dv+XcVaB6POHn2+RD9U7Z1Jizi
	 URLB7zksYCE+/sU2XWtd3Gd+DT0jxdKzAypDp0/Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbfKVFui (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Nov 2019 00:50:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:55286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727804AbfKVFui (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Nov 2019 00:50:38 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB61B2071C;
        Fri, 22 Nov 2019 05:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574401837;
        bh=5PXEbBylnnhAkoiwvd/bOD51FRWOQedouhurN35w0Hc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SthQBrfiOcHXiyisTuX3ZoE8CR2BqRKJ4NBlYHi+BwJcW/o6rs9jf1C2CF88QEAo8
         f6O1PWHy9mZZiSot5c1WNCrEl4Bgk+ot2r0QdlJOdd7EJu/fvegQrbI4wmw++wQSLn
         mBBcUx99eD9xJvSWnTci29Py2po1uHjWdbTYHskI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 078/219] gpio: raspberrypi-exp: decrease refcount on firmware dt node
Date:   Fri, 22 Nov 2019 00:46:50 -0500
Message-Id: <20191122054911.1750-71-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

[ Upstream commit 85af74c474b21940e88483fd48f6094145c89d97 ]

We're getting a reference RPi's firmware node in order to be able to
communicate with it's driver. We should decrease the reference count on
the dt node after being done with it.

Fixes: a98d90e7d588 ("gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox service")
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-raspberrypi-exp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index d6d36d537e373..b77ea16ffa031 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -206,6 +206,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
 	}
 
 	fw = rpi_firmware_get(fw_node);
+	of_node_put(fw_node);
 	if (!fw)
 		return -EPROBE_DEFER;
 
-- 
2.20.1

