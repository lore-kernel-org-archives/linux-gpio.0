Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517871;
	b=vGKEBLfiZM9aUqJt0e7LdLfFjCM2u1SF5ng4DnhOvi+VeXk8H7gbHRx8ggTtSUcC6niH
	 nYf3yzMt+WeUYguuWxxGUp7Bv6x2Q+wYQQz9oKi7AGvBDPZ9c3OqBlv0gcAfn6t/Z4ITf
	 v7LdUG2wBKZppquqytfHrvMWm1JdWq4JPGyPaYhMmfz3I26sRGjQHljwcFyga70zmpRrM
	 KAcNN6tOMzYIYEKldPitokjPx5TCxxeAGW2qCM3WiTeLWzPvgppV/p1rayn54aD3459j+
	 vY8UV8vMnwRaQ2SX+JW2zsCMWEnGeCOPI3ihIwVXhAN1MGdUPXI7W7HtBkXgSCrd70Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=LGV8uLZo4OXVENNIZCCKYNBbJxUJrXrAWXAh5e6I2fRWa3yiT00RtRdWWIVr/Yjw0zV/
	 PN+rEmn+Kol+60JdaOKpxoyn1gInmjlkuFrzu8caeMR8T3TCwguYKPFTDc6CH76uaBgEk
	 CU5Po8U9Sh/0U87hxNhJdYVng0SntL3c4L/46sgFqSWOKqByYHm11APv0eJvkpXqzAqJ7
	 nJEaW++NcukQ/QOdsp9ysgBKzl+jYYAxljwgMxZVA5Uk7SWnEv/SPWiQcQJOWTnRmDaNe
	 lAW0giMhW8tkk0qgGDD9KU0S3WKBBBYSdB2EcUDDj4NJPJzLOnW2xcH63Huv+lHAtmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L48N4DES;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C560A2617
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 17:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4C560A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L48N4DES
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so19999135e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517870; x=1793122670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=L48N4DESJPMuvTIdKy+bXJAL0dZnouK6wG/XF2R1DWSaZzsOTOsvBy/sGuBN3pyhEQ
         QAxIwReDLqmluK3WkWr/pb/iKA/CgH9xAf7bJUntUWGgIwRFGBOxJgAffbyEapj5s5Ax
         Q0WNz5FmO3zq1gD0DL+xeT8pKuIgd4ffIHSk06vnA1B9R6Nf3BwiTdapE5X7ZjQTSIbW
         IF57BlZ10S87JVLWyj5n2lu6oSZlmDckSMXEd3+A3l8+OyjNrLGxUK55CwPTE+OqhEik
         cKpe3KC2ALiE2wEBsknqgggnq0gITQtCLCSXTFp9yoYlHP7WAlPYS1LC9DOmKC+1cAHm
         BjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517870; x=1793122670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=Hwh4wQN/yS2HatZngFsFOeCJn0nPVzljAin73zbpClfZ5SlSDVLvkxiuUNx9/r0e+9
         9YSz4uUgbSJc6HuW34sjrwDwFVxwQ5Odpfc9fwSebSCcHAdry3CZEAtRLxW5tBF+bXgM
         b/x21x1AgohAjHoEeElp+2diMwjrSOOzIuA0h2BYS4BxEJFaxrEwax6mkCkw3zECJwAC
         YyHKFvPsTN/EzeM9i5jmU1JjvbfaC8kihJq8z8MbVeaIOYn49/ukFU4iNouIpQcctcQO
         0WDEmFTggTgfa/piC3QmTHHk9S3VF0f0Ku1SdWHjSxXZuFc2tOaIGQJEZDpv9H82WT2N
         gCJg==
X-Forwarded-Encrypted: i=1; AKwUvBw+kF7LBdDfBnw5SctCcdpPilW11bDccw5tq8nGYfOtfUttRucfaZVO+J+F0PZ5LsnqlMjtRwOl500L@vger.kernel.org
X-Gm-Message-State: AFq9FYIYms+ZY6QjQGmpfkKsokHIpqDJuTTeb0YlgXi5ddz2gIaDzvvG
	UcF0M6dq7OlLOs7xuX5k7XCPO09S4jzk2yZpH6o3pbIjzLz/+knZzNnTH/EmMJuR
X-Gm-Gg: AYBFou3a5MSw7wmSVcwPYFM7/gjW9B1ouUVWerD8VbOH6q7fBuIBpKm+DXjUunOu9tN
	PZfLEt0S7iV13to8HygR5Ygw7Zzc8Azk3rZhnBZPPUSsE15yS0tZXf8lA0lG3SAA2WYIHiqIgMJ
	wIE16fwjboWH+lEtB9ETa7RK+ZP8gX0i+eyHYjX/ofVIb9HjHJOT43to5xaiZgacknxKJuogqt+
	d6BubRB56E8oIv81XzFEABVlDSE/XdsqmSRbQ12uZbIi2Dbqa/Oiamsk9DlIRrdY/t9XK0jG9aR
	Gm7zU+oklAvySqLAdRtNHtyir93ljs+DgbHgV8q6qHdsWk+HBUsaYpH1AVbheuwQg1oH2drhber
	mSMMuljjgI8WxeOtLd+lRTe3+7gM2aeTC0G/YtbWBE7faTsnfdwyOWZmWPTldXTqlBsq8+tS1s+
	qJ49N3v8EVBkPBBcPmCdxoaUEIoEQmwMsFPmqXXHd+q7Y7qtqEK9+/my8dEhHXnX24d2fQRzkUF
	GRK
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr254696305e9.20.1792517869433;
        Tue, 20 Oct 2026 10:37:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Tue, 20 Oct 2026 19:33:27 +0200
Message-ID: <20261020173556.632798-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

