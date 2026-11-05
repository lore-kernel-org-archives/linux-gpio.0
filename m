Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908482;
	b=eiS5TimqwlwBUm9rIP0MN/MNVVy0v8JKGth2/EX8urlvBCxM9nuQAOWinhvsE4HegWHy
	 4ST8AJVea0mK5xMUefY3Qi18q+pQDyDLYoNNZrM9v8z3oXWA9kQOxdY2tvQdTtz6Qzw4r
	 NDzu6SezIhAH/NpWWCFJf5nPUod8LX+ElIGvC+oalUfToaBtltaoC0xuXNh4tADfASzp1
	 /QtqIZeB8t8FZvgjv098iBivtGBbP7rChztWZhJ+8VD+9Q7Dgs6lISXYEAsbCrAYbg1CR
	 7RAIbuEJYOuvEZTOLgQj5pWiYd2mb9RmK+ujNycnnioLqmCqQiafxsuq0ZnS/UhKlyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=n8AqiTrmlcT3jRiCbN+vxXiPvU3/8gsKK32JsowCYGN7t74WYh3/g8Geyx0K0jIW6eJ5
	 ptWq6afbgET8EthfUXW0laZKKri1riujJpsxZ9zJXT7Z0HYRRWOcXWIa+OrvclEVNrQUd
	 1w648G8kFrNPAr+DDmWin49GNeK7brnhpT+3GYv8PBXSeADXyMR2kOC3Dx0KoOGJY9v1c
	 2kUvKRlbN1RT6vOGCApMnpp8J8Ry+85PYuyFFgx8jtRfK1rGdl4z9iIaQcyIBVPA8pIpU
	 eEUSIJw9IG9qP/r9fA7n3OGvZR9kj5H6UYAE6R9UW4QLwYqwlSWwuNlqoMU6y5pPrhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mk74D3vu;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA618606D528
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 19:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA618606D528
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mk74D3vu
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so21198705e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908480; x=1794513280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=mk74D3vugzXXG3Z0UBbXjsO5vv9fwUFrHaLSmpnapaKLj59lrS9CIODh6FYPMUYZcS
         iuVOY6npIpTyECG3UKm/6DjRfv7Y/TDgKQ1AzFdDHjRsU0ZIkgyFcwOLF876FS1ICGvI
         ShCDrobFbRdiXrsDDMd+E8Ndr5ox5zt37iaWXNXgSrfPn9bC4VDrIuVqkGFJEzW644KS
         vQr0Yw2iDSyZoWugNjf/CoDAh2E9n+A8sCBFV/R38uNwSJQeE55efL7mlobvAzNnGm26
         s6XraeIyXitNtpKyEtON1RnF8IxIudfAmDMsnVB0ypomWp6eUkRr7KPemXgud+VYvlP5
         M/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908480; x=1794513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=Mn8mmWDiyLJoyIGkH3vkZzAA6xyB7g5vVZaPbxmQ7ROJid0i7JPXtad/gEFsi7nAC7
         OWfR4xGdIhwOK8GeAR/6jZAWZ5k8vaDswse2MJqNaiX4XyIUb39oizoD4gziwknOLDbk
         XJm8U0esAJayvxOfsOlFVHAwV0GRScHydln3KqQFBLZpK257Zm74AuV7hSmJH8xAEA/T
         bo+Tc5U95hnDVdF8Kgz1+g9qQeBJlGtrqJubMQZ/e0Qf5tk6lMqlhep5EDLsgP2Zkkh8
         q2+i82Bxt+6wI1GlWCXmU5I6Ylls3tSaUYvKS1ncc5q9Jrc+TzfcqoGktVcG/pmtsvN3
         WvAg==
X-Forwarded-Encrypted: i=1; AKwUvBxf8MnOK97vL3rXWXQEcsKwJjgs4Zoz6cbqfFoaJ2mXE5XbL2NS+Dfm1ydkOphfnFY7TjQ+8pX8jOmM@vger.kernel.org
X-Gm-Message-State: APuU4Z9iI8I8AWF0OG00YIjjXpazQZCtGPnjkIsmgzOCkZnqtgh1WHhA
	hHrsvW6KQ1aZDoZ5kqLOCoSuooo8kjhmS0w5pw7Xm+4mWGmXDCMKgiQs
X-Gm-Gg: AYBFou3HPsl4ZjjDHm/1fLEM2GN4oaQHFmXJ+dgG6maIOQ/MLiCc1biaof8VuRfAb0f
	GNN4weWLEL18y/3Ulzdm/6ul8BkqZZH69wq5Ckdd4sJRl5Kc3x08B7wbhAPjZNjliJWgAxxlbH+
	Wlm0YRP+eJAmT94AmW3e8uz3QpI7PYmka917SV3Wab6ABFQ7Ml+klQQK+eES0Vq7TPWuOqLmmAm
	okmxrOVBS/X8oHqhbGhIKC2y8Vkd0ehw/BC91us6jQZlN/B9p3SkO3waPlS3Oy4ZEQfO7H2tU1w
	wAlVtqBO5n8oRp5DUnMiiTiprKSqa6JnGm+m+F09BmgSa+lMOiouOizQ5UAvp35pNT6U+7p+uJp
	neErJSM2d/iNGlxNsIT6gysN+YmtxYtrOfJbn+uDSLD6VtVlHox3kMgswOBCHWgK5HKH/ksfqrE
	Ah20XMHLCrEUe1oDmubOlm25+7ugUlYmwbK4PJ83LErsrcqY+ob/a9DwpcpBOszajM4tOVy/OMM
	uyUV7g5PEC61Zm9YQzYdS9YKV/KFUOpE/KVgU/1RYgmXIQ09i7w6I7rNu6FjrLAGGQ8Nkbcc1JT
	oCgG5kpHEJSu/A+siLj0VCoK
X-Received: by 2002:a05:600c:1f95:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b6e063f1e5mr3032495e9.29.1793908480210;
        Thu, 05 Nov 2026 11:54:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 5/8] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu,  5 Nov 2026 20:50:25 +0100
Message-ID: <20261105195206.3440-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
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
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
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
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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

