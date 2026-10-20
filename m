Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482883;
	b=gMXHtG0ZAKcgMEa19iYSU+c+5zEfoNscJfvGb8OhnzHG1ub7ynqVo+0qLFTz0bjl9Zrq
	 NpCbjt0ILjWzFqTxW8B6dLPcYNMroEWhHY7ZryUPVbDj2hU53t4I/FpP94oXdJhX0RwRf
	 x5piDDgxIX0NvGVmi5eN3bnCVMtOzB8fjPlwzxg6+vHKnF9+uJ6s9m9ZmIruT3e0G0Tj5
	 /LCi/0ZHb9t2ffM6fMOm2eMVZ/44Tzk95lPKR1sjRLT/Mfi27FL0Hik8wtxqzZep+egfQ
	 U3Zl4Y+afWfXibIkW1C6lQvng1J7Z3XbSPM7exMFHBEz49PVut9OTQPwoe30oynMb3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482883;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4DMmmgiZrVa4Xj5PbUjPLI06AwLE7Wp5L99KVGwOlz4=;
	b=yqBSpfemJjbKHVMSK5AbtQrwjcqcWsYTcUawMYuL5bLgAaV1QbuaxIkFAJpB+fgzi17p
	 xDdwiiAsgh4AdjBUEdyBNb9Kn7cDZqu+oiiuId0aq8p0dZdAI8J+mZ+HHHDEZUUKe0AMh
	 tqOO4+4PL4GLGO/5ncsxd4NGgKE+OjXSFemCrPImHlmMWOgBS0OfTNoHUb5CJLNDalz9B
	 iuSQIZ5aO3tyc2mWu9nN8r4Oh2aMWTJXoGG3QuQUmLySdSg2P0nXf8n9yQoOs+7EmrLkr
	 2HZSJXJBKHKa71USJePEB+0kYUYxumxxfJU9tEL7bVSJNvIF2bNnKvWv/8z7frRGRhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjujQ9Ba;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C5606A33B;
	Tue, 20 Oct 2026 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjujQ9Ba
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482883;
	b=bRkQBOuZzvK3k12M1sFF2bZsRStt28l205Hv2cVv1qWXX9+VwGH5qViDNXJwisGq8GYv
	 gFLdoCqse5knjBJr5L6NMnfnBkyp4cBgTGYmXzpX6SbBX8iVUGQzhTENCPpy2vuOVe/CY
	 OMOiMPo2SB+NzNPiCaCDjGv+4TqCJgoigKuLg3RILiXNdCWVLl9KmR988SmHLRWKoGiX2
	 IowiHQh46VPLPGmagn/Q00XMcMJmsLZ0op6z7GeFGY6Pb8AFm7GchtwlLcL5HTWrAoN3k
	 UOxlOTtHxKuUv+rqVlmR0//4Q56AV9L+KP2wPjkksmuO0PZpLQCO4jCP2HXRABK+1lg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482883;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4DMmmgiZrVa4Xj5PbUjPLI06AwLE7Wp5L99KVGwOlz4=;
	b=ed2B94EBbhqTWmxdgN7I5qorqTGJCi+yINvTNkgdLdFLMwthQDz1a5FYUG6T0jzOC1og
	 xHa3uDaVuvwjUIqJLprBgBYijEb2Vvl6tTFlPRr6xePfbIg0zuwt0Uu8oW0urX2fMpJ68
	 RPTrjuFYwYVGtkAycA3gzPtXHPJ6qgtwCbshfPYOP/2U7Y6pd53U2S9Y0eNi5HDbJoNKT
	 Q3pt4m3poN7eBuDNoB0n8sgPNkgwaKcvWxvUaLoii6h60HnXkpPr/OeqQNmeuimFcrXw0
	 Ez8VaXgz4rmdUU8jebeb2rNZv8eHnhM49tXfI1ETEHy3g2qcVyWlr05nM8l2TIXjgqg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FF131F000C9;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482883;
	bh=4DMmmgiZrVa4Xj5PbUjPLI06AwLE7Wp5L99KVGwOlz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KjujQ9BaiT1BcBdP06XMSohFeD0VG83kojco0QuUlrWznpp3+Ahd+lHePzaATvoqu
	 Lj7yc9LFPNKrEDbO1JaL+bbiPSrgUdqdP4O7ZIfbYYXOmGemmaW2i/RoJP2HtNEsWz
	 HgSX2TxRTZVHnK7TNVyTaxhw8i5TmWT9Av6ExUvYN/+o3Hx5mi5B+KMhwFpX9n8gvF
	 SUlplpC5Kn1FZOIO0LPlsF5s2nYSKIaO/Hzv/7VfGrUoQT/cN+7qYblbX/9UhSjlWb
	 JQvnBAtSl0Xw8kFQNT7fL3IyG6Mt+Hm1hkURXCWIkQuF0UumDH4Glv5l2lodzABAym
	 CorgtbPNDmI2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 91A3043097;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:09 +0800
Subject: [PATCH v11 5/9] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
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
Message-Id: <20261020-cv75-gpio-v11-5-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482878; l=1433;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=0jX+qJ6BGbwNDllgqQQmQY1W5XrnWVaUEvhufGvmBLY=;
 b=TzksYVlVn5FCrRKGh25dkB0Vs6B9jDWzkvuoCXjnuA1fMdeIxDwBRTcueJ7Ml27qHjo+1Jrz8
 X33sXaBjCj0CSgAjWZitCeMCrUx3iaaJsAsYDt3QCnZ+ytRV3iexDSu
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
index 5f0b845eb096..1937941745f4 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -168,9 +168,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
-	{
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
@@ -185,7 +183,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
 	regmap_read(pl061->regmap, GPIOIBE, &gpioibe);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */

-- 
2.34.1


