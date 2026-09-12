Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDD234F497
	for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2026 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789251583; cv=none; b=MKGAjNZbZzOJbpehbWOgSWyo+2omoacnMSF7zlYYJb3W1HhweWKVln3SHKkI8NVMUCstt2H4ObFWSqn3xIiaTcvN3vwip0ejZgJgyQFx99SpUiTUfaFNl9I095/0nAs65thbGcELLC1gZpe1NbTGM7GdRErac4Nl3FBx8ZpIYBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789251583; c=relaxed/simple;
	bh=0uT0VgkWN10sGGCdjOU9H1z6SM5oHkGT3yRKAlBYR2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CpVU5R4/0LRweAchh1vuspCGe7mVnDmaLB8ihLFI7Sd/OsJreo0TqdHbaK9v1dWWsFa/eYgA4wTq93IU6qjd4m0KbVqRbM1Bc738WcOtPNyB68Nnov7lMJyrNA4+Kzeg/d5fNCb7XPbwGnXKbJRXU9YeDdc0ze6n8jINgCh6qfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCj6Endl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCj6Endl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d715f4a587so29025285ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2026 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789251581; x=1789856381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6Xs676NlWL1Mj/zcxdmFLfPMSO9k6Bt3Fs8MUumDew=;
        b=JCj6Endlerp/AN0HgyS+TQCA7fl16pSqhA8QLKv6hYr9NoSVy7AOd39BifbHpLmdm/
         o9+RP2weU8IxHpFW4yx2ArUtRdM74mfQcguog+pCTH4Mw0K+/rXtk/mVWvKsljQfYcLU
         +vQ7/N6o73XOMRQz7VIMNWjZ/tCYNb5QwfAOs49Nogv2INvsqFhSxEfazW9UvlbLcLEo
         nxNf2XURKk4U66gpv+/zfXhVom0RA9ddsY+ROLu7bmFxRQVf8hMOosDHl9k/qPtqGOFB
         /nZwR6a9xu5Mt7isGQQW2WiHo1OPxhuBhT5waUqTUW3j8Jp/KG6dtaA/a+oJc7izXMGU
         1ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789251581; x=1789856381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6Xs676NlWL1Mj/zcxdmFLfPMSO9k6Bt3Fs8MUumDew=;
        b=BgaPSn3arbSKusS2ij7zcpUz0KyXFgNFUogILdHdZDLGiUm4KhGMNI9EQ+4VtHJhkd
         g+JOFFbskxudkwKn8R6GcpDQgkkIIfwIbCz+toc9i+7GYNccSP9vjIJBV7emHtdu1x28
         NqtTtVFpOnw79KMdW5OS4lkW+RPe5k9YIPM9+fBUzuNQs26ZzELoFokVFqm2TDBqD8bj
         U5/Sd5gaFb/V+T17oJpbBB6wKvnGlgAb69xQWF2XaHds+o/5JlQWtNgJcvHzD8Lf80vr
         ZeXLH6yU5elNnYPl1fLa7L2o0/89+paY5w7DnzHPvTGkU8CJCzri/m0EHTIPc3ZdNDOA
         1wmg==
X-Gm-Message-State: AFuF++m5bVTAbQRVdRAspbbJpdxuzozrYGFKze3Xv6uRlJEIGqfaHrat
	lYgFbYLSJcEbltqfo/EDFYU5lhcXxUqFc8wPZAYrdT6O89XGSwPprS6SDowdJg==
X-Gm-Gg: AYBFou2SjFOdgHlhucOpRFv4irugFwLWeAtTCv7gxwVVWtyDDsskQG1Iu/rrZpbWamF
	eJ073XDoVlSm07MeeCsPvGLWqRpwRry9xYBQ+GvcvCThmFtvCPTe+xQZyHXP/MSlS96VKqG0yRz
	elPaTYN7bq2se9W+mZPiMwIbgeBVGFatUNz+rdNjErmo/uzUjaKGuJ23zYUFLTus772Ll0oGQ7L
	4vBeUar/u5CoCvDBpbiQJCM8Dk8qkt8sEAeha2p2O2f6STpqRxUC40EcwhE2gVki0jVpfvi1JDt
	0ikGLWXlJI/vcf/TCGo7Qljevgyh0FnR7RuVk8OYPb6uUddoRStq4JAGM3XOWq+fYb1Pt1CDC90
	xqTKMbzTfhDTHPzthJh5qC9fyv7NKI41ptAyF9Z66HO89iZe7FI42x07GPE+dCCYe+ZJK/YHuQh
	0bEfRq4FOFBpD12Apn1xgVYSE6VjoZgTQg0mg3Jve+lnTzSmCPx3RfFH7mIDdiloqDr2ozhEOJB
	ZnSnlHRMjxhEMUN/jXrMVTwHHTaBks/e6YpxSSo3k+GUif8cICMMB73qdN+9FeZLbzpXnS9lvDu
	fjnj8DMVplLO93eY+Lodee5uymHGqFl7dS2Z6XaaBU0o+ezX
