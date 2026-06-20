Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A5360EDE
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985736; cv=none; b=WIgKHLdY+gqhUC843YdRJGN8cALVF4yrItZ3bDaGuCMxCfE1ovzjdSCid6pvgKzXohv6Ej/t7wafFrqk1TWAzIcQgzPRNNZxyQmgbLqC780gqfO31RWRQwvn2owWo+7l61dqI7Aop9t8lwUQ0j/3+T2/EQ+SyE+eTDaJ+60CPGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985736; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHCr3WNPsbkmdKeyh7bCY/WeAbW0H2UXCvUYT7kDtxKJXfY+mff3l17QVu3htfcNq8zouveKAr2irjtZd49GEIutmJ78h4yEhnzEXKi03p6OoY0zprDILDt4mCCEJhD2V9U5ICEW8q07znkZVSEXFTdplI2sQjyayuBDNwi9UGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTUh8OsL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTUh8OsL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-462bb734793so1989620f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781985733; x=1782590533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=WTUh8OsLs+xNh969pONactWNHYpmqpZtumv6qbzOe+uF2hUdlmZyzoBfweXKpSwtbx
         nBIQJgnn7LavsimXlXW+80AQ2j1kyiVXzELlxTDwr4iA5plY0wRuYo8z8iMWCAR98b3f
         QV4jGxdJy0j/rJ02X+gYQa9EIgsf2UpOjXr2SfNr77o584L8RJfpiavhdHAqXZ/GV7bu
         JEiNX1h0x998IlE1uNRW7ga40uBOXg7iOnzThvc9OhQAJzlQA/l57qX+i+QwqPf10MK6
         hl5oGPbbm+tBnnCF1u0H1jmaB2pnINb0OsyIvGmQr28Mblv0Zla1dzqeSkyvDoqt6Fsm
         bwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781985733; x=1782590533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=aw8W3dBI/rkWntR7+1FfwQ/rBHh8h5M2hJAxXGVu/bkavIYu3ZD1ysFFy6H1+M422V
         kaz43KwmIFwIAxTuuEG8LrsWiECJnlb/tHzjdRDchNBJNaToZa5smSEayBVsyom2VahA
         aQQ2vD8MtDERp+jzRbub8SCs86TcvzkvJs4DwyaCobvX33NBgjVSyYuYooD4DngdVoR9
         55S0V1XQWyVsT0qCt7J6VfbaAkeQDS4mkKtWI06er4pu18k9y7/wWfvme+1CNq7D0FnE
         sSZcOhbOIZNIRwTs4NIPaBuqhPzaew6UWmVHx0fxXrQqTuTWYEBavpb9Zr874C1TPba8
         QvZg==
X-Forwarded-Encrypted: i=1; AHgh+Rqx6VlraiSyD7rk/3XxLjKiMB8KWgKjqbSJG8jupNKHrHN3diS4kZutjLVMXGnhasIc/ea59LhIm9aD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8Nwip1ZA7bw6EgybrqQYbOj62dZuc51B7fn8StYvUXpqaTVT
	noJolJRBXxSm7wjUCtcb4Zj1HyZVu3EedkjfcVelwScSKKL9VikILCck
X-Gm-Gg: AfdE7ckwCScemfE2YbiNx8Ppjz9hrQ1bO7eBrKi0T5p82x1NhTMiS7B44T5gJF1vu31
	ZkJwRgUtlYgQxUp2R7uEIXko37/1XJ+0D8NT/PFtaGOW8zodegLJdWpm6RRIM/9LdHd6KS4//A2
	aQKTUwN9SDRzcb171uHRETKmVdeZuTo63LbRwhA7xK976QNi8uvwKm6J4Yc6ZqZYyVRPQ2cAJaj
	RMVin7qN7rSIXLn+8Tl725EEy4opKR/we0/QgNSwwmaQqNu9NPKLReK2V7aSAvLnAhU8D/eHaSU
	hzKLLYrhdN9ut7RTa6euxFjBG9bC07YdpDuH3hC7MylfKsxFXtMvl0zkpZClYYGihKsg7BBUyY4
	KyWPhMfaL194YvgWRsXTRS0F+qQAMQNvBS1KIpHsNlnYqqDTwdVEGprZY4vo9exDf8tmso3zJd+
	Mi7V8+vyqDGTH8BrjS
X-Received: by 2002:a05:6000:41e6:b0:461:d369:ece6 with SMTP id ffacd0b85a97d-46662806a6fmr6772688f8f.30.1781985732911;
        Sat, 20 Jun 2026 13:02:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788226sm10708354f8f.23.2026.06.20.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:02:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v8 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Sat, 20 Jun 2026 21:56:52 +0200
Message-ID: <20260620200032.334192-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
References: <20260620200032.334192-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0

