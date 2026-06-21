Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301A275870
	for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782029900; cv=none; b=b2gDoS9kNe1qgdu14N7c/XaIfR4SAGMbliGpa1/azoHjjqA6vguqF3yutZhTMtTHv9uIJN9nuUt10HunnTDntJVCPdAeK4Kw38bLprTLzbLUweBDpSmqZwlWor9fPR1mQ4685z97BdYel/9AvJ1UWcCqOLJwzkKyTGPjLbGAiVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782029900; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZO+hRj5Ut0ZyGoXmXlJXx9a15XUoMjsPrHDOXact0dQSKwwnZD96IerT7jyC2/XkacaAyhxxrYdvDrKog3AOqrybihi2zqrTK2WxCo637xyt24blo5axe5T3HP3EGqruysm4kXt/jeIv27GlzchOB0Lj1Od1ZhFYnFmkaVovX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0eLtDjo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0eLtDjo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b9318997so23006875e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782029897; x=1782634697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=H0eLtDjo1M6DTs34J++HTmOYKpyPhHLh1+QF4GHZfdTgFP0VdggJs0p5ngDTQyrb8z
         jj01noAzjOVngeJYgxlVHPkeC1MYsLIGkGZU0hj3qQM/TLjn49OTd7Ub2CJVsoomDnZH
         yr0V+HL+w71Xm3vujFUK0Gtx3ZvKv6HDO+iA5iojOjBciaPgZZQ2om1ctumPKUIX+aTw
         zf9f4zfqnVewMo4eub52t15EqhPBxSSU4YVwNQEVmDczMrGLcDZMsB/sIx0DsTUQc3Lc
         kuDxq7MsHaPqATHMd14VKeLrFr2rgw8PgRcBRmmL4yov4AgnKzsF0rsLfU8XB+6u7kS7
         otQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782029897; x=1782634697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=c3UN6N+vasNQN7q5iBUcju+Cl6nvJlzK0rAa7qCrYvIhJ7YhzX1R/4+YM3hNEljAPP
         aHy4+m19Ie3kU9KR+qT6ozG5UtUidXQCx3Ve2YaLFadOhjPaedao91ejK+3yHoKpO+LX
         4ZbfMzKSbIojpWwFpw8v+c/iKpVd+EZe6MAPfciahCX1MKFwtphOJIIZM/UONZ3UDtZg
         5NIktWWwDKwCDw3KhqavFn43+8fC2YuwNIMZ0Ty4CoUKrC5OwQBq1gli0DKbbW3UA73b
         Zsc5cRGyA8hrn0i8H8Wrc8ncWOKdvgVoNiarvUNevFxvHGfWzNHmWVca7D5NdDDMZx/c
         1sng==
X-Forwarded-Encrypted: i=1; AFNElJ8cU6P0FZhjFfcsa0bxL9nu3bG4LVQj4CqMkMOfgsckye353QW/WAYGYDBIuw02W1V1s7GRs92VrwRR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2h7qd67dhk6y7XJzDwV0mXUvEs5j/m1YgU/y70rIdeGldHfoc
	QIbQTqaPaWL1JLU/K7bDNlzA23FXu9NOeYTz9CyW60beqkZyhsxHeAVr
X-Gm-Gg: AfdE7ckTvBIAvQ/xsRAJiSxjXfe68KzjwQqBBIWqdglCP4m0DXtpebc2ScRSw9Z+oqj
	j5M3xodRVK6aF0CaQatahwn7H3wHCYWb8RfdL0z5aZ4qCiKIWHQ1ke3asb2xLhDYoq9u1osKV0G
	F9PlfMbK99EotGr8RkETzbkDEBemjSo1093bBDIOS1/oC+rMfcOfRchz5w06SGNTlSWjQgUsCRB
	bDt0EGrefOF5fg6IPSDawlnCGPVRvIid9LraVyPzTTfiJeAUl0Xfxzs1i2nzP/YYhPSxeSm3Nrp
	h8RIv01gRjR3E5eQACWNqq7jXJT++X5H0FwvCxBI5xkHja3Jw1WOdaW/0oBCqaI7JHn3gBObrcQ
	L2B8+kK6372TiHq/GduAY7spmVL0pUrnBJHXf7BplupjyazMs/D1l/MUOkStMFtIBiI1cxGFI7+
	6s3thdFQ==
X-Received: by 2002:a05:600c:45d2:b0:492:1e36:85dd with SMTP id 5b1f17b1804b1-4923f596bbbmr163549115e9.37.1782029897128;
        Sun, 21 Jun 2026 01:18:17 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm194100445e9.10.2026.06.21.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 01:18:16 -0700 (PDT)
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Sun, 21 Jun 2026 10:13:31 +0200
Message-ID: <20260621081634.467858-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
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

