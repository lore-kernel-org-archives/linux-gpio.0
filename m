Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829608;
	b=TWBSBug2mT2pTlpU9Atbxutv6dvNDcFZzV7pip5gnc0caylmkR7GkrWVW1jLxRmxrp0T
	 TysrOycSFsMYzrpqAi1E/b2zsgf08YQtYkLe66d+nUBxoFwQviO/vzde/MwDbXUe8jQe5
	 xEYuRi6I3srMWPStVXRUmECY1BxBBJR7sIGKJbMivuON8/SymviOuF280PPekvBY9zF+3
	 KkDTHLzqqlg+jNApbc3GCYZZ6dV6MDgVvow8Esqno5GMeBusGaRYBofXnyK91jX2Pu05t
	 JgErQTuoaHBAcZCHV/8W4sf7ZUVRbWsjmaIuO4d9QWtsJv3W+e3cgxynBlZWDyrACIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HRAnyt134SHIgNN1UWRJhhprtsqiZv4ePN3n1Nko6jI=;
	b=dMASTiHBiCymoYKcq88uL7ZjT16kZCiybkQ6ENCSvljbLK3nCmv8thXFlkTFBWK4wptv
	 nDoPQ2xTr5rikx+M8okgTwX0Md0vnPAd+zCQ3x0qtS0Ujox94oBCP5PlO+ESyfopQ3hXO
	 jYf9wxkYE5naJaL9ZBQH8H74/w7ELMYwWsRcCjLx5q2j+DpJBi67+LlmjRpKBaaTEVVMw
	 mYiIYDZz0fiFOnzcC6E6Y1PDZwwTTHM+cyQtJ5skc3mABOsdRWW00LGqmfVxlsmMpSOiG
	 Un6Y5nerUjlrVJrVOzHjp26CwHuSVqGwm9XoKc6n9RyNbrIhwthAjoFoKE/GhM5vs/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMVAvhSm;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D760877FA
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 22:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080D760877FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMVAvhSm
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e940d5d2beso5145315ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829607; x=1794434407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRAnyt134SHIgNN1UWRJhhprtsqiZv4ePN3n1Nko6jI=;
        b=VMVAvhSmuoSNgg2N+X2SNsiVMqgp/vsB3tiywuyaV608ObFEYF/Sl5TxNCD0HbHC89
         ABVWL69R5CVrrkU6IwCp/zTN0qjnpiH8lCc+NZM2UdF/+MIy1qYJ1Lk704pFRTJqaHvD
         mRLUt4eGWRW+HKXmRcyEoB1P7n4b3IxGiXGBZxZ180lMD3TP2zVwL0WY1TSKJfPO3jnc
         cTLtfcGbsIUSQw2o6Ojpoahph8FKbPewFF3W9dSS23dBA06MOlVpnAOS3O5fAIiQVk9x
         8KMHFG169oTTYsas7RkNl2lJHH8LOKtaHiilHaL8l7gpvXF6IQw2RxQHbbeQrElvR9n5
         6Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829607; x=1794434407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRAnyt134SHIgNN1UWRJhhprtsqiZv4ePN3n1Nko6jI=;
        b=PbmxUF2xNvbF2jAIp4sd0OlH0pfe0sMkTquYWA+UD4lmtNoi6bFJ0EP7dqDkRtph+z
         1HJZhZ0BSe2SSuxBXgPQAOjWG+lrY3txoprYRyVSJQjiNAUFlPhKm1vEMzQO69Efjv8v
         72UDIDiVKQFU97aTSZm6Vcpx/bRErBilq3biaA/qxe+n7ByogGYtXwzawBAHO9MHkyQu
         pmMM0EdFiLNsFjzw+oxkauFr5jDSiUKcYW46e1HzpE8CsrToFKRk8K272f4e6B9p9mFB
         GOTMBWPe+RG6l5gwNZPRu9xuxgfNBDVwb2kUOciYB2wH75pa8OspZZkpzvKuNbS5DmeA
         29+g==
X-Gm-Message-State: APuU4Z/aZS/8lMwlhwt6NmVnc48gI0ERs2RCW8nJqmCZx+MgseVGYL0w
	rAW42RYtm4c4H4sUEiRorCDhe8b1LNYY6KPEurlSTEUbh3SCWtK2Ln1w6fx6OA==
