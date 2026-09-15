Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575BA2DECA3
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 00:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433050; cv=none; b=LH0k+YHVNJ4nLf3kTS7T78EjxkMOr4L+jKO2rVzc7ygq98IgGRrt1mMOLAGIYtJQIraT1Ysp19RLukBFwU+66BJiCSyhOX/NaClPdRQtbzdotijQOVpDtfCA55ouV2P27HO1vsML2ugcSNWO5GEFtmB5wGpmzngginhQ36z4A/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433050; c=relaxed/simple;
	bh=Cam+G2pkyC1C2T5ka1nCaIH+HjFohyHCwADETRSirvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b9zgZsMKL1qIxzORi+HzQNEmX01ur6u4bRGM8jH6RH6IjAVi/gUGCygJT6h9svuDGNxtESc+J3zAf0F1a/bmZ04tl+MX973z3xPIzGw7yop4G6WnSp1Y6rzvbXZx5vXqgtdS/aoeHLb6mzW1lN8zl6uGJ8/klmIdA7aZyi8Skdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxKkt7+7; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxKkt7+7"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1458746a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 17:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789433049; x=1790037849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pR6+8ahH0v/WhXkZabjYsMBMJZUya1nS7QcD3emiias=;
        b=QxKkt7+75kpkKpf5GTijzJEvYERhgxNk2suULEb52kbPvdtQzP+cI+ggErLGZRPJSd
         LWROUTW+Jwsgxe+UTMPRk1oRkYefW6btJrv5MvSsVxXRehwyPwAKDvhbgDLs6Mc1iVx8
         vLavXduRdzCOGaTePXJvUBXRO/69e5RTHXLqaGNCyPHJrxkiL4C3NVZXrwjBHRzvfRc4
         969J8dx7gMNa5Q1ZrSfoN80f5m4J7LvOgZPjeeiS8vYO2Qe9axmVDdKtBkD8RAzbURgh
         WRRp7ynS/jjDEnFg+8Y/kw6kHOF2cDSpbQc1n9RTSpmxOzK3lvM3u23bWkTX2fjcf4Hw
         xm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789433049; x=1790037849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR6+8ahH0v/WhXkZabjYsMBMJZUya1nS7QcD3emiias=;
        b=QKl19hfvooACREhHw6m2a836xR8DWhRu3QikHypod/tZfiKLZZpfX93QOMzj7UWQdh
         nUelyBBUW6+u4dciW3rGC9FwEGjqN1VwgUGoOeXSBjyRuwFcvSAYnYqWApVdH/3NEpI0
         eUd8mMP7Yh2pVnByII5LmjBG4cGsMt/2aBhb6Ja5ueHStdouLuOWxb3Ge5BGEbLhDt9g
         /wTGoahodxz/sFbvaH8oqUkDAz5/mXyyORSLw+QBcqJ2lDiYwEI3iBqHt94MouU3BO0Q
         EmYeH3nU5a1HbXPyVEO/tFG7mmwOHJ+5hk444loCcTruQF2wiQ2SHzkvrPlQxpCyIBUC
         QGEw==
X-Gm-Message-State: AFuF++nB8sjhdZCdP6TVWwjlukdLi3TeBnw+QeoZizZJlFq8gQmHVu0e
	R3ZJyhWMHux9nN4UqPizU2FHG9umFQVv1qJKWYznnLcqrgqQKpDz50s/LHvEMg==
X-Gm-Gg: AYBFou3e/eOLPnWsbM4F8Nav/hooxYCDxRrWqBr00dAY1XBX0HJFGfkZD7RhhY4W9BH
	8/DbhVkNn7C6Vfwi7RRniMs6JaDIosbuP613ZqFg5Sjzj8uCdF1TezPSbia7MMph6OYTWUD6QBp
	Z3ccwRcTKnwF9L5ymOGKzlTN8wzFlArkL5ZjNeAXKyMnBkern3F3pXvv/Zz59vJs5lmOZFtqfER
	Ar8Isd4AamIZGGuR3Uy3YryHOZC5O0drPxKozJ665G7JpG0reWmc3x0BoQutRzV/u+o4PKmwwud
	F0rnI28wfFS09sc2YUbeWyXFknnPGO1U2Y2LJDmjrPRaV7H47SV/pc3hCkAq4x8w1InspeqXuyF
	R+EE0nJj+CpwoNImKr/vSK5uq3WJEIxDwFqO6vXu9Z1SqfLC6VI3uywn/lcy3yuoKeu3FIKg+yQ
	IntKGS7a5uaZtAkhUeA+8Javmlgo7UN6Nh8HN+dsZyH7IVjcBRxbQfBz/NbBbdfYOqX0HqVLli3
	72ZRmMgrNhlf3DgmMzQhXZmtbqPMdMDjJc98UCdufl8khRhfmO+FKaNGE5i+7pvSPE3OEV8VL/C
	Aw74JCsjXiVN3nPyx7bJjBOUl/q6yQAf8oOfVDfRRDVBYvvZ
X-Received: by 2002:a05:6a21:3397:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3db4048a6a6mr12153286637.7.1789433048529;
        Mon, 14 Sep 2026 17:44:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615bb00sm5927945a12.4.2026.09.14.17.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:44:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT)
Subject: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
Date: Mon, 14 Sep 2026 17:44:06 -0700
Message-ID: <20260915004406.115230-1-rosenp@gmail.com>
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

Tested on Helios4 (armhf): 5 suspend cycles woken by magic packet,
no hang; mvebu_gpio_resume() returns in 6 usecs.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Unlock spinlock before regmap_write.
 drivers/gpio/gpio-mvebu.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c57758019e92..267e6d5bacd0 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1049,6 +1049,8 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 static int mvebu_gpio_resume(struct platform_device *pdev)
 {
 	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	u32 edge_cache = ~0U, level_cache = ~0U;
+	unsigned long flags;
 	int i;
 
 	regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1060,32 +1062,51 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 	regmap_write(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset,
 		     mvchip->in_pol_reg);
 
+	/*
+	 * genirq skips mask_irq() for a line it already considers masked, so
+	 * unmasking one behind its back leaves an asserted level line that
+	 * nobody masks. Restore only bits the irqchip cache still has set.
+	 *
+	 * Snapshot the caches under the raw spinlock, but release it before
+	 * the regmap writes below: regmap_write() takes a sleepable lock on
+	 * PREEMPT_RT.
+	 */
+	if (mvchip->domain) {
+		struct irq_chip_generic *gc;
+
+		gc = irq_get_domain_generic_chip(mvchip->domain, 0);
+		raw_spin_lock_irqsave(&gc->lock, flags);
+		level_cache = gc->chip_types[0].mask_cache_priv;
+		edge_cache = gc->chip_types[1].mask_cache_priv;
+		raw_spin_unlock_irqrestore(&gc->lock, flags);
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
-- 
2.55.0

