Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D43F58D8
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086877; cv=none; b=V9AI11mfEE2cYkH0JQ14XirmWO8/VfgXM9hsyqQfWXAo8N/RKPamk2mu6vUQVk1fzfnu3azH/b1Mqa/wrBj/cP74vvWNZpeUG089v481qf2MTtcTGspErRsHjHpzOPO76mnaQzmLOo1o/Wa2SJGyvEIfJEFKc1Gawm+AemGhAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086877; c=relaxed/simple;
	bh=xAwIEomSe/rVYBk55F2T1a2zoLu9gtjNH+NvgWc+v1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpEup8qy7FmpH4YrJjOmoBm1p0FRjMVVuet67O8zP39rUarl15HBtAJjeukhFXoqySqDRjiLB40jiqBsuYPHvRbUGip7YXOEhqSqFuFyYmAFWlc8q7NjKm0DFCecmDIC9Ef7U/PMo6Hn1YfDmW2N6FhFl/cGdPg7uJiUriz7P/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sN3GT5bk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sN3GT5bk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso59184595ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086875; x=1781691675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=;
        b=sN3GT5bk0bfhn696q2IMhV6MNEf8BFcd/h6CHH5ezvb2L8vcz1HB/6zJWZOSsClMb+
         Su1jHZpMRopEa/IIX5j1Z8XPMbMBMpiy0vRWkn886+1Yyq/vEw7pYVZWBRxjnHtvRZVA
         Kk9o8DsqOJ/1Sm7EUxGAV7DVUmUIgyUUcKMouN30PgjCzLvfHBUi20TZjkXUstj1Izmw
         +Os2HrK0OsMg/uZqPqpgiGVnC7BPD2Zi27myz8RBr+27EgRLysdnxiBmQC5ugG6kYUXg
         jSPFWH4qmq3FXmBYr+gO01p8WMYljDxGXWE2Qhi08jhxin4KZv0MkUAdrZOe2Oxu/sv/
         FyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086875; x=1781691675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8rJRzCL8/vGU1Cnds6wAoa9R/cBJXeGAkkZCjOz43G0=;
        b=cSW2pqHZ8t1gxzDXsXwoM3cHR1cx3IoFXZp4l2z3ua4jmJ9valfe2VZkid1TKKnQBI
         v/5HLbCocGdnsKYzIa8oLSDIAy8DJw704AGjtPJWEeyAOdFIe2SgzVRYnKLVNedIhPvU
         npO9pyQoWUDQWyFw1dM9YZXOLKjuLHJJ/0a6/E2UCTuA0jVtrf/aP81TF/sTIo11tPcf
         SUdskuwQbbCPFtmqhIq6qXZjWu1sstFec2yo6sY7Ra9sC0DpB5/4fIAVSfWTLG2KHkkt
         IWb8LgC1gRAA9I/VlgRvGqa4g0APLo2DdgYpNDF+pUQkojrXPSSp6db9S91zWqr1xYqK
         0WBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MtUvas6lHpJsHRFC83iOjWc0q2b2srZycTJSm4lnZK/wEaPczQQqQS5ub5ZeGRE7ACZ2TfWrBI+L/@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9y5ucqF1ptqJAkKnT83nEi3jD0/9UWAfo6AIV0NaedrD4RbY
	qDsLHsts3dsYuH4eVC6wW1OXSU2F3GEr+7Hp/cQS5LDw3udnNBTdsxvy