X-Gm-Gg: AYBFou10laa4nYyxUl2NdNBFypu0T3F9bs4G5KnsOV/qUkyZ/mDMWKwUvceT+XU4k5Y
	dzBlTB9RNGEEPGfukY/AUnFPbAVzWLDpERLqpFLv2KFcg+fBFk5O/Fze3tZ5YM3hIinHIvDE4Qg
	vmr98hNZAGpI8zEzrYR8v7wKG4OwklrihuNhVNEQKh9lppfuKP+MJCskf2q5QzzASY5Ns8aKFbZ
	FSVf7GI5Eo8tPzcNYjF7+I3uCEJYJ8P4tN+ThLZi/B/+/184HVArUKeo6j6giK2UJXECfD21Mce
	gtKxxC3wGo6lXPwyhaWvFVvbjzveUmfoM85NdSisyILL38BOxqrX9TRRt8LDH1p+pMa34EHKBIS
	buZFCHloPnPkYZC7Yfsap3MD379t2ByPlFcziq4widQL0FBa7YtsN6gw3PPly5zvA3quRJ3y0YM
	ravtoFkmJjIDZRcwIg3rAT3fE7Y/9QHl014TAanG4K/i2Qdzxp7oDkPwQzzwG566ucPCLZQJtzg
	h+nMyjvj0NMF0ZHkY5zec+WZf01By8pXrCNj+E1NXcUkGV+Mvb+qGbt+GTtlAY//8WTPXsrCtk+
	UIfoEMTvws68gPnRrJ5iI3aGONWnO6xIho1fGU6CSA0rNrH3XwqNqypBcdCSjT1RR+G1gQ1htR9
	xF62AbXHpP11F8h0ExiA/1819pw4A9Mxr+wT3TSoVl23qlmcW0E0g4Vucy+jCbKjP3bSf/ZQw5O
	hnWw==
X-Received: by 2002:a17:903:3c6b:b0:2e9:7dda:7194 with SMTP id d9443c01a7336-2eb3642fea1mr148462125ad.11.1793829607379;
        Wed, 04 Nov 2026 14:00:07 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:06 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] gpio: ppc44x: fold __ppc44x_gpio_set() into ppc44x_gpio_dir_out()
Date: Wed,  4 Nov 2026 13:59:57 -0800
Message-ID: <20261104215959.24035-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ppc44x_gpio_set() has a single caller, and it looks up the driver
data that the caller already has. Open-code it in the direction_output
callback, with a comment explaining why gpio_generic_chip_set() can't
be used there: the generic setter takes the chip lock, which is already
held at that point.

While at it, drop the pr_debug(); gpiolib's tracepoints already report
direction and value changes.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index b3cbc832cf24..20b3e9ce48e8 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -85,20 +85,6 @@ static void ppc44x_gpio_select_gpio(struct ppc44x_gpio __iomem *regs,
  * There are a maximum of 32 gpios in each gpio controller.
  */
 
-static inline void
-__ppc44x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
-	struct gpio_generic_chip *gen_gc = &chip->chip;
-
-	if (val)
-		gen_gc->sdata |= GPIO_MASK(gpio);
-	else
-		gen_gc->sdata &= ~GPIO_MASK(gpio);
-
-	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
-}
-
 static int ppc44x_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct ppc44x_gpio_chip *chip = gpiochip_get_data(gc);
@@ -128,8 +114,16 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
-	/* First set initial value */
-	__ppc44x_gpio_set(gc, gpio, val);
+	/*
+	 * First set the initial value. This can't use gpio_generic_chip_set()
+	 * as the generic setter takes the chip lock, which is already held.
+	 */
+	if (val)
+		gen_gc->sdata |= GPIO_MASK(gpio);
+	else
+		gen_gc->sdata &= ~GPIO_MASK(gpio);
+
+	gpio_generic_write_reg(gen_gc, gen_gc->reg_set, gen_gc->sdata);
 
 	/* Disable open-drain function */
 	ppc44x_clrbits32(&regs->odr, GPIO_MASK(gpio));
@@ -140,8 +134,6 @@ ppc44x_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	ppc44x_gpio_select_gpio(regs, gpio);
 
-	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
-
 	return 0;
 }
 
-- 
2.56.0

