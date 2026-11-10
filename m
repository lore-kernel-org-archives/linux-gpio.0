Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285170;
	b=vSAtUDw+uqUK+HlcCbwlIultEZKovW95kR8AeLW+0+by8L6EN7oXI1QTddVov1ivqSdR
	 SX8EUExJehuDDmAphre9nAhalJYMB/h54IRTgpgNIgJLkE2MqXa8mS+QXoMSrTtKNVMCS
	 94t0BPEoxOx9BuzRHdXHAkutPsNUE167Ez+N93JW/UcX3re2j6ay7x6yCIa6cPVtBT1R+
	 J7q1KH9A+S/YaXsGPmK+ngwO5ulbHfXwpRlrQui0Rl/eSmM/0g4nJ2BpEVzLLdAJ7t3qb
	 nlLexzT8AW/oUukTUtyjQDeHyo0sYV10Dt5zHTl3edifOy6QnTjUxbJSSLYyKRTHhKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285170;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6qA0mLid2qN3DytPIXjzaUO3Qx+Zu5Z7DpSKjkEVo2o=;
	b=jSULpoK7irWig9U2yVAlVtjSHx/H2P+STmXKgj8QDl3S/HouPlIVASDaoim/Ztuz3ysH
	 rMreg0JEQloUrDuB+ehJH/HpK5lWcFTRp53U6qSx7I05mMsefyhFRZGFby3uoE9jEemXe
	 ZKtTxyz18xFUZqcqNAAnMkJLtML5idq8coU3ukjgyEyripWTcybMcGf6n25KWUbO3HG6r
	 gc09iGGdBwhCQBcUh9rohzn32TDn/p/QsYcslRmu7QRyGwQl6XkZQpD/rSlRDxpLhWIYu
	 m94+MD21yfbhTSW2B2PxideGH4wgHuM93vyiwZe/t1+99QsZ/sDl5sfU+b7b81JxIcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTS8UJ7j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9268360A380C;
	Tue, 10 Nov 2026 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTS8UJ7j
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285170;
	b=LkZZ/3sv6n7kiIp7W7tg8MNSz2h6sfKWUlkNeD1mTkOskNp4B6xoU9TazevD8ODj4vre
	 r64VqBVBhGByOnma2sYWnEn8iePZJFa5Ahu/z3iAEsF7AziA0UA7/aT8N/N5DN8OagNAZ
	 h763VjGrIqpe7g7Oqpk/OUYR7FmxcuiLtVIFESugKY1PVpK/O3A5jhEkAt2ssBFBj59O5
	 hQ6oNHFBpvfU3YONAsTkiUG6U29ZTigdXrJr2mlsFceBD+r6yEMXQyRjYvTjRUubHF9KF
	 IlA6W2bofhod28NUYZxV06kMSqKbbKb5SHuUlsWFe7RDmwwG8kCi26SEtBFMduqIDIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285170;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6qA0mLid2qN3DytPIXjzaUO3Qx+Zu5Z7DpSKjkEVo2o=;
	b=MGuo/6lXFxPQDcsB3wvlLjEbxhqSbMsbgfgIFvckVpRhJZlyznTKg19gweeMW7so0BbU
	 BJT1Bh7brlE1Z3NWhzuVaUAKifv9VC8Ppivm9H6qpitXkEtyK7hvGjcEa7MvoZy9AJZVe
	 yn4BcVTk+GIuoR7BaB3PY2XcktiMA5wxZY+eGGO+H5isxM0ISE4trriSZ8TILPs7YKTq7
	 vHXVQdZffqXU4ybIq4OADu8fo4bz22AwhRVmB0HPrDu4fMDuPr63vqmLbS4kh/K+QjkIv
	 Gey98Vz6B+d+LC9eFEPKssnRfpZjxoKWvawNRe7Qc2cQOwvD3GPJBwL2yo9RKSd/0sQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7D231F00902;
	Tue, 10 Nov 2026 04:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285170;
	bh=6qA0mLid2qN3DytPIXjzaUO3Qx+Zu5Z7DpSKjkEVo2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mTS8UJ7j3z8mYnyLc0e7Jqza7DbrGtQcgPDTsOw69eZllvvsAFJ/qRA+Kp75PPE+9
	 qBi9cVzwMAvD6QmHO6GbUWv2zJAyasr+ct09uHV2ja5g8iR9ioF0Nijg+tfWPpY57W
	 xnFY4e4PqWuAirnDSvJrvMNApOhB3HaRvRJaAvaU8rtPmKQX2R6ZlaihPsM5YW2owZ
	 2rr1VjN8NeyscjU3JXSsyK68kP/TAsOMvUKWpNoJO9wTN0o71KUxnfjsfoAfzLAZkG
	 qb+ydhiCVME3OxCnZuBm/wXB6/sN2tzjlvngWJi8EiWtGKgIgMkZoyjWHkOul9GzaU
	 xQCy54dCueQPg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8278548885;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:39 +0800
Subject: [PATCH v14 14/14] gpio: pl061: use string_choices helpers for IRQ
 trigger logging
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
Message-Id: <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=1466;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=zQWRi0fgwIaty3vp0IahahK3JC0SGC12QCtYzwVUqX4=;
 b=zsCAuUjcqcBhE4/IUMhwikNV+XTsAvvXwqzIHpVPk+uxwMwBNY+6quMtoEU6rnyhoKiaH5xyN
 dTESRinK4yhBquV3uCg5eDt9rQZWxRwf29/N1POh31DFAUOplb/y/rf
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Use str_high_low() and str_rising_falling() for the level and edge
debug lines.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 63ec5363dd5f..86c22378e759 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -26,6 +26,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -195,8 +196,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_level_irq);
 		dev_dbg(parent, "line %d: IRQ on %s level\n",
-			offset,
-			polarity ? "HIGH" : "LOW");
+			offset, str_high_low(polarity));
 	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
 		/* Disable level detection */
 		gpiois &= ~bit;
@@ -219,8 +219,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev &= ~bit;
 		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(parent, "line %d: IRQ on %s edge\n",
-			offset,
-			rising ? "RISING" : "FALLING");
+			offset, str_rising_falling(rising));
 	} else {
 		/* No trigger: disable everything */
 		gpiois &= ~bit;

-- 
2.34.1


