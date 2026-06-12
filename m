Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8933A4F46
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296030; cv=none; b=P21Rq+0i7XIddR3wgllasU+bKrKAX+y8OcbzK1CgKDtYArp/vVbOI8AbvrKKvVEYD2xwUsYKEgEsEZoYOQod+PNNNwAHngRqeQTh9Cf+g0733du+UmpvhNRE3OtghUxSHafoX5psuplTn9+kw1J6Czxt3EB5nSwLpDoLstXm2G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296030; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JePCr2tfPH0t8d0wXi3n/BAzDyI2SGS3ltxItde/C5/qJXAwYHjrLNRP60DB5jEyMGLqeMbHOXfdv3uJpKHCUs6vM+zVgFpiguIgzx/UFC1yh3MFnfLOLZeKJTy11/YlCwiTIfyK75DPNqZDNHl+2BbF0Z9y7T+r4ceEKYRGRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npXKP+yk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npXKP+yk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1216960f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296027; x=1781900827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=npXKP+ykQJbcKG8KBz95UF8rst7yKpaxGMIE0IdGcwEjxm0r84cCaXSgK3aSSao1w7
         uDneSaJk4HNu6NbP3izRvI3YuaV3K/Z8DuCntkBDOWcykNI+INjCaFdaAiSjXaMMDI5o
         9IRFSaBolxAMGYOYAKOiEJxHA3pQ2v+lQjfu3AuOkSf0gmTLAgzHuFSEmIh+5y0vb7cH
         3bGTkhl2TF6HUO6HlrlluigMusnM+XYC5HcV/X2bAnUobRHx8soAt0plUU2oQ2/eTM+b
         2T/tgnVw7QwWALxPIbratGmUwfgucu7+tGlTtjK7JzMZdOOrkhLf/Z4SsNQ3W3ZqniA4
         /Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296027; x=1781900827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=Q8jJAh5oFjdn+EVSammSPz3QeKbNtu755pLRdu5uG4OWpdKD9Zoc6BnliSStUa+Ysp
         z6pg+Tlh9xvx6iqCD4Z4iF5Oq5JRZsQQwBqwkcL2cayVNLv4rE1SGxFD3h6U429pXlxb
         T67oM4Czm5l8ZWlpvR/o8AoblqKUwPFL+YYOwieI4MUcIJgIXdYhMVAQt59REnbMwwn0
         QWbcLAS7TCc2+Vby8HKV8vrLVEXIEWG02ZLE3+mjDl53fstI45Q4sdgurDNxYiO3Sitb
         Xphj5rGXK+30p/8ml9xlVXdlHOoGB2PjYmIUkk0Qizi4lZz9RZRbyRmVM+ANhA7GUaPB
         Nyfg==
X-Forwarded-Encrypted: i=1; AFNElJ+t403cXUs4sF2h/UOJP9iZnIQBB5iCQtb5pGN9j6W+gW1HTIKvB7u3DY52m9y3rwtpxbBP0VkYnY/H@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOEZoiQGClOCG9rwsypb6/Z8dPa9pFGsEYY9GBbiEQQ5Y1Pf1
	UmCE5NB+p6AwxzlXiqxnj433TBjEYfL7mVf6pi2jVG+EOxcS5gmdaG8q
X-Gm-Gg: Acq92OETCcSfvDMMYO5hnMvvcSBfFiBpiznePXIIj6ea1Ykrl5evcTyYTXoBC2Sc87Y
	1EYDOew20WXFq5U7UbqCVroMcMqgTTS+5GoJkI2gohP2keV9d7Yjmgf0TB5MzAI1MI8Kpwj6UD1
	YwmaqWTCSU2MClf1UqDCzP2vY/WZNxHwpbVOc+jfKjDof7tcfxTjRGg1sJun8qgPKsmKf7ryeyA
	CsnrZaNhpAQnIIrTd7D/0aCEI8PDhgWaHsl6c3P0JHEcY1iZFDbA3Hq/eq8LmqH55pVK92GQdYp
	96yrDPKYpjsg4grI0J+fRHdX6Yrd2gF+LPuwH9QEs+Nt+PX1efz/LcmUI8gIcOBkxpsG/hKlW9V
	n8Y+uS1lNyhy1N27X8mAmSDh31arM/9Hwsm6ZsDg7HWNDKKdr9mQtgUs8VvzbNS60WbahpW6PlR
	pyprE0wypYgatEAYBi
X-Received: by 2002:a05:6000:402a:b0:460:f4e:a481 with SMTP id ffacd0b85a97d-4607ebee2ccmr873998f8f.34.1781296026959;
        Fri, 12 Jun 2026 13:27:06 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:27:06 -0700 (PDT)
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
Subject: [PATCH v6 5/7] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Fri, 12 Jun 2026 22:04:10 +0200
Message-ID: <20260612200717.361018-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
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

