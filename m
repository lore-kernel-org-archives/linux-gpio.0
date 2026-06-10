Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E803F5BEF
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086880; cv=none; b=Foyht+uLl2vMJNmJ6twaGNWu+c6qBHtJ4h5xzQzU4Qhgrxggrf97+byuHYfAui6RcTyp2/vH873xUU3youKUHWDIZ9jM4x2wBuMaSKE3rBmFwADQOjKqliiszXkUKLDTHgneTM6WkzCxHY8U8lTu3IZEESCXVKDdYXaJycUT9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086880; c=relaxed/simple;
	bh=jQF2PD5Ek55INuzVksah+lqn8zIcy/oMy6ahCFURIeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khkwgxsYMO07pHtTEhysCW+0q26WxHlUKgtJq5eN2ZMVq0SI38EFEpQg0Yee7iqD7i8WIEOeDU5jyzoK5KaiNbuw2a48SwiKbB4Lkj3vEKdaBLAmLiddU42DIX95VTS53xZxH3625o5UDqphq3dyy/apDndfu8UMi0npLyAjiCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNtkXmE0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNtkXmE0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c2a68d01so44386525ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086879; x=1781691679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=;
        b=mNtkXmE0wdEM3nz7SZalvd7bHgjdbSCRB0ke43RPR+SWaPiVIdAZDjuP18uUJqCnrU
         Woqyv2pmVx5hBxqmbgi9yIUT9gi+Ap6QnexzBhFeW/9BLl7ub912Q/EN9foskObM0jLu
         kMnlBQC/MaQ8S5IiKPdjCW+mKXxC894ksvhhDJgauAmdwxh1kT68HGe0bo2QFMUcdIVA
         MuIhj3NgOyARKYTXCWd4kGgn/wdre9QKgZ8SIkDifspoS+zofQ1ihHsN4bTpRTn7kTkB
         j6ZFniYt9d/lCu4J2zvFSkUVaAGZ6UZjft18H+eUSF9yDHdUtDD7yw320kulD+oxxa3T
         YKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086879; x=1781691679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i8yD0V3JpTBBCPvBkTEEQc4c3oKXbaRtxhAPfIJqxXo=;
        b=aJA0DuHoPDSy5TE0vMJCA+z3K/aVCIROVCwvbx+xe++IBCzpYDFHlh5X6NLwZXxgc+
         jOKSU4uWN9E8n/wkebkmNFgjwMZfmqIx/VCJkGMdvEHTnQe+FJGAI5xrkoRZq6AMvuls
         Sx5RvRKcUUanlm4FQdPP8rCB3bbERXitCiPFAGQRk6DqLM5gEVN/4y9lBrXDWAqvD8cW
         FPQQLcnI40q/1xc3PlVy2URBhbVUiDlg/0T9iNfdXJj4Bz7dK1PiRj/efzwO72/9KOWl
         jX89yKhItJMIyWXVQNOW+SDvTKcufBT1WNOdusLw02Wpt1Adrfo7RmmAo9xLw0AXPa27
         +8jw==
X-Forwarded-Encrypted: i=1; AFNElJ+STK1EaMfhLnPh6gfv2bE3ieW+4wMWz3rKKzVs2GINE8b4LWTwO8Fn90YZ6X2dfCsZP4Fmve0YrBwT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3X0ZzRNM7EJGOxicUHT0Fgwszv8PH68XUm9KrBYCUlDhSTNMm
	lCvqa27rUTrJUMV3XAqXShvn8mCkbJXUvs3d/nmFV1xxy4vJ6mow1YCH
X-Gm-Gg: Acq92OEEIkvdsMEBtzSn1OF3nhBEdMb4l9l/1hWcwy2VR+6C96Gzc3M2aJnxV0AEqWg
	zkB/ORLbhm1vsw6weSzoNAio3BF7CA5rWgR1Q+ZMCHP7ANPL6qQ/YXhOs4pjJmRJ75LaaipVVxx
	11arUvwXDpOMTValnPqEvq0C8jQQFiKVf2y0k1C2z1pX7Sg89DJdqRk+ZI8aXNHEWLzIffWsqor
	qH6MdnlNBrn55ps5hh+MbZAWlIG8jeLbDyjL7x1iYS2dGC1OfLH/FwcRO/faniQU9BDXk9Pegh5
	qGf3qsQzIpzDmKWhjFv3kV8s9aa6lOYNVjyxex1FC+yvjbqZwu52MBjV8UnXaFF6jjE+vLpcYGu
	lRCffPq7AtoHRA/0ZC3Cg8TI9xByD2Slvyi1XZ4L8DKskaX6045Qqwe22iBXov9uxyQSZAWdxM0
	MedKJLAUDdbuZ9ZBoBusy/fx+ZXyVnH0vf1xpVNZtkk7pPxlGyL0b2NMqAZnkvV/q6C5dF
X-Received: by 2002:a17:902:da4b:b0:2c1:f262:494d with SMTP id d9443c01a7336-2c1f2624a70mr252269075ad.19.1781086879138;
        Wed, 10 Jun 2026 03:21:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:18 -0700 (PDT)
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
Subject: [PATCH 09/10] ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:20 +0700
Message-ID: <20260610102021.83273-10-phucduc.bui@gmail.com>
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
index a04c24bbfcff..d8eda9e17eb8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
@@ -63,10 +63,9 @@ static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
 
 int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
 {
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	adda_afe_on_ref_cnt++;
 	if (adda_afe_on_ref_cnt == 1)
@@ -74,17 +73,14 @@ int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
 				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
 				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
 int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
 {
-	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 
 	adda_afe_on_ref_cnt--;
 	if (adda_afe_on_ref_cnt == 0)
@@ -96,8 +92,6 @@ int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
 		dev_warn(afe->dev, "Abnormal adda_on ref count. Force it to 0\n");
 	}
 
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
-
 	return 0;
 }
 
-- 
2.43.0

