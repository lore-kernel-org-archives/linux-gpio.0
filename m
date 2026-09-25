Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AAB4DE706
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353722; cv=none; b=pBNb3zrGtCl4zZUInmTzmoX0czPtjOI9itbOfyBCFllpv+XOlkgrkHb09bUQagKnS1KrYdHDZCFfqg0EbeOGk6llisVK1kCtKsvTQyzTNefmwqwK4NYhuDPrdzP1AJUoPEu6Z1S+A/++MJ+btBvssfaxPlBBApxfwevVSQpw7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353722; c=relaxed/simple;
	bh=xRGS1R/x5lr5u+VcB+YRBhuGiHMLobGWevYhnnTBqcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lchj7+0VOY6IYE435KwWKLsipGtnybbT4VzWi9iCZ2QqhXGeJ/d2UONQyq9q5ipsYwcXlg1eiSrsvtoV3NSHvcmMzO3lj1JTfGfeu0Dsr0LQy/VQx7ZmIE/2IIWR7US3bt8wqwNUWCyVdpNkxyQEvlekGA6VtVm6E9u7u5wW6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fc9dwHCd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fc9dwHCd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F10CC2BCB8;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790353721;
	bh=xRGS1R/x5lr5u+VcB+YRBhuGiHMLobGWevYhnnTBqcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fc9dwHCdXnN1KzT9lB+NjsK/YUtMum6qwAozpYDbykyorAl+DcqknU+z3stWBNmXc
	 +1xMy+D5dfCZo5//NU0je/e6xHTpNfc9q++DifxZ5wa96X5MEhvKVVvPJulGdonA2D
	 Wn3BoanSpwSR2bdZDMSPcxIjio3Xb8d+yIDVL3KUSYOp39RRmO5YO2Z2b4+boSPRUC
	 +hQPJ+23LirerBMVFVd8FJj0ouAZEHa/GYx+fHLJmUqrcIRxJiD8fmAmgeAQ8lvVfA
	 UDytZqlrTJTM4JP+8SZVtneQFJNTz0GQAFtU4t66YiYsy2ATOv0Bm/wSr4eb6eJB6c
	 1fsXVYRtr5r8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7061FC98328;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Sat, 26 Sep 2026 00:28:36 +0800
Subject: [PATCH RFC 1/4] gpio: loongson-64bit: Support for irq controller
 on 2k2000 and 7a2000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-loongsongpio-v1-1-71de7ebebb76@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
In-Reply-To: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=0dvWli5pD9Wt6rYfKXYlL6cMt1f/NYDSJ3mm6lafASQ=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqtqE2KCB+cOm8KkQiUcvPL8YnDBTIO6QiCvYAX
 Nrh8noINPOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCarahNgAKCRCwMePKe/7Z
 bl+5EACekDlBKVnIbtqxB5wlXpRp+M0EDx7ElWPl8iRmVdiwj6vX5WLKAq4b5sp6etYJIXL0/i9
 NXANPOIE548oBKde5SRQSTktP7TXEIW4iKNI3936iLwRct9OTiu8tjyj77rlrzdO1z3QzAqr4/X
 D0cM9AL9rU4sb1spC/Mubvz3CPwIqNQa+BZf8Uc24WCW6fw9UCuzL2ofNaKlp7Uex2jFR4Ew1DD
 8H0PQDl7sbLb2YcuXA2sMBvearV85gGconEqmqnOZW7yufa1yvSOdFWS01BUY82eUvOBPbWe2MV
 O8kpiw6LSpyHaX2o1indetPJnHqEQoF/tAfX/emPJeLFMYdg6Nri+qP2ygBGxNCQKDIqBSEq91U
 ClWbtTpLz1L6YKJ5C3h8YKu8xS+0hsrNem5jfyJ5ZOAS/CKyVtOzomQ7gS1rzCskLPAsSkEQl2i
 A2KkD0QUMnL9bjm9o3nAkI42qt9OAE/st0IB/uxv8J5MvNd5CBgpfpcjxOK9pT5JBQ7zWk9r9mN
 0sjcwGjlvUEkJdjF+BiCjkurAndeFOLVT10uTYGBy3/XdM4f6tcyUsaMN+5KoBay+KoTzrIrIt5
 2xIDEJ2XhI0NyLCVOZCvU6N9aP9fBv9uXjr8W0Tlbs8dCtZXdwSdNq+pNr7jySakc8IS1s9dzR3
 zfXW+8lcuo24t4Q==
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


