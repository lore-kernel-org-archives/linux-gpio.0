Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7C03F44D1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086872; cv=none; b=ujyZfbbM2QlVgacSRGS63XEtj9FSahpc0sKoE3tFS6gpAvuMNq0LWl6oAPYS6gppzNMKb0kbCkij0duJ0g4fJw9ofeSsL6lgV39f2PF9rup8m87dAzsoaEoVslOLeHODpofHBpFHeC4YylH+RQhWo+ptGx9FRFsUFz084cOp2J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086872; c=relaxed/simple;
	bh=ZJSPxscY9lLUpmbtR0ec8kz1X89O9gyj0lt0NCvJYpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUphlRGzGw+t21Mb4hUEILHMTVkgwVX0H5HCsSKkkt/UcL/ZUcVyJSw1Yv4NqNucZds1Yk2hlYDQBbvkN7w2foOnPVUT86FmGi8THhGFWpb3MrGWBxTPUe4NG0+HYh3IoWYlWD/DkPQ8U2viGColjYPMBhMiJk91SM0P5Jy60AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3PgyQrH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3PgyQrH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3315c5dso68728285ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086870; x=1781691670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=N3PgyQrH0ExfyN0Gbm3RPjfYhU9ZAb4fcsonmpa4pm9jy640WAdlnW4qkrl2IbjWUq
         DMA2enJqcBv6tv2yuc+OP0lfsYcNv7trZ+VYVaBLiv2wv/uaB73n+6H3M9c/NDg3amov
         VY3WKY7kfI90kKPuqGoe6p28IyZdHXFC2fj9VGQ9S7Qn9b/8mnpwPIgFhaQDV0U9Nf5T
         xhTeyM/ztIWSDGv6aWYftPmi9ybq3nCynEPlIBoMF3S4/Fy+0hsfKe2b96JvGry1FEx5
         whPqp6F+XjeXad9rbcSpAffgJTGsH0fwEsgdIGvrgbH3pKwQPEH0eO0G7XczNmsWGj5j
         27pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086870; x=1781691670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=PGHrhpij3hN0lN3U7JIBFqw3Yv4xjH4OopWSCS3DAtM9thWhTrj7BFEqvy18p5HGA9
         iiXPhl+/NykmFfMkmP+8WgpIU1bNxkmcR95Tnnsb2ExiyIeukBtOD1M6hv36fIJZH1q+
         MB99+a5oL/n3iMOmZzbYXCQjPw5r85XWIcsoC6c4/MlaUS81f5ORRfKitw0O7pOaj9mP
         cLNi9lw0SZbrR3Yu2H7NOK5wpBBrD0n04c0BTUbJtneGXrKgYHRTrRVYM8rm6JUWQtY3
         /JTcq541CrWgCNcz48PMbjtJcYBPTmhBjgLpY76VNQu7F0Fuh0aVdwUvVxI5jHysLBlU
         Ih5g==
X-Forwarded-Encrypted: i=1; AFNElJ/rqxA7Gs2zqf99DCS01tS91SUWmGIkF8UF6cUgq5wVi5ZNFYSvFmjtaQxDUOoE03bfaOCPpwrHsHP5@vger.kernel.org
X-Gm-Message-State: AOJu0YzIcIMy3Fvxba+plfDoMwCEnUSB+/OxRjo76xe8uMBKcdtjapuZ
	yU+nRb0//SAkqyRQT2lHuUPZ8spXmE99gM7XzwCrm6QrZgZbfysZozxP
X-Gm-Gg: Acq92OGJ3Ijb2M5hZI+mPPDxkB01y5AjUDADDzQoc6RwtFt+LCvLXEg4JBc/ig6B8hJ
	RiGFhM9adoAFbdEqyKkwxEAZnVKxyBhqRvJilGEcf3y76FN2WY3FblmmvL2cFPJyzpZjsQjXaTU
	DkhUd2xd64qx8err4U5QLJMR1GpSZmzudh/454sKFjqTwr4JMoOBfPcKpiRLCbNHK/svFJehwP1
	ERjHTj+pajVRYz3zDJw2qeEHSx370iejP1iMgfxsFW7v8IKBWDpIQkBxot4yCCIUHwImmbe3yIu
	ChSOMuXWBrpjVRR4SIb3FpfdhRVCsjcTz90AstOv88MGXDOH9b+4g8aY+kdMqKEt2FwV6o8AeOW
	KyHhMxKyeHGqmuU0c1L3AFQDvbx7tXcM+ZGvcjNRSmMKIdLJix/hru0T5Zz2kJYRVQnNC1ycA8V
	7XkFuwToqYcZ0jLpwGJHWZWPa1yYYHdR4DuE7kUl1OYYMqoIpqsSf6LVrw29XGkNVvxjGx
X-Received: by 2002:a17:903:b0b:b0:2c2:1e6c:450f with SMTP id d9443c01a7336-2c21e6c46c8mr212600175ad.10.1781086870419;
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
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
Subject: [PATCH 07/10] ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:18 +0700
Message-ID: <20260610102021.83273-8-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5dcc8ed26e00..1a20adb2cbf5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1318,24 +1318,22 @@ static int mt8195_afe_enable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	etdm_data->en_ref_cnt++;
 	if (etdm_data->en_ref_cnt == 1) {
 		ret = get_etdm_reg(dai_id, &etdm_reg);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		regmap_update_bits(afe->regmap, etdm_reg.con0,
 				   ETDM_CON0_EN, ETDM_CON0_EN);
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
@@ -1345,26 +1343,24 @@ static int mt8195_afe_disable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	if (etdm_data->en_ref_cnt > 0) {
 		etdm_data->en_ref_cnt--;
 		if (etdm_data->en_ref_cnt == 0) {
 			ret = get_etdm_reg(dai_id, &etdm_reg);
 			if (ret < 0)
-				goto out;
+				return ret;
 
 			regmap_update_bits(afe->regmap, etdm_reg.con0,
 					   ETDM_CON0_EN, 0);
 		}
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
-- 
2.43.0

