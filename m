Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074770;
	b=bQiUVNHPE7Z4wdFXBvtCOvAxKq3i1vflxmdOxo/Stt6J6IkKs6iRl2GHtQerkgTfponv
	 uS5ww4DIetTidAalWHd/vr39DBN9mjmZtOBZW/3Bj6g5c7pzSKTgIpypo0Ot4dHjBXx2+
	 2h3m4KrAFjtpkwT/bWQ+GEswLo9vk3IWrqOm6xtUV2MGe/tGAxILZ6fIBJ+InBYB351JX
	 Db0rcyGhPC2G2KMV1HtN/RbUS8hjpnuxgckeFY/zXSYC9f6VZdIWlmuXg01dJnUBqC67d
	 DVPomnpYaJ6E2dz0VGNXgEmoKwJ0bV95e34EzbFPOaKtoRxMrN58pVO8nMPWXcrpxVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074770;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	b=iwDc8Wn/SGeAiHskiV27EEGNVLFFI+SXEzvZZPFRNa9ETdh6fbbMJcn7UFcGop8qgSz3
	 M0/ByoeBfnEgbGWL7D1wmQ+QMNJM+Mchz6HH0tJVRS4L30GBIk+awUeTospqcccWywHjw
	 VQXugDKggXZBhswFoGwqVBAtKkHxt+gMd6161+Msd3vUoWD5wL/kshg5/s10VDoj1d0mD
	 iLogfhxKeHyfKHG7FgvCLenOCjEthn3WWtPEkm72yW7727cjSKy8jlYBKW0Ac0tJTbWq8
	 p3C4eFWuyOYGkL9gAaPPt21JNwvem6YZu2jQIKNBux0wIAfyTilx9t29yBj9Pc3hK/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmzCePRj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93FC606A330;
	Tue, 27 Oct 2026 04:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmzCePRj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074769;
	b=YbLuh9ej0lXPKcyWw7JSGJL4OehSsrabGFC3AX/U9HB8vVrxVP3zKvZIHMXzQIk7OEK/
	 CZhnU2dP1Zv+ffAig0zIX8aPomSYNz7qepDFGT3cDZd8bc0A/0voe8/kB2IwAqHOnHPbQ
	 Qn42Yzlzrj5hxJzaiRCwHSE6sjBKG9PRVGwZ+8z7lTpDpryZpJE6yf5RASa7OOyFf9lkU
	 8FbRC2y1/8/FKrNgU81M1WLH2T22ZZ9F49V1dhiT2eXiCwHzYFWWHeU0VcyBLShGSzBa6
	 y6jx9XfF/DohKhhH0WL9R3LQakRoqMj/f1wjWEndxe8ElwQdP946CtJtmsLlR1GMVdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074769;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	b=SBK4BNPDumVmrLceKcpr/WZ+lqHMSTYIyH737tcHkvV9/J37OWX32OIXwQ6XJ4JSMP0C
	 k3HgA8MprVC2rGqAuf+bsWpgkpPw0TJ8+d0xnzveIGNAOsr3X3g0A/rwy3NCjRmj/XKIa
	 NIcea+jcv+6apXm+1QyxUpv8sZ8uvQdxcf69aoO0PjMcVPGfpXxHauRwqK0kEwCt/QjYT
	 If112LOUwMfT3c6KnNjZA7cm9bwc1vmEL3F43IeJZHHBddj/e8UdZui1Zu5eT6dPaAeH+
	 ihMacBdythHXcQZjv05vlaob69xdsPky7QAmvXcsHjNWpLTnpUb+26QujywnIzmqbIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FA7C1F031E3;
	Tue, 27 Oct 2026 04:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074769;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mmzCePRjI1l/FbMkMTiH5Z+r1MMtqlbNDUSQxXhrQJWJ6xYW20U+JvJPA+cEgM3pQ
	 chjs+twt8UyTDBP8YaMH/iuldn9+BQGgHp5Ls0erXs1s6vUg6yDq93gS8sdZbLNKQ3
	 YO0u3ZuoDubSCZBipVZRnaFDiDjWt/uYw6ikbnAFVESuRfliCBtPN6cEhkJBm5fOXH
	 HRF+k+eFC07KvuMDp5ciz0+wjneh3uIfaJk6fJbC3ZCP1bHxry2SlTijszvdOO5VgS
	 gfgKhnZfCe4ehe6/ez7agpuanCpBQqPS0ab38rveLv+QNkZmrVYzmy5CUz7ZPe44RM
	 eCr/OOSgvx5OQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CD17F44F90;
	Tue, 27 Oct 2026 04:19:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:52 +0800
Subject: [PATCH v12 05/11] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
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
Message-Id: <20261027-cv75-gpio-v12-5-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=1433;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=qYs7A+3O2UQ/LJH+vQzcUZYSnBtFDMS1HvLlsWFL8rw=;
 b=LCQSP6WnR1giOzxLIuYaQjlYElWLho+wkQztdqCAvr+KCtXFCrh6GFHzcCXMCFUxcj62tuxm8
 RzbPYqHbZQoBIwKjpRYK1PSjF3gjgk2oqYL39wEAsDUARFUY0nqvd+P
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


