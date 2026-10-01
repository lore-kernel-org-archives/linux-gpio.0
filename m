Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8B2D238F;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878456; cv=none; b=WLP9kcmoJv8HPiDi8S3k5d0fhQtyzMm4KAyNyYWUZB73vQBB3/bvbo7P5ZQw+bl4I1R8ei3VwQl9H9Pyr4QMBwY0xUavwU00N/Y6acrtkISibaV9LrMXjQyVcxxrg0zUqM8LUiuD6WFy8H6Wt4+uOsSLn7PbqiojibJUYTyO4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878456; c=relaxed/simple;
	bh=pCpCsjlEb7SWdfsRcbX5NY4Fz9Kw79uaF/cDRMQQJxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRscEXg2R5RBLsr0vWka6P43q0y/SVAq7jS3iocPfOwvkDdTf6xfElj8XuvEWNVzBWBpkZgM/+bQDDWCTbgRAM+6ypBYnlrdHWrIgwuqyvWRjCoHAt0z0Q/uuYx8jWs9VFugf1/59JMjEwPX84in4Fso1Nr2BfmHtYZCbjtdjJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpWsRadY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpWsRadY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72641C4AF13;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790878455;
	bh=pCpCsjlEb7SWdfsRcbX5NY4Fz9Kw79uaF/cDRMQQJxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EpWsRadYbCoABHYAWRAnccZTBHPkgeRSc8nylzF9Lt9xef3o8aw8d8L7u8mLDrVcR
	 RgnDPMt8IdwL6WjYaRQuHClju0Ha+He0CmIj46RJl+FniJJ9nzfKpAiT5X1jGVMuCY
	 uQGCabwjHlF5BNiwAbH8/ucYKjfe8Ax+hWpviV6jmqHib8SQQ5IcL4t+G2bD3NQxhV
	 +zUgAfws3gyOgZnYd1J+XJuUdZXMN7WCl3ZBwI27CKVEGFV1F4aeBdmqXobDWLRNUD
	 u9lkaO3BnGHqVxiDpXCiKIkdHsWx49lqcZUapoo9n75qJwuvAaw+NrB9QEIRz3hkc/
	 bu/5KC8NE+BNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F85CCA5FDD;
	Thu,  1 Oct 2026 18:14:15 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 02:13:20 +0800
Subject: [PATCH RFC v2 2/4] gpio: loongson-64bit: Generalize interrupt
 controller initialization
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-loongsongpio-v2-2-6e3eb150a4ef@gmail.com>
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
In-Reply-To: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=Tohr21ylADcfkrkF/OTrTcdHRhHyD3gjMBKgED9OAJ8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqvqL0s15bLZqKoRmh5W0QAUZFwcthxdjx8vSPc
 mWGNNkfDfaJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCar6i9AAKCRCwMePKe/7Z
 bvFfD/0Xy9Xb8li5bgIRWcBUsZYZLfaBTwM4pRbDxQUPsMye4nJ+XAEBa0IGZaheyUvGkNqXdjT
 QbwotB6D9cI4iDt2moVSlagziju+qlSyoogBM5YuCtSSxdKONXLMus98PcA7LmVyjIkJNFN/Vqe
 3WjQV83QaZ2Pqag25k7CngeNtFLFo1lgEyqlGWme0P1f/IV3/FoQ/EM4MTxyv1eO6Y6cbxWjKsg
 S5lrVmyUb0fAh3DnzZ+w7aZpO9P2NOhmO3njj71CKBwjkurLLDldHrkxwkfhEd1CeZv0BQdbVMu
 4Ir26b0UVjQm9XdK5FjVLVu7wxH0tr3UZn2EQIMrceopYCe/tu1RBleRjXwmzCkUGY1dtdDlmuM
 Sn8AsDeFplLariB9kimuS7JqHCyGi0WUtm5a5lcpzp5N43V3wsgI3oiGteBOaqqW3o7AHH/LXKD
 5+kE6caqe6fm0euYFlUSNYZ1huzQDqvmDOE+3IgGFb431JuqwlhzfFI9LT9kmoQrH/ejSb8k8TF
 OelZqmBX8VgA0OBLOTqMDwe2YEY7cYUojGhqbKJiKgGzKo6uBKEf9i0aSuPN/MMobjMM+HXZ/Fa
 z+Q4SIUVP+1xficKeA0G6sdW5YLrEYwQ51gsma9QRtiXhxhYOBNbE7KmeMNcE0V/nqLLM5Witjj
 PZ/xWBPXlimESPQ==
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


