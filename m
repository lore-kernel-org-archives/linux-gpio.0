Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058515237BA;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878456; cv=none; b=m5S97gUpnT4OZ2Wos1A49sI/ml6Ltc5YSWKYwHu0loeeUl+/pOrT+TxYzBmKjeMRe8rs78Ej1I98wvl8A6Xk3jvOo1Ah8nI5+vdZZUV8cAqhfnmkiTlnxL+1xpPrxCIZDE53K39mkopPLwPpqdeeae1htEgCaG689EzsFIULzpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878456; c=relaxed/simple;
	bh=xRGS1R/x5lr5u+VcB+YRBhuGiHMLobGWevYhnnTBqcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9QgasubI2xQEx864nZfKNMfQxcpJnPYQCOINHPmgP1BIQfcdtrzKIx9nWBHYRedpdj8AT3gbDKKasqCijZnKj2dX/GcV0iw6UAPQ1Bkk2NDZ9e0yCgL63CHygN6x31YsUeif8VcwPyD4JZv8hi56UgulP8byENBx3hQekBOyt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP854wo1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP854wo1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6097AC2BCC7;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790878455;
	bh=xRGS1R/x5lr5u+VcB+YRBhuGiHMLobGWevYhnnTBqcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gP854wo1DYn4LQv8paI28Ws+I9jHTM8Bs6vMyEFD3OHlCB55/lW/r7vyAuSmA7j18
	 7NXH3ZsPOgnopRHLYhq8+k64mNWbjzo88WoNP2P/Olz87WPXMoAKFxrcNWmZ0c5Db0
	 JZb1j7HASIlI8i9/Xp/K5nOJQkkQHnyucxVDdN2tS/oxp+DzoOtR9LjPK5HstPe9vx
	 ZUF5XWR+EFQglwr/OB6ncbS7L29HXw7hqKI1AwxU0uc/Zxq8FnY4Mf2A3DY1ij9wd6
	 /gE2KQNIY9acSkwhPgW8G6VqKzeZawGAVKfBbbgNYzN/P2EJZtAcTmC/RJj8n6+V2U
	 0DPSqN0F6thBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F09ECA5FD4;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 02:13:19 +0800
Subject: [PATCH RFC v2 1/4] gpio: loongson-64bit: Support for irq
 controller on 2k2000 and 7a2000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-loongsongpio-v2-1-6e3eb150a4ef@gmail.com>
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
In-Reply-To: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=0dvWli5pD9Wt6rYfKXYlL6cMt1f/NYDSJ3mm6lafASQ=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqvqL0wNlkqV4e/wBx8oiIrWav6XtAL+Duo6KT/
 EI4ROWEBAiJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCar6i9AAKCRCwMePKe/7Z
 bso7D/0Zq7vk5aPsaKDC3IQFCY/J77QEpqxntsE6kZ/jnr+cY/CcRy1myMLSytTDKDtSxB84Bo3
 4MmSrcYCmvnIdboAX+M1VCJOQhoQvYIWN8omaeWmT+W+o67O8MSoDBZI2oPSYJPPpFHH4eOH8Do
 jZ4W5TJ1XNfwka4RITIYlYPRYFG9Dgu4Um1STk8bPiqlkOGScAS997V0vVGv6Rx1nlojbgex5qK
 dG3rASLjjkg8G0RhH5DVIt7QxutF3M7rg0DeA85qBTfoPDVGuIRblcW6j1aX8hiE54gwkNunhkc
 te5nwokSaDkGYIxptYntNZUQSTdJMETtjTQnCtJczkkwRYnYzzkZtCukWJMPrHpiR1NLKr4X7RE
 WsaAk2x/QGN4WP6tJl2iQdqB13Qcl/sq9OsRu09kpjM2qxGoxTJLfGMDSxmN+Kk+wcOf3c7CQ54
 6IemmFf5V+V8pgMLqUG2T31JuAsLtPmt2dFUk5g2eicuq9R7Mx9+3+re1TM0ZZ9wr30ONPqejrI
 awhG5DoR4H94moSamvgYd2WZaWr6CA2xxIeZWjFboN4QaeY/tOFFSAjbokeNCaAYw10+b8G7HyG
 AjzZG9rbAIynvmfT3m5bYUnHNLxaThvVwdXE6lTROK0b0ljLAJLL/nYu+XAYcN3ODd32kA1bSpb
 h5givrDvuMsn5dw==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

