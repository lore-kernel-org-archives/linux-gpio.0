Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527428;
	b=v/XwnbR8hJdgjdZnFCIvuGXvHnRWQjjwRtuuORe/yrdSy7JdNAcLOnl8+xu7WkrAhwhw
	 HEJTXyad5Ious4txH2zSqEV8+3HlId/CiUcbnXz/ehFl2f6+8x+AZuQh5dWhRNLD7ds+0
	 k0Fh18oB+HHg/iuvAQGeCbK8TjlWeYDIzulwnNA8Z12oiD4v/xLp1EcWauQm+I+doFAOA
	 MG4orzhMAM8oK975m+wg6r9hqbRq9/s9LUxOKxuiyFe0H4Mr0WOGOkN1S0s6Pa/Xkhtly
	 RTvKL4HRSfqptUKnO2OZdC8n6ULSOYoVzmYLGOe3M09U91Fh5qUs+GhfjMHDWK2jcZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KPY8tQeszbUqEwYqMLIMysd8FLLdVIfhPfeNS/lrFEo=;
	b=jTG9pNu20GZyG6a1MOG5qnGVo2LP4pY2pTaf1IRfdc0caS7U9RFX80zxdyK92mY4LgTU
	 8lL3ADU2ZnX78nwAu8rHM2yK7c58Btko+xD+bazFo+rlbyRDHWQXNMo6FTGvXFpRip46c
	 tZ5a92jyHhNOuHJjnQgCpd+m7piTRzKXfhxhOqktTpPYLLJL4y1UybAIHohGeG005DZKt
	 oYviruRNOz0sYae2OQKaK9gQ/fVK3LnvfCysMlQ5mU6ySc4bCKYJXJxqgthn6vnK5Napc
	 qMG5oufZTmbQndBrGetm8cZaQtKvX5nJKB0cIDV/EVidWEghbZ/XZz7uGCwRdTbIvHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEEdVd4m;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5F5606A333
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEEdVd4m
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495d543b91so276534185a.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527427; x=1796132227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPY8tQeszbUqEwYqMLIMysd8FLLdVIfhPfeNS/lrFEo=;
        b=bEEdVd4m7e9+V+BhbEvofYjXFqtFxxcsvu5Ml+g87YdGXXVQ+k2A6REr5qKleWXq0J
         /13v6r/695pOYFnUR7ywM8kIEBS+zTx7iQhx/S0lfF2jX1+wQ/w1wzPC9jP2+7ZbDxgM
         o1Bt4KRlCCQS51AQwOC2czo/pNfQnV9dC19GOSz2gwR84LHkdHh151hd/uIFayVvutZq
         5F4VXTJMEY7rC8ld9orYhUhzyVRU1q910rWe8YDxEUBzTXafVhsE6g/vUZwoI/rPs7Qt
         zY7jg1GfkIlhtia2zzt70u/+nVdfgb7o3xK7EoqPXkW0bmMHCCzZVfRKhTlokB6hO8+l
         lPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527427; x=1796132227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPY8tQeszbUqEwYqMLIMysd8FLLdVIfhPfeNS/lrFEo=;
        b=0Bz+vKHyuL192zjEX2iVnNNEXKCBdJ4qX/CgvzR+2gbQBwlH1IpunzQLUIWr/ogxcW
         wrsqD7Yjk5fCojddIhRw8JUYUB3xtbx01Z4+b5p1P68WWXdrUvXklGL0oRcAOlKK+2Tw
         5Flig6XdYnrG9YyUlWIpvSzHXFzJadgvNgsi23NqZw+OhhYFX6SEZvrO0X3OSFKhNf+V
         qlOTfg1FZDLMamXia9EL8aOFs00tZkGBqQopd+lN3Cr3IwTTUlL4DROaxzNzY3MNYM1M
         RNtkxGveGBEc1F/OZixbP58lBJgsXq//8GSsgBXJ/4z10P5is4Gge/0TgSSiX1CDOI+r
         LLsA==
X-Gm-Message-State: APuU4Z8TcTgO+qAwaXAWkK8vp/PN0M/KbwDG+bVHpfOP/CiQwxnaHtoC
	wsu3tqCNUJHO+9JNpYkqeKmWFJnq22KP4KzIAqfxeNpLJ60w/DUJT+kP
