Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285168;
	b=Lhxn4WD/oDmnTqDdfoR2Wzq5CZQ9tGrvj3CwS4N6XZXNXH+b4G5oa5akDSWZIUYlFrGy
	 u6/eib+9CFXCXBgUzApRT9w2bB+zrSmzzowez/f8SpAq0QHvPvJGbLn0wkWpD1krzn1Ls
	 mDhm3WLBow/xzIN9hrRiAhGw6PabeYzpqQUIE7q9eUu76M/xuHnhXqFHiByfNl6yDhqA0
	 qFy8Ouu5cLhXbhg5RG8dLocB8RAbFAs2DezUxkNLSUvNHgtozeinSS/v0KLKMqlfcy6Wn
	 bCtIgpWD1y6wfLAnFLe2lhB0Bw7YFCpj+dKSdPwyYwZ+WqdlNQsbfqekaKWKSDYBq7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285168;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	b=Z7R3xTXy/urCb9iYaEHx946hx7Xy4k4NJADDBe0XRCi+GDJ1BEAPhzDXLH2q7fPW5FFE
	 P63BrDKFZ/gh9FCBXYogNsdQc2oYdoBo96BygTW+cjg3lZ6or1Z3gwesNx2ZHkwoCdAUa
	 oLEUWuJJni8EN/tfdP5ca7j8sXhQ6nJFqLFLasbDoVFb0cLPHQv9pmlpIWciK5gRaDuBw
	 5F3nTn/AHMD5fRiC9EnI2YMPWPbzNEcTb8ypqo7bsQHR8Za1MlNIuaQx4acWaaT3yOEWG
	 beeTHxeHAhOEqpQYQ0fDaFSOqLAW+E0gDmfmME0QU4Rzh9LKF196VQuAE40qTO6WQyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msAFi57o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679ED606A337;
	Tue, 10 Nov 2026 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msAFi57o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285167;
	b=T4Q62j9tK5oLy6c0rtM1Ac3P28Llrg99rDgUA25X5FgWEBLkpF5XkOWbOdOmMqZvDsqO
	 keA1Sq0o+OzBPBvA9Znuqj8vXyQZPFWfI7XC7nrROG1xztZLk1gEBqKE7dqfxxkkJtP5x
	 e2PXrZ3v97rISYMOievedKV55A8Rzb7E2p2rgHP7m4+7wLzWeKvcUwQ7ZmWaTcuEYz+Tv
	 HQ6/Ij875mgYEmMqkUYkSovX8YoHvEt4XWUxGjNRSIKH0kef/NugXcTA/gfyNXXUo60lm
	 HzaHeMnsM+s2KfYQ5W2n1cQKGw5vd4Ji98Fs5X3yaLP6ZW2WmmCRxREs5JJ8u8MJlOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285167;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	b=jRsl5Tv6WIKehMZKsddy6bIB43ct4vAvZJu5aqFwFZM1skzSh67T1KY/bp2kksHY+9Om
	 y5Y3Bsp7scHrg0csiv2I3KIxNWvPV0+zIcN4ysKePVHpYXZNIn86bwObpeCQEFpv7RjCL
	 z+WFf74a8HuDmn4SrCbokrwOfjgz6BTOzz2Pl0iQEM4DZ2BQfiMfk9sCr/Y8JZzGmclFM
	 VTrqmNbTw+36J58Onts+nge1lg47mEiYOo39mfc2RMMe/ly+J8d/V2D1u3R15w/tndMuo
	 iXkDgS9VkjuJy5hC6Zn22i2853vLm8jg6zR8YEnMJBmFWrawD7vwebYZsEkEiVR4Zfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F84D1F008A6;
	Tue, 10 Nov 2026 04:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285167;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=msAFi57orYXscguh8M1g9xLo81Iz5haqZhPxVvbcZtmmtrYtjciXYkyUl/Snq1R28
	 Dfn5xhgqmCFL0pNvKzAxXK3ELyaMev9rY32TRmGrdBNCpwiUEYUfkNUJb5DreXTsvR
	 /c1fPFiss9VLHVqwdaQQe2wIIk9ytwd2+PQZhUZrTxcAM0Wy2lbyRI1knMJHfNZU9+
	 0xZThLTfnV2gJNse+8b/O2eB+I42adlinurig2D70beSRWbFcUi6IrfO1DNGbuIIP4
	 vvyxnP6E+BxZZYzYoUX3QtR4XJkAoBUhYDB24TlKX+KeIvUYKrmdYLX3tEcfcSyqyL
	 jl7Maww6Jxlbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E92E648865;
	Tue, 10 Nov 2026 04:32:44 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:31 +0800
Subject: [PATCH v14 06/14] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
 IRQ_TYPE_EDGE_BOTH
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
Message-Id: <20261110-cv75-gpio-v14-6-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=1433;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=qYs7A+3O2UQ/LJH+vQzcUZYSnBtFDMS1HvLlsWFL8rw=;
 b=mPUKJptzyHzmtRBlg/yjomZAenI5V5fzlLLgiOvHQDcbuYHFaIIHvWtfgGssbuizAT9i2xt3p
 MdgNmy7c2pHC+dZVNEVP4iZalyI1gld+DQWtr8AhPUZZdcznDvRoDvJ
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Use the standard IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH helpers
instead of open-coded edge and level comparisons.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 781bef987339..e0ac8335bae4 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -167,9 +167,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
-	{
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
@@ -184,7 +182,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
 	regmap_read(pl061->regmap, GPIOIBE, &gpioibe);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */

-- 
2.34.1