X-Received: by 2002:a17:90b:4b0e:b0:398:9be5:b41d with SMTP id 98e67ed59e1d1-39d9c368348mr17660307a91.24.1789251581216;
        Sat, 12 Sep 2026 15:19:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm13437631a91.5.2026.09.12.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:19:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: keep resume masks within the irqchip cache
Date: Sat, 12 Sep 2026 15:19:37 -0700
Message-ID: <20260912221937.71403-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvebu_gpio_resume() writes the edge/level mask registers saved at
suspend time straight back to hardware, bypassing the irqchip's
mask_cache_priv.  genirq skips mask_irq() for a line it already
considers masked, so restoring a bit in hardware that genirq thinks
is still masked leaves that line unmasked behind genirq's back.  An
asserted level line then has nobody to ack it, and the moment
interrupts are re-enabled the chained handler storms, hanging resume.

AND the restored mask values with the matching irqchip mask cache so
only lines genirq currently considers unmasked are unmasked again.
Read the caches under gc->lock to keep them consistent with the
mask/unmask handlers.

Tested on Helios4 5 suspend cycles woken by magic packet, no hang;
mvebu_gpio_resume() returns in 6 usecs.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c57758019e92..988f2cf24f59 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1049,6 +1049,9 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 static int mvebu_gpio_resume(struct platform_device *pdev)
 {
 	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct irq_chip_generic *gc = NULL;
+	u32 edge_cache = ~0U, level_cache = ~0U;
+	unsigned long flags = 0;
 	int i;
 
 	regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1060,38 +1063,53 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 	regmap_write(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset,
 		     mvchip->in_pol_reg);
 
+	/*
+	 * genirq skips mask_irq() for a line it already considers masked, so
+	 * unmasking one behind its back leaves an asserted level line that
+	 * nobody masks. Restore only bits the irqchip cache still has set.
+	 */
+	if (mvchip->domain) {
+		gc = irq_get_domain_generic_chip(mvchip->domain, 0);
+		raw_spin_lock_irqsave(&gc->lock, flags);
+		level_cache = gc->chip_types[0].mask_cache_priv;
+		edge_cache = gc->chip_types[1].mask_cache_priv;
+	}
+
 	switch (mvchip->soc_variant) {
 	case MVEBU_GPIO_SOC_VARIANT_ORION:
 	case MVEBU_GPIO_SOC_VARIANT_A8K:
 		regmap_write(mvchip->regs, GPIO_EDGE_MASK_OFF + mvchip->offset,
-			     mvchip->edge_mask_regs[0]);
+			     mvchip->edge_mask_regs[0] & edge_cache);
 		regmap_write(mvchip->regs, GPIO_LEVEL_MASK_OFF + mvchip->offset,
-			     mvchip->level_mask_regs[0]);
+			     mvchip->level_mask_regs[0] & level_cache);
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_MV78200:
 		for (i = 0; i < 2; i++) {
 			regmap_write(mvchip->regs,
 				     GPIO_EDGE_MASK_MV78200_OFF(i),
-				     mvchip->edge_mask_regs[i]);
+				     mvchip->edge_mask_regs[i] & edge_cache);
 			regmap_write(mvchip->regs,
 				     GPIO_LEVEL_MASK_MV78200_OFF(i),
-				     mvchip->level_mask_regs[i]);
+				     mvchip->level_mask_regs[i] & level_cache);
 		}
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
 			regmap_write(mvchip->regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
-				     mvchip->edge_mask_regs[i]);
+				     mvchip->edge_mask_regs[i] & edge_cache);
 			regmap_write(mvchip->regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
-				     mvchip->level_mask_regs[i]);
+				     mvchip->level_mask_regs[i] & level_cache);
 		}
 		break;
 	default:
 		BUG();
 	}
 
+	if (gc)
+		raw_spin_unlock_irqrestore(&gc->lock, flags);
+
 	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
 		mvebu_pwm_resume(mvchip);
 
-- 
2.55.0

