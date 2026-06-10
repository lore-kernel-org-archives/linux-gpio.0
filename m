Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4F3EDAB1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086853; cv=none; b=ZYtx+T88C7+dJDlCqB2N4coUt71X4chwQrZjvmntSjwj/TgeOeocAXZPy3eQtfiLG6Bxi4PbBO2TIp1I5oKJYkzzXmzzZ2CDyCiiUxexHLVrdd2wXmhG3Dp3LNE1/s+v3JTDWBSEPSaeo2UAqRwvGXaZ0TbcbM5FXsWkxvWJqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086853; c=relaxed/simple;
	bh=KeBspY9AIg02Ytfq2EbyAvwQn6ojORL2TC15EQ0Fboc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G81S78T3b+1c6yOoe5ec8r9dLAIBbbLbD6u4+7Q2fmVSJeTBTi0cxFXd0rWVUG3JJm0t23egpWJfmVSOxAlVMhrGKby+AhoeMmp7ejqfeg0sE3Zp1Ts3sUEtwf5jt4vTvgrM1hj8dvhSfZRoR36th3paDqcJC7PJIEYtE0chJTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFxe5dm3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFxe5dm3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso59182065ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086852; x=1781691652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=VFxe5dm3EMllgD2HBlGTZUTcoLA8KWjWkaSNLu91xJH9Y67wj+vd8thYuTyRw6OdIB
         N0IoyzR/ZAjkvx3rake1XKVT/YZ1RJJ6+efpsGQMEO+w/u2TyoXhUN7woepmmAm1SHZe
         cmFYvi/GxOzhPbF/HR65LmY0qw+Ns2UuYWSlvdrt7tBPxY7a6BVU+2mvWpXigOfgw4BI
         GLo/AGQw9O6IgFcQYm6z2aHU6PzlFdnWgDRavkfKXWJXSn8wHp9zbJbo2nd7rEvYnLw4
         ckDIhOm4MzAhmmmoyDgaPHFUMQAYqFBSn8FYKVdF7ltSR6fekWZF+Jo1+CgHV+EdEYhk
         ahYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086852; x=1781691652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzlwDK3twYbxesixMQo95pQtXYCM6WeotcCerlbK7ps=;
        b=eC8OS4yl/GvkcOQpcfx6HJmTt70DuNbKZPdA1OgjIy0Y348vGkG1znmqNTWj73prL7
         RjqkycKP/WG4lI4ACJ8SBDz8Ca7J95GPSmr1db7UsHSkitttQUYUkUA6QCN21kESM9TC
         qFPrQwv6fZCOEORvrKcJT1SkRNupDDsOjEu/occ0xWg8wLepHIJ+jdQM4dPGqS3JlCKc
         nZh9N/4Bd3T/5ZGBeGKV/ItnCOFt2K0Pb53w8viImjeLrIu3MZekDMRoo8mmor/xOHHq
         B4oA7IWD+XZjGZNa8SRFFb8Kakw4ih7n1UZ60GKeexQ/tLwECXVH7Pz4LnfxDDkjG1rL
         +f9Q==
X-Forwarded-Encrypted: i=1; AFNElJ80xxKh2TuFNs+XiDJ3B1T/XvFpPZEKa9AdHDS+ECUxSMDtUx/9R8V+VJiEpcSeBK9jmowm+fJCBhAB@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBBtic1EvL1wEtHQlmg955GaNJzCqG3sGi4zl4NdU63Huerlp
	aC6sI+txnGhQIq19+RnEhZINk5l5KesdlklNXAUXFcX25IMCNLR/PAy4
X-Gm-Gg: Acq92OF5TkJXoKKjZZECAldlrZGPpN1bO0NBFq2pbrFXON2uqLsDTb3aU+JYOUjk0WC
	RlOEujMPilTsfZqUIFdSvqrr5fOQd2qmOPKdsK6qX/EqFgr7ZEz+HquiDdpZnVBvkWaeAKsaCxb
	U0nme4joxq1G/HQ4PCjqRA3/1PU1QUe4Cuc6GF/0wOpeVeAQZKjUAnZXbjyQnlH85Jt93Gz/jQ+
	Jc7q6LJ29lUlG2EpvUdQ3lJewhE0rhSh2m7MsPAtt1FryNJnYcov9Ng0botOv10RaRPKf3IsJ1z
	7H1MCuTeSiQ236/oL5f8Hd0iJi+QLro4TF7+aV8Dm8qK8RigdfE9X0mtJ0e7wCOUmLS2kb6DlcK
	v5qF0Pdm9lIknJsEuYsn26/OSzznr3JLit9hStZp/ghheXh/Z6LIOU39UNRWEFObCnDA1cueGvg
	OyRmTWNq9KqGapp4ht2jz8fp3SGgRBrxB12XRNnsbPWSZsLIq+Vz33iyXO+oDshYtM4HGL
X-Received: by 2002:a17:903:2411:b0:2bf:379b:53f4 with SMTP id d9443c01a7336-2c1e849511fmr304782305ad.19.1781086851765;
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:51 -0700 (PDT)
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
Subject: [PATCH 03/10] ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:14 +0700
Message-ID: <20260610102021.83273-4-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 9e86e7079718..aced8e7e920c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -201,7 +201,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 	enum mt8186_afe_gpio sel;
 	int ret = -EINVAL;
 
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 
 	switch (dai) {
 	case MT8186_DAI_ADDA:
@@ -209,7 +209,7 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 			ret = mt8186_afe_gpio_adda_ul(dev, enable);
 		else
 			ret = mt8186_afe_gpio_adda_dl(dev, enable);
-		goto unlock;
+		return ret;
 	case MT8186_DAI_I2S_0:
 		sel = enable ? MT8186_AFE_GPIO_I2S0_ON : MT8186_AFE_GPIO_I2S0_OFF;
 		break;
@@ -230,13 +230,8 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		break;
 	default:
 		dev_dbg(dev, "%s(), invalid dai %d\n", __func__, dai);
-		goto unlock;
+		return ret;
 	}
 
-	ret = mt8186_afe_gpio_select(dev, sel);
-
-unlock:
-	mutex_unlock(&gpio_request_mutex);
-
-	return ret;
+	return mt8186_afe_gpio_select(dev, sel);
 }
-- 
2.43.0

