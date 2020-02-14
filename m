Return-Path: <SRS0=1EQs=4C=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E66C3B1A1
	for <linux-gpio@archiver.kernel.org>; Fri, 14 Feb 2020 17:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB4BC20637
	for <linux-gpio@archiver.kernel.org>; Fri, 14 Feb 2020 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581700533;
	bh=JlZXVtgaL1rN68AVqhb8e94Gy+f/zbLWFdvc6qJQoe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=peiPsJUl2irwLNhCfhRIjryPeXLWHlA9gp0HAU6noxkMgGYOqp5N0roDxQP9bgBXV
	 H7cIc7PbcoRqfbjg2llcePGU/hJZC8bhxz8Oxltf0idrw16V+YDjF1vzbfhktzXmWg
	 WSwi2m2dHbcuPD5kU6+u1aVKbc5Vz4I/Rugq8dXg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391684AbgBNQMN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 14 Feb 2020 11:12:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:39506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391933AbgBNQMM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Feb 2020 11:12:12 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A1A3246AB;
        Fri, 14 Feb 2020 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581696732;
        bh=JlZXVtgaL1rN68AVqhb8e94Gy+f/zbLWFdvc6qJQoe8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qMnOZjVRznjLaVgRoJeLueXy6vLwTK99NZSKECZsMQgtgMpJx3EurDSzy7zi2LewB
         8AsrXQXUKMqihawfLBMt31zpQl9siBa5cToc6wjV4fBD8OYkTbBRzA6q4DTCxVlUBO
         hl6EiB5iK8rprw9/AQ3Q6kF2OZeveh0TCDTyGa2k=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 018/252] gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_irq_map/unmap()
Date:   Fri, 14 Feb 2020 11:07:53 -0500
Message-Id: <20200214161147.15842-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jia-Ju Bai <baijiaju1990@gmail.com>

[ Upstream commit e36eaf94be8f7bc4e686246eed3cf92d845e2ef8 ]

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/gpio/gpio-grgpio.c, 261:
	request_irq in grgpio_irq_map
drivers/gpio/gpio-grgpio.c, 255:
	_raw_spin_lock_irqsave in grgpio_irq_map

drivers/gpio/gpio-grgpio.c, 318:
	free_irq in grgpio_irq_unmap
drivers/gpio/gpio-grgpio.c, 299:
	_raw_spin_lock_irqsave in grgpio_irq_unmap

request_irq() and free_irq() can sleep at runtime.

To fix these bugs, request_irq() and free_irq() are called without
holding the spinlock.

These bugs are found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Link: https://lore.kernel.org/r/20191218132605.10594-1-baijiaju1990@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-grgpio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 60a1556c570a4..c1be299e5567b 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -258,17 +258,16 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 	lirq->irq = irq;
 	uirq = &priv->uirqs[lirq->index];
 	if (uirq->refcnt == 0) {
+		spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 		ret = request_irq(uirq->uirq, grgpio_irq_handler, 0,
 				  dev_name(priv->dev), priv);
 		if (ret) {
 			dev_err(priv->dev,
 				"Could not request underlying irq %d\n",
 				uirq->uirq);
-
-			spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
 			return ret;
 		}
+		spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
 	}
 	uirq->refcnt++;
 
@@ -314,8 +313,11 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 	if (index >= 0) {
 		uirq = &priv->uirqs[lirq->index];
 		uirq->refcnt--;
-		if (uirq->refcnt == 0)
+		if (uirq->refcnt == 0) {
+			spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 			free_irq(uirq->uirq, priv);
+			return;
+		}
 	}
 
 	spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-- 
2.20.1