X-Gm-Gg: Acq92OGpY8hiA7NMdHgWCbIs5kqZvXSW1iJlyj+yZLEtDMZvrPGtYTGc4TZLltuEakx
	hziiuI2ofkdnBFt2Eins5YEyzYqlg20KG3h2H6FYK8RFt5wMBiu9YqiaT94lVgxB8DvbSaazAEk
	Itlwbd9TG3fS7c8WqHOpRFqPgwTOi12/WGTGOBkDOXLC2usMbREzqDnLUXNZnIkMmu5V9ryzBP3
	mysvJKOL4Z7YpAVy6PJFwrsbqWZ+KTDozHjFYzw9Sgh7Zpw71FG/Xz+b8PjJ0Y4V9lyH5cMNwxE
	uo3OA9n2RUwn0+lByAzNUchjkruO04qqb4zkB4qouduu4ZJ/Nv26oYDYVjTcEtObaHdEsd+8cAo
	dXNAJn9k71VM/5gqlTI4eVnWQ2RJzQSdglC/MMZq97nMpjtVjN6p8jNwC1vrsHgp0hWeVzlKS6P
	ull5K/V6H/MGrh8LXED6K7SDm+KiWb2pZ6cjVRYIr0+5L/KkQQITQD4AIEmGpqG1KacK/K
X-Received: by 2002:a17:903:2a84:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c1e85c5022mr288228085ad.31.1781086874701;
        Wed, 10 Jun 2026 03:21:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/10] ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:19 +0700
Message-ID: <20260610102021.83273-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 30 +++++-----------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
index 7078c01ba19b..af96aa446fe2 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -194,16 +194,13 @@ int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	unsigned int reg = get_top_cg_reg(cg_type);
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_on_val(cg_type);
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->top_cg_ref_cnt[cg_type]++;
 	if (afe_priv->top_cg_ref_cnt[cg_type] == 1)
 		regmap_update_bits(afe->regmap, reg, mask, val);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -213,9 +210,8 @@ int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	unsigned int reg = get_top_cg_reg(cg_type);
 	unsigned int mask = get_top_cg_mask(cg_type);
 	unsigned int val = get_top_cg_off_val(cg_type);
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->top_cg_ref_cnt[cg_type]--;
 	if (afe_priv->top_cg_ref_cnt[cg_type] == 0)
@@ -223,8 +219,6 @@ int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
 	else if (afe_priv->top_cg_ref_cnt[cg_type] < 0)
 		afe_priv->top_cg_ref_cnt[cg_type] = 0;
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -263,25 +257,21 @@ int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe)
 int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe)
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->afe_on_ref_cnt++;
 	if (afe_priv->afe_on_ref_cnt == 1)
 		regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x1);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
 int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	afe_priv->afe_on_ref_cnt--;
 	if (afe_priv->afe_on_ref_cnt == 0)
@@ -289,8 +279,6 @@ int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 	else if (afe_priv->afe_on_ref_cnt < 0)
 		afe_priv->afe_on_ref_cnt = 0;
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
@@ -322,13 +310,11 @@ int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	mutex_lock(&afe_priv->afe_clk_mutex);
+	guard(mutex)(&afe_priv->afe_clk_mutex);
 
 	afe_priv->apll_tuner_ref_cnt[apll]++;
-	if (afe_priv->apll_tuner_ref_cnt[apll] != 1) {
-		mutex_unlock(&afe_priv->afe_clk_mutex);
+	if (afe_priv->apll_tuner_ref_cnt[apll] != 1)
 		return 0;
-	}
 
 	if (apll == MT8365_AFE_APLL1) {
 		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
@@ -342,7 +328,6 @@ int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll
 				   AFE_APLL_TUNER_CFG1_EN_MASK, 0x1);
 	}
 
-	mutex_unlock(&afe_priv->afe_clk_mutex);
 	return 0;
 }
 
@@ -350,7 +335,7 @@ int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apl
 {
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	mutex_lock(&afe_priv->afe_clk_mutex);
+	guard(mutex)(&afe_priv->afe_clk_mutex);
 
 	afe_priv->apll_tuner_ref_cnt[apll]--;
 	if (afe_priv->apll_tuner_ref_cnt[apll] == 0) {
@@ -365,7 +350,6 @@ int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apl
 		afe_priv->apll_tuner_ref_cnt[apll] = 0;
 	}
 
-	mutex_unlock(&afe_priv->afe_clk_mutex);
 	return 0;
 }
 
-- 
2.43.0