According to the User Manual, the GPIO controllers on 2K2000 and 7A2000
include irq controllers, which are similar to those on 2K0300, except
for the support for edge-triggered interrupts on both edges.

This patch makes the requirement for intdual register optional and
links the irq controller to the GPIO controller for 2K2000 and 7A2000.

To make the change compatiable with possible existing firmware code for
2K2000 and 7A2000, the initialization of the irq controller will not
fail when not given enough firmware IRQs. Instead, it will only
initialize the irq controller with the available firmware IRQs.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/gpio/gpio-loongson-64bit.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344d2db0a1cf52dc52c3f58aabef49c..64eb9f46ce31cc289f236af44311ff39f05de3b0 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -183,6 +183,8 @@ static int loongson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	u8 pol = 0, edge = 0, dual = 0;
 
 	if ((type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH) {
+		if (!lgpio->chip_data->intdual_offset)
+			return -EINVAL;
 		edge = 1;
 		dual = 1;
 		irq_set_handler_locked(data, handle_edge_irq);
@@ -210,7 +212,8 @@ static int loongson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
 	writeb(pol, lgpio->reg_base + lgpio->chip_data->intpol_offset + hwirq);
 	writeb(edge, lgpio->reg_base + lgpio->chip_data->intedge_offset + hwirq);
-	writeb(dual, lgpio->reg_base + lgpio->chip_data->intdual_offset + hwirq);
+	if (lgpio->chip_data->intdual_offset)
+		writeb(dual, lgpio->reg_base + lgpio->chip_data->intdual_offset + hwirq);
 
 	return 0;
 }
@@ -260,7 +263,7 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
 	chip->irq.parent_handler_data = lgpio;
 	gpio_irq_chip_set_chip(&chip->irq, data->girqchip);
 
-	chip->irq.num_parents = data->intr_num;
+	chip->irq.num_parents = 0;
 	chip->irq.parents = devm_kcalloc(&pdev->dev, data->intr_num,
 					 sizeof(*chip->irq.parents), GFP_KERNEL);
 	if (!chip->irq.parents)
@@ -269,11 +272,13 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
 	for (i = 0; i < data->intr_num; i++) {
 		int ret;
 
-		ret = platform_get_irq(pdev, i);
+		ret = platform_get_irq_optional(pdev, i);
+		if (ret == -ENXIO)
+			continue;
 		if (ret < 0)
 			return dev_err_probe(&pdev->dev, ret,
 					     "failed to get IRQ %d\n", i);
-		chip->irq.parents[i] = ret;
+		chip->irq.parents[chip->irq.num_parents++] = ret;
 	}
 
 	for (i = 0; i < data->intr_num; i++) {
@@ -281,6 +286,11 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
 		writeb(0x1, lgpio->reg_base + data->intclr_offset + i);
 	}
 
+	if (chip->irq.num_parents == 0) {
+		dev_warn(&pdev->dev, "no parent IRQs have been found, GPIO IRQs will not be available\n");
+		gpio_irq_chip_set_chip(&chip->irq, NULL);
+	}
+
 	return 0;
 }
 
@@ -413,6 +423,13 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 	.in_offset = 0xa00,
 	.out_offset = 0x900,
 	.inten_offset = 0xb00,
+	.intpol_offset = 0xc00,
+	.intedge_offset = 0xd00,
+	.intclr_offset = 0xe00,
+	.intsts_offset = 0xf00,
+	.intr_num = 8,
+	.irq_handler = loongson_gpio_ls2k0300_irq_handler,
+	.girqchip = &loongson_gpio_ls2k0300_irqchip,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
@@ -449,6 +466,13 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
 	.in_offset = 0xa00,
 	.out_offset = 0x900,
 	.inten_offset = 0xb00,
+	.intpol_offset = 0xc00,
+	.intedge_offset = 0xd00,
+	.intclr_offset = 0xe00,
+	.intsts_offset = 0xf00,
+	.intr_num = 5,
+	.irq_handler = loongson_gpio_ls2k0300_irq_handler,
+	.girqchip = &loongson_gpio_ls2k0300_irqchip,
 };
 
 /* LS7A2000 ACPI GPIO */

-- 
2.55.0


