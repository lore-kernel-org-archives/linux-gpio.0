Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881D440A2E
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228814; cv=none; b=Exj2WPFcO9qEPuT5g5tmQaY9/YoRpmCrFqEwug8+7rJqvks0oD+OgbtsYZwPH3QaLLH+n0n6SL8qQ+rxkr3fwVyIEaZGI1G/JuhhAJHoq2YNBh6T5jJUJWuyeDOmHUlM6QBKuasx+WedYE/C0MUc+7KrGtl9mpqaWGq+pZN4f5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228814; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BX/DQ7tcnwC4jkIhP7kWLd8UJ2KJyIp0wkd4QzrSbbq8+eMnv/vpRftVcnr1IhekzNKG1i0m71L8d2ClWxJbhBu/1KbiJw3tL2NkeTAjuOMr9aKsiPp87I6kCrU+oSBnd1aakM7n79lCZ8E4aAbsu6/NjMV1ctuwr+Xi8AwG8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdDZzalu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdDZzalu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b966dd74so14485885e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228811; x=1787833611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=gdDZzaluIIgXwAkRazz4PGcNUtM7nInLMop1Ivt0lrq45hxnecRpAM9vyYK7wFrppt
         Jri/z14SFNtwRIkVKil7BQ7RcO9mNRmBw++11+aMDlvrS3CEchjwqXzpefgsw+/3RZ22
         LHDqNCreBa9AGhOaEXEJZ0uLKT+uSPno8GeQuVGtpAPOJbO5rd/o/quVyrEMSgRVdT5I
         QfOC+ObQF3bPNsTNClVXAl6fLBG0Jww+sUhBLoJ8PllZW1sA4HdPMPb+XO7VF/5SKJcs
         2gO12GD6bKoFavu3byIXK0uar9dUs4pmX5EZXufHnKOXfVbYZey1WU2wSGKngGwcMAkn
         eUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228811; x=1787833611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=CKRvXU9uYCiTuAMbMs8po+k7WsUM9L/w3Hx+HXZ0LnWfmMR4DVrPCrQ2g3QoIczjwN
         mdfO5k9B/uhsHz0a7kfYzKbLVJkd2DEdioK2E4yRaKZvjgH4P/V08Yqfg/i2n5eNr604
         ETo0WwunOEIhvlSw5Fdv8cxr+D9jUwUucmS8o+f5jQf2qLafB/ZUX6cJWiUgUD7Q+/ia
         tKeM3H6n2wI+YZokFtzPfp/i5orSiuKwA08XOiYiQuLnyPPnRT25RI5poZprjc7UP6XO
         niVnpxV956Cc4Oj2Nvz+mUke9p1OJxDw0xMo4PE/8flgN062awpBuaSh/O6VA4A6+8+N
         IJXA==
X-Forwarded-Encrypted: i=1; AHgh+RregWOElONwAMvLlYkRkwI+GvZHqn+EJvo8jeHItAd29n9H4/85OzwWymFsKn/lTnu9FHfpFVEOEevI@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOzCpXmHlbXb8gznm6b0P3iiIBKGQm3vBen9EARl+pzJ4r0Kj
	YfHfLW2HcnojooLZbwKML06D9xz3JxAVtVXRa09qyUSwgiitPwu2Deu3
X-Gm-Gg: AR+sD11IsHo4Ycu+a6xMV7dhgJiI6ySfDYF6zrcQwtqOb85c+IEBrPPcpdKEswd72v1
	zWHX3pJpSbs5fJOu2Vdj1yPVGYNmAKdCTbM0xifKdQfrAdZ2Hlv798Vvd/EC1i7BmPnHT5Ke3IZ
	TCCD9BKa7nOy8fohUd7fUYbuuqtrBGVShNFmV4kpxk9l3mBVne+dtbSqdtwsRzxaUwooVe/SiIN
	aT7DRt+Zm/cyQCltdSOANWeUXXGpcplbp7CPJNKZ5D4GQ5RKmMzIckrL6nmMntyPGoSAMvnytnD
	TAjhdiS05wMMS7Wzv4WUx9UdYJBfBIUdc/LMgYI2ZyavREOOlrHvv2CNeyMaNIljWq+uG6o5ZwI
	zjAPy+22szI1iYEypjRYX9h9mBRV/YK9hKSlvEgKhCofnU3PT2O0FsRtfY9jTr/2aAugt4irVEY
	FZ7Ks5shSUtmzdNTZ8tkGlkg0IGGj07mUEWgZjqiq/udEfN5FD7oEAjw==
X-Received: by 2002:a05:600c:3f18:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-499aa194df0mr233187165e9.4.1787228810718;
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
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
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu, 20 Aug 2026 14:20:04 +0200
Message-ID: <20260820122242.120039-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
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

