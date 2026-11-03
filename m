Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793681255;
	b=EaE99hTMMUZ8adJJkLbUWGvQBjJpDR36yYyRSo5dWCG1xigN9kkrTXkBgcDAvTMLb8O7
	 m7Gjn8OOgMRQevEYIGP6iHOdxzC+Sqra6/128fvhsV4eiagLlr9afU3XvndgQp560eTlS
	 lxS6oyo2PE0Mf4SbxQIJU9O5XhXHu2jTUSD1l6ruWOiYUAh31PvyXuCxkkMNLq1WijUvA
	 qGfO2HjgROjy2svm2AF8c8O5VJGOfggerrAI1TM5QtAu/cJbBb6ntnOMHN7E/FrYEu2sA
	 s8bNepiXZDbv51gP+NUIQXQYX+ujznq1sGNH74v6h72d7UGcOxFPXbPUDfWpw8qZupg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681255;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0+rSm+E1dOcLmFiVoLzR3TBiqneWOgmoux8nAhY2dl4=;
	b=4fYjRmL+b3Va1bZq7kT/gfhAb5c4rKtO5nVa/ykPaH6ouOauXTqpeMQOfMhQin9n8N9i
	 AjcTV52yLaAmq6qkEt+mQXLnZ8NnfCgTNmba164gVin0V4eyqjJM7JIFWEMrEQps8t8a3
	 /G9ViCUcK69zcATbLfe/nHhzYzht5PPJGNUFOp8yRYxaGU+IFksoVmQISI3qWucumOezq
	 owzCR9AD6GLqolN/2WqNnatlIH5XQbIVGpjZB5BuOkSS4upglzM86NPJvuGGFrWVr6tN1
	 sIm1SuiJYTH+jJl9Kr1krw3RBE6MMYbcBNO+hFpWrNbrmKdSXRsAwvCxmH+qT9L2qOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCV2PwhM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB1606A324
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aCV2PwhM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793681254;
	b=3hjgjkF9GZtU9l+3Kh/7ptySxAuA40RP8oi1EYyRx0B1+ErgvesTOlxouhJ1MbKT/4pB
	 iwkDLsNENZN1Vt64AGr6RTe/z5ziypZ7KqLTzFZv3KxAEwiU7gQK0LUnVoSSpfnN8BcBW
	 lghYShoRN8DYbPkzpmXNrv7xng03g97/2ASYMH9dEIAYCVFYry8oQ4MVms1/Yxl+t0/ic
	 0AlKIcWlgpEYfvY4BiwGIVmAreDaj8OPtus9bj9d4CEvbvLBnZCQM4/ez2ZezhE5z1o36
	 3tMlrW54PwSeir0rl94hI9oWAAHjl8M5Urc3gm+LmNkU27Ykht1IcL7bnFVOJiJKwiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793681254;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0+rSm+E1dOcLmFiVoLzR3TBiqneWOgmoux8nAhY2dl4=;
	b=hCWLrmUKlgj11TzXemmPYQpeV/eLy95bFM+Uj0XZoo7D6jmt4goPIh1zb2q2JpdKb5o5
	 vF7YLKFPeMJqLp7TaHMpJ1ZLvN8KGPB4ouo8jW1SlkUccyewSTtvZZhCQxYdTrkeR7YVy
	 MwX4IeR/qj7uBhA4fIuwCB4J97tvb6HbxBE+t8cDOH2LknVHN1DtoNuGPCwaoNBEk0yen
	 d3W/iGsKZznVUAlgdBGSlyj2foE8/dn6oZ5akhB86wO/XSSVZg8F5CAUtCaDNS10vCPSY
	 M8wJZ4Ey26gh6JgXmGYTHtF7KkJu2JKzMfRdsRz1IRcOldUFMImNV4Aag4BPCxqPyHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A5BB1F000C1;
	Tue,  3 Nov 2026 04:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793681254;
	bh=0+rSm+E1dOcLmFiVoLzR3TBiqneWOgmoux8nAhY2dl4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=aCV2PwhM63KxuM6qUwMQFQ2YhXTY0T8o33uaGrPpysX7Lb1jx6RPPLM6PB0kDOJE3
	 CqPtl4RzECwv607K89L5gArTFM4Yk/M245a38JnPQGiIG63YpFhZA7zTrBiNNmx/o+
	 weaE64wS5mwsk+XVuZgqkabRzjHcn6S1Z3j8Y887VJHz0eLuexJW5mlWyyqEuPrM66
	 QINkVCC6o0unHLp4Q7mNsvssZFBVVj7pKuN+CVNNlePLide3g/AWo2pFOLz4GecTZ9
	 P+eiN1dve3kuuryxTXSQSy8QCG5sTRezpnSFpViuQxroY3XNPxBszV6mA8Ld+FAs+P
	 ZelvuBHBrD5iw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF00C467A4;
	Tue,  3 Nov 2026 04:47:33 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 03 Nov 2026 12:47:17 +0800
Subject: [PATCH] gpio: regmap: free the irqchip if adding the irq domain
 fails
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>
X-B4-Tracking: v=1; b=H4sIAFRn6WoC/yXMQQ6CMBBA0auQWTNJi2DUqxAXpZ2WAYU6FWNCu
 DtFl2/x/wqJhCnBrVhB6MOJ5ylDlwXY3kyBkF02VKo6a61OGCLPKBSeJiLLy/Yc8UFmRHVtvHM
 X72pvIedRyPP3t27vf6elG8i+jx9s2w7js8X4fAAAAA==
X-Change-ID: 20261103-gpio-regmap-irqchip-leak-095fdd8fd4fc
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-gpio@vger.kernel.org, Long Zhao <zl020895@163.com>, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793681252; l=1350;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=Ps5e/qP45YCSpKvvs/e6pcBfQwAXRSNPUSMOfnRO6O4=;
 b=RIt6MuHFlBF6UlBNw/AyAdNEzdopsxmq+/uqBkgFQHRj+GPJ2T76bvbz3iUiiJYNQ5mjwEfVR
 EWkVPec8AHIBvSCHpPgkQ+chXP3SCcKMhISBI3SZe+Rn6OYtSf0Vxme
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

gpio_regmap_register() creates a regmap irqchip and then calls
gpiochip_irqchip_add_domain(). If that call fails, the error path
only removes the gpiochip, so the irqchip and its domain leak.

Free the irqchip there when this function allocated it. An external
irq domain is not affected: irq_chip_data stays NULL and the caller
owns that domain.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Cc: Michael Walle <mwalle@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-regmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 51b4d69b8740..7689357e6077 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -418,6 +418,11 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 err_remove_gpiochip:
 	gpiochip_remove(chip);
+
+#ifdef CONFIG_REGMAP_IRQ
+	if (gpio->irq_chip_data)
+		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
+#endif
 err_free_bitmap_output:
 	bitmap_free(gpio->fixed_direction_output);
 err_free_bitmap_dirmask:

---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20261103-gpio-regmap-irqchip-leak-095fdd8fd4fc

Best regards,
--  
Long Zhao <longzhao@ambarella.com>


