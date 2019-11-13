Return-Path: <SRS0=m41j=ZF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDABC43331
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Nov 2019 02:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24E69222CA
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Nov 2019 02:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573611057;
	bh=Tc0bizS36rmC3FiUcdlL/HBwy58q2eHM3k8vAr3PYBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rzh4uEqelyQrR2qkpI8Id1SP7k6blJmJxMF2QolshXJ09vIa9jyBcCfUIStBTgdMy
	 NJO1JF7ab3uy/rjFJ4U5llvqNo8r7+yGZsnUasLdyXDtfFtldOlg9M83YZiwsLAdfp
	 7oiH4uJjLVErlP5lsiD+99p93W7sERgUDFMb5ooQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbfKMB7F (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 12 Nov 2019 20:59:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:53280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730182AbfKMB7E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 20:59:04 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDDC82053B;
        Wed, 13 Nov 2019 01:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610343;
        bh=Tc0bizS36rmC3FiUcdlL/HBwy58q2eHM3k8vAr3PYBE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C9IiVKGo3hdXR94J18MQy700QYQm423XgA7O/59adklsja0XEKnaGhdv7WpY5iQd2
         FHA0QVu8Cb5+mvBH6ILBtIfQwyptZLlMlVThaRbg017CfiYREfmDj7PY0sX2akXpu2
         Sbn/1LJKwWgSFTjXSIFYj3Bpn5AZtri01DxII72s=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 096/115] gpio: syscon: Fix possible NULL ptr usage
Date:   Tue, 12 Nov 2019 20:56:03 -0500
Message-Id: <20191113015622.11592-96-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015622.11592-1-sashal@kernel.org>
References: <20191113015622.11592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marek Vasut <marex@denx.de>

[ Upstream commit 70728c29465bc4bfa7a8c14304771eab77e923c7 ]

The priv->data->set can be NULL while flags contains GPIO_SYSCON_FEAT_OUT
and chip->set is valid pointer. This happens in case the controller uses
the default GPIO setter. Always use chip->set to access the setter to avoid
possible NULL pointer dereferencing.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-syscon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 537cec7583fca..cf88a0bfe99ea 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -122,7 +122,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 				   BIT(offs % SYSCON_REG_BITS));
 	}
 
-	priv->data->set(chip, offset, val);
+	chip->set(chip, offset, val);
 
 	return 0;
 }
-- 
2.20.1

