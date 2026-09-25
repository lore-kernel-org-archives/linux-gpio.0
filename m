Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93874DD3C4
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353721; cv=none; b=WteBM68Ary9w6qHgcHVp8A3GSZ3D9dCSrYlBRrRmCbiijt+CVEufDz5lsyLo9hKo9oE9PyeB8v7RpQ1GFBNYe5LADdmLxFJS00DWGR9kgXocs0eqwUxn106u8Q3PIjubqOgw/eXJeqgDUljngyIdpnmKT4aOJNrKbK84wezApyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353721; c=relaxed/simple;
	bh=pCpCsjlEb7SWdfsRcbX5NY4Fz9Kw79uaF/cDRMQQJxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUamxwUYAXUDPEbU7YeMBSyBvCDERlmCWQ+5F86zfOFaVTUAHBJ9AV0N4yVAsQ72OhyjF9puLeF2gau0kQh4y8PKf3dJ3+9K+HiQrdyS3e/4RcVDkXi1jioPtTCA4yAu5Q8VzKqaIScvYqweZ33Nya1LmjvqB9cn2Y2pdvYFf7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnieM5ji; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnieM5ji"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E57AC2BCF7;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790353721;
	bh=pCpCsjlEb7SWdfsRcbX5NY4Fz9Kw79uaF/cDRMQQJxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TnieM5jiIZd7+EJEOspdFW/Trq3zgRJPePl7dC98HRloyAZir6rFOYBM/Tx3C5nQy
	 BrpfdbF8BHu58w02UY63Zq67WdCuvu6N0IAbeNx6X8AQT/CO/C0KiJ9QcEJ/JUKOty
	 MJBCe1cR0J7qlAJ8g/f9nnb77wZWckCjWcf716/Nh1jmlTkWUx+hUg6tBMzOrmnzZ6
	 JeTAOhfaUmTCticiwewp1/kpwGANjQAJKTc3fwa4ZhnTaG9LXzLU39MDZrzr+NGGJt
	 Q9bM1h67Uf/rmhEZh/q+XGHbkEH8qujQAowQuLd+PRj/yhdsCNNe0JQBr+UFhytRpb
	 dE2Y1j1axY1Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F534C9830E;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Sat, 26 Sep 2026 00:28:37 +0800
Subject: [PATCH RFC 2/4] gpio: loongson-64bit: Generalize interrupt
 controller initialization
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-loongsongpio-v1-2-71de7ebebb76@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
In-Reply-To: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=Tohr21ylADcfkrkF/OTrTcdHRhHyD3gjMBKgED9OAJ8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqtqE2LVncI4UIjwrQc2is/303XqOoH1jrOUd/a
 1xvaR9SNmuJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCarahNgAKCRCwMePKe/7Z
 bhS8EAClxl1YtGJEwVoq2aRUyrOhusJmM/nfJGpQfyjWurA4Apu+v+9hJza3VsYePu2GBq7zS7s
 CoIIcyh2fBFwhzYuC56CohSCBo8p/qV8LbYWPi3wpS0jY/qgcxAOAeA6p9B3vgWCbOxFIeP7aNT
 3r6EdBX97YRdcIn0930w9xN5VKPFEs1CQ5J5vjCJxfiVx1i3t9mOZZ3y0RwXslYN8lJ1hKCWpmK
 vxcZhTBRUPkUwIsjbfGhZyx7PjkYyLVwC1BbRP+eipASTrYgHAfnp625cwt1q1K730Iqqx1fIG3
 SotD47bBmY8eev/b2qv1PE0iGl/1+esz2rtZplNarEavuO2vbEZLcHXS5e10x5BFJTcdbTn/qxm
 rzKeNRKYjSrPvCWvcIjRQW9LuSJ+dbRR8HzYqa7z4PmpEROns4WAR3/97yTs6CGIgYfz8ZAdDIY
 lAPr4ZhZOpWroouP761sj0bvzNILkjpp+6N6ZZQKUmD7LKIOZH95xqbY2ptGsOYKSIG18cBhPZ4
 8NSRFNO8AnkQztWaOeKpElPSprPRCr45s1zD24MFTbBnRcqD3cgLJnyu4vr5WHCbQZ6LJv68jFg
 wUkWB0o3Lsyv9ErSvZGc7xHJ5aGd9ac8IJaIB+mI7Z9lTZWqJAn1NLq13jHoVCJOttjNksXh7WO
 rFs0V9xBTps27+w==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

This patch turns the interrupt controller initialization function into
a handler in struct loongson_gpio_chip_data, which will be called by
loongson_gpio_init(), so that we can add support for different types
of interrupt controllers.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/gpio/gpio-loongson-64bit.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 64eb9f46ce31cc289f236af44311ff39f05de3b0..a1b23ba21f64162af2096131520d1dac27798983 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -39,6 +39,8 @@ struct loongson_gpio_chip_data {
 	unsigned int		intr_num;
 	irq_flow_handler_t	irq_handler;
 	const struct irq_chip	*girqchip;
+	int			(*irq_init)(struct platform_device *pdev,
+					    struct loongson_gpio_chip *lgpio);
 };
 
 struct loongson_gpio_chip {
@@ -286,11 +288,6 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
 		writeb(0x1, lgpio->reg_base + data->intclr_offset + i);
 	}
 
-	if (chip->irq.num_parents == 0) {
-		dev_warn(&pdev->dev, "no parent IRQs have been found, GPIO IRQs will not be available\n");
-		gpio_irq_chip_set_chip(&chip->irq, NULL);
-	}
-
 	return 0;
 }
 
@@ -329,9 +326,13 @@ static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio
 	lgpio->chip.gc.label = lgpio->chip_data->label;
 	lgpio->chip.gc.can_sleep = false;
 	if (lgpio->chip_data->girqchip) {
-		ret = loongson_gpio_init_irqchip(pdev, lgpio);
+		ret = lgpio->chip_data->irq_init(pdev, lgpio);
 		if (ret)
 			return dev_err_probe(&pdev->dev, ret, "failed to initialize irqchip\n");
+		if (lgpio->chip.gc.irq.num_parents == 0) {
+			dev_warn(&pdev->dev, "no parent IRQs ha been found, GPIO IRQs will not be available\n");
+			gpio_irq_chip_set_chip(&lgpio->chip.gc.irq, NULL);
+		}
 	} else if (lgpio->chip_data->inten_offset) {
 		lgpio->chip.gc.to_irq = loongson_gpio_to_irq;
 	}
@@ -387,6 +388,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k0300_data = {
 	.intr_num = 7,
 	.irq_handler = loongson_gpio_ls2k0300_irq_handler,
 	.girqchip = &loongson_gpio_ls2k0300_irqchip,
+	.irq_init = loongson_gpio_init_irqchip,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k0500_data0 = {
@@ -430,6 +432,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1 = {
 	.intr_num = 8,
 	.irq_handler = loongson_gpio_ls2k0300_irq_handler,
 	.girqchip = &loongson_gpio_ls2k0300_irqchip,
+	.irq_init = loongson_gpio_init_irqchip,
 };
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2 = {
@@ -473,6 +476,7 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data0 = {
 	.intr_num = 5,
 	.irq_handler = loongson_gpio_ls2k0300_irq_handler,
 	.girqchip = &loongson_gpio_ls2k0300_irqchip,
+	.irq_init = loongson_gpio_init_irqchip,
 };
 
 /* LS7A2000 ACPI GPIO */

-- 
2.55.0


