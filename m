Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987757;
	b=zoDRY6tMATJ32c1wYJPEAJ1TUGjn/hW25YD93V3s3r2aoktqZgOWQZKhgvQ6JpYnfZRe
	 ZlwM/kEs+6rKbQPrgbk3XrMHEJ7LFayqHgr8ujXqBFcp1KoP7YJC3fsUddtbmckh9K9w9
	 JAoc7Za94qJoXTjwKtibm7dkJZAWwNQtQ1/GQynUEUYSt0oUBUosoppaY4fSmyk5jCmgQ
	 W+O3b5KknzB6Nn1jmPiF4e/m5DXjYqPgz4MKng/Fdm8KUCHXONOz96AFv8uZ3S28hXqHx
	 yqmeQKgeA4jdgqcYORs1qAxm+T1yBI0hxHCkS1iCY6hwQ7hTcmkTvid0qdJCxNYtNFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987757;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	b=YPTDmXFnTmbax11gapusKFgV6zCg1Ny5gUkf3B09v1VzvXSo+hfAQDHRasGW8m+DzInk
	 Ssh75iU1JlWVLrMhf3av6Haat85JIW+Vtp6CLG8W2/ocqIF5uFkeMiYD+QedDaU09BSq0
	 dqBQKcTctkOXPiLkbWGK7ZRaZyTfkS6ABoxHHdro5DtScqaaaOq0BgIVly07ywC32NWcq
	 RgcjFqg422TlDmolrrtdNPbcbPVUKnUXBS+rREuQ0/WZ92P/00rw3iqK7oeeqSWhsQDNX
	 2QHtfdwSwjpOsYRLwYtyjYD6kZ1npo2ietOi/ztqEeEk/fhkVOeudZUGxMucSW1tshA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7aynElI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4666606A32C;
	Wed, 18 Nov 2026 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7aynElI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987757;
	b=k5RFCls2tqk9g05h64J5wOTMxYd6N5BkOOqSPAO0koP5Cc2BAo9h43AHCvw2uhSyY+y4
	 OrOAsCEQdg7CwsuSW6beQrTft3YRbTwqaVeqxaM3mVt+CGazcIfxx99mncuG8X1ywQTRa
	 lGW+l1vJx95tNZERVPtRJll290I30sfkuGC5JLqL4Az8aZapORgu63x2Z6PyQrKf7EySm
	 QQzpkRZWs+V2rWMy+zhagjYZKocmce2CfVmWW5PNX1dmKtAPwWu3bH07ey3nc2WIsQV0C
	 VdeGE8kCcdDMbWtA9HVVBDNfIs9tKKfay8JF1gAmSURAhDJR0jFHC5MgI9woLW2xLzg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987757;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	b=RMhON3FRcH0dHkChCECkYPuTDSHXtCxg6ND5dHBRfqvHuhu44XT1SmH4AAjen4WE0bXD
	 e6Fzyo9CP1OIJCVLz1yRtGZGuNgq6dPvgG7iYIJIRv8xNKoPTYtzZSUUzaCmqITVV/DPN
	 7zsMCPsxDKhd5L8d7jcR7RswMXmDpnaxIaf1bopQFXuluAHUnaMior0QOjhkvwgwd5/nT
	 9Qk6G/3AGWC7/aRH8WkGMUYmNX31fVyZVFF2OeANty4GzzpgRRf7WtC30MGDjZkAEHHCq
	 kaVEtw8fItCX588w3VRtyvoiCIxmlDFCpbggdtTNsNL9lPrAiOT+gVSvQt5GyQS6ezg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B65D1F000CA;
	Wed, 18 Nov 2026 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987757;
	bh=4qv9GBI/rff/ofiL+Z9pE00Rlu1w4yrYAER5h1S95vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E7aynElIrITvSL83kLafX9HTF/R8fnVL3t3rq9BjMPw6EY50vkZQUbd//3OOWezAL
	 eG2+uy/KYmwraYSLARqjNCmxPXySiE2U4eTQRYqJ+EDblT7GoCL73BYsSWkPbys04y
	 H7cPSiN+ljCaKUXx+vP1ZIR1QgPIijIAGhIKEcziuPjHPRb+nhWFotwbhE3f/rNZ+f
	 zyTffiUU74EiLJdXtNRWcDQ6/jrBLK/bU7OV0LYJf0zDgDuz6zAxKWoPpT8k4Q1yPw
	 6tBWKmEzLsbgbr/AooUrzRJjDku5gXREbEr38MANITLogGfOYVvqRfx6idw24CZ7+i
	 G9FT9syb5B2cA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0770D4AC6A;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:23 +0800
Subject: [PATCH v15 06/14] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
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
Message-Id: <20261118-cv75-gpio-v15-6-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=1433;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=qYs7A+3O2UQ/LJH+vQzcUZYSnBtFDMS1HvLlsWFL8rw=;
 b=424ThgUluT3RH5qqZD/gWC63UO0iyyWy5gdhWA47fpfKprEgnLxyrb7Xhu1JKLFej199NMC7E
 kH/owuSF5/jBW4XwtRbBUM9uV+Bxtv7l9o4SgN3Pd5WgrHQW1GOu8CL
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