X-Gm-Gg: AZFdTZcIefSCkGXAupw29oJnsDwCbsFwB38JkdQnG3ji8YxvYkvd+JQVi5WxHL2djYr
	E217rMYtinH9+Dqn+/yVAQxBNPKjKXp0KKEyEx/On2E2x+3Pekh54BFjBN9JpzAY5z4QeaChtJR
	DEB5U2GIiQmwaQ5q/dPH/gGjELIYbz+fNbqvcp+MGNMlG51Ej4qDHAwNI01QMiGk6zcdiWGRmRp
	EW7C/YvXDUR5lPEoX56JBC7xMgDhhxmtpmu2lcW6ZLkBfWq7I/IaBfGX08vypju9tgWGsSrs0vm
	aPnlfRqIa75zYC7J9AegivNLe4QMolIC94F/cKiFCZHQ5cTHVcBZwwwT5kZJl62tDhm5i+xrliG
	K4QE4h++g4MyDI20glv5mG10m48Exd5abiU8sETfR4k+aosduz9iQd8rHP+Ats2q0S1ya9jLBdc
	jqLrDuqlBvS4CfplV1iIQcQn+6k5cEDi+inGp5/70i6t0a/Wtp4c0bE+qROj+r4m+oFThtppjbt
	2zcbYzMwes5oHikVFJPwHk/g4lL6yElB1K2kikem8CNIHIOgV49V6C4h242knkDPjJBxZbKO9tA
	lr739oCb6m+GedkRtgqcuXcbAEojIhyDQC5X7vzV40eAKDDVHiDoc653F8mLNwhS
X-Received: by 2002:a05:620a:880e:b0:947:a431:adf2 with SMTP id af79cd13be357-949ba8246bdmr2229548485a.1.1795527426708;
        Tue, 24 Nov 2026 05:37:06 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm133834536d6.22.2026.11.24.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:37:06 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com
Subject: [PATCH v2 2/2] gpio: davinci: allocate bank IRQ data before installing handlers
Date: Tue, 24 Nov 2026 19:06:54 +0530
Message-ID: <20261124121500.2cd5cbf30f89-3-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
References: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
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

If allocation fails partway through bank setup, previously installed
chained handlers still point at devm-managed data that is released when
probe fails. Allocate the complete bank-data array before installing the
first chained handler so an allocation failure leaves no handlers behind.

This fixes the probe-failure path; it does not change ordinary device
removal.

Fixes: b5cf3fd827d2 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Changes in v2:
- Rebase onto GPIO gpio/for-next and use devm_kzalloc_objs() for the
  upfront array, matching the upstream devm_kzalloc_obj() conversion.
- Add Linus Walleij's Reviewed-by.

Previous version:
https://lore.kernel.org/all/20261109194910.2282454-3-sahaj123.sc@gmail.com/

Testing:
- ARM64 W=1 driver build and mocked allocation-failure regression passed.
- Instrumented AM642 allocation failure left one handler on baseline and
  none with the fixed series. The real parent handler was also exercised
  on 12 banks. See the cover letter for test scope and limitations.

 drivers/gpio/gpio-davinci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 7961ddee9f40..15c6420d25c4 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -550,6 +550,13 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * Or, AINTC can handle IRQs for banks of 16 GPIO IRQs, which we
 	 * then chain through our own handler.
 	 */
+	irqdata = devm_kzalloc_objs(dev, *irqdata,
+				    DIV_ROUND_UP(ngpio, 16));
+	if (!irqdata) {
+		irq_domain_remove(chips->irq_domain);
+		return -ENOMEM;
+	}
+
 	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 16) {
 		/* disabled by default, enabled only as needed
 		 * There are register sets for 32 GPIOs. 2 banks of 16
@@ -564,19 +571,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		 * gpio irqs. Pass the irq bank's corresponding controller to
 		 * the chained irq handler.
 		 */
-		irqdata = devm_kzalloc_obj(&pdev->dev,
-					   struct davinci_gpio_irq_data);
-		if (!irqdata) {
-			irq_domain_remove(chips->irq_domain);
-			return -ENOMEM;
-		}
-
-		irqdata->regs = g;
-		irqdata->bank_num = bank;
-		irqdata->chip = chips;
+		irqdata[bank].regs = g;
+		irqdata[bank].bank_num = bank;
+		irqdata[bank].chip = chips;
 
 		irq_set_chained_handler_and_data(chips->irqs[bank],
-						 gpio_irq_handler, irqdata);
+						 gpio_irq_handler, &irqdata[bank]);
 
 		binten |= BIT(bank);
 	}
-- 
2.43.0

