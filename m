Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7824DD3B5
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353722; cv=none; b=DpJe5SHDFY0k3b4z7w1Cr28mv7hMdeWu7mjkJTl0NLaWOeNjJVLjCNB3s/o6K1E7lCv/yVb8GYe1pPEISRd1bCV/77pTKr8prEqTTOPxcXOV1ZP5iTFkAWJ7dFBoT5gl6O9gErAe99RC5gvfYc7OGHAtyEB3M3G/0NpL5eR9wL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353722; c=relaxed/simple;
	bh=8rr8dYt/3a1FA+QN1E33Cw0mO2RImaG8Ix4hfMblkb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hod1xe1GyxB66gKAcJh3znoxGFztF8fQg04yUzC+XJdjm0lyOEfyQUbyUdGab3X3f+SAKBjD1ccDW8Fau6/t/AQv0zdFBc02YS1rMsYZcxqAtpPi14x5nmNR4Eii3xOsBbpAciH0DxfEm2OKfVFMQPkR5uzIpc9GOYaWdTcwkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqGcl1QC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqGcl1QC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B19C8C2BCFF;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790353721;
	bh=8rr8dYt/3a1FA+QN1E33Cw0mO2RImaG8Ix4hfMblkb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VqGcl1QCxrs7Z4B1z4NODBwQ0PEwsY+vEU0wDnFn9piObsamm1FPUrxBuyNghe5dg
	 uu7Gam1IlSQHD0vDJhV2rhtWlI9XhH6WdNEtcDSKKnA/Vathp+cO7BDRQ/7wOhlAul
	 ujnnRGekwRogrsgK1DT8OjAsAQrsuxw6L0ljQVwILLR/QflVlcP7PqaMKNlnD2DnYm
	 VFeWfVM+e2gb24kw7KZxYO1lNe3lpwaJaQzxjiAISHf6H9jg27Jfxmi0+n7TGW/uzY
	 fUT0yMst2GhvqXxJUqiga/HopRFuGFaWF1qw1Aq3PrYu/N+DnQHT91Q4gDMS9qkSkP
	 ob2GxpwCf/YVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E30C9832A;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Sat, 26 Sep 2026 00:28:39 +0800
Subject: [PATCH RFC 4/4] gpio: loongson-64bit: remove gpio_to_irq() handler
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-loongsongpio-v1-4-71de7ebebb76@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
In-Reply-To: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=W64Yr5Y6JRiJS6gsohCOqXzHcL4FV02v4CADLe9eUYw=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqtqE31+y73utt1RR+u4G/jTovwN0gukxy8KX1L
 4IATsRa0bOJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCarahNwAKCRCwMePKe/7Z
 bj72D/0ZMKPFFt4USb+lLGOW7SzKpcGvwjvdrErCmMUkp2Yrixb8y9M5OWwoR0PguX55Mtc3vgY
 CNGxJXrmiYVRIrfmgcq8+jvnEnJRvycOYQ7VogWYVdwipW7mib6ZknpiPVXt9eDLHCnwy035t7/
 z8qoqzAlqmS994+wR/4szCP+Y2HHRNE2+m5xX46f/wL5kVxmJfrTWJsj/EwEAPcCSz67H8mAyGA
 L+44YnyPfUKmAbwVajhbHCUZMucCtXM2lkGNlr7QX9Zmy8jj/SB/mtKzbSvK45kHGsa6pbuB69O
 SCkM3orYxNwr91gxfe2b6X7TKn0MaxPjgkYhmONa+9P7sCy0XxVtPOM/S9L4V8P2BAnAGrqvW0c
 Qt2tjxSyqhMA0DcAHq4Z9PN9BdpArqxnrGRXZjCl9o8VjFrbfhyI6h+iWqodS4BPXw+d/enZaqk
 3kHVHZ0EPeTom+nRVc/KxD0DxAesL7S6iqDmFwUbhd0uDIbur0Pf4pwsJhAvb2HPN5sdl1v6CYi
 1w9lBY+TatdRyoXlnglgcB7yqpcOp8w90toO4Y0DhqRateQB9AwjksTQUX/s7AT6anSn+KF4z3N
 2WzvCCJmBwTCCoY8raVtW5eXPmMahpD0ZZaMC59mCDrIFQRkguMsCLOGoIm9CxahSHWkbP89dOX
 JHFY3Me1QTXID7A==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

From: Miao Wang <shankerwangmiao@gmail.com>

As pointed out in the previous commit, gpio_to_irq() should not be used
because it should not be used to manipulate the registers to enable
interrupts.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/gpio/gpio-loongson-64bit.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 6e5687dcb413c247fb0d76c596c445f94efccd01..d24eb52ef13ce386437c422e290f1b0ea4e6672b 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -141,24 +141,6 @@ static int loongson_gpio_set(struct gpio_chip *chip, unsigned int pin, int value
 	return 0;
 }
 
-static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	unsigned int u;
-	struct platform_device *pdev = to_platform_device(chip->parent);
-	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
-
-	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
-		/* Get the register index from offset then multiply by bytes per register */
-		u = readl(lgpio->reg_base + lgpio->chip_data->inten_offset + (offset / 32) * 4);
-		u |= BIT(offset % 32);
-		writel(u, lgpio->reg_base + lgpio->chip_data->inten_offset + (offset / 32) * 4);
-	} else {
-		writeb(1, lgpio->reg_base + lgpio->chip_data->inten_offset + offset);
-	}
-
-	return platform_get_irq(pdev, offset);
-}
-
 static void loongson_gpio_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
@@ -945,8 +927,6 @@ static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio
 			dev_warn(&pdev->dev, "no parent IRQs ha been found, GPIO IRQs will not be available\n");
 			gpio_irq_chip_set_chip(&lgpio->chip.gc.irq, NULL);
 		}
-	} else if (lgpio->chip_data->inten_offset) {
-		lgpio->chip.gc.to_irq = loongson_gpio_to_irq;
 	}
 
 	return devm_gpiochip_add_data(&pdev->dev, &lgpio->chip.gc, lgpio);

-- 
2.55.0


