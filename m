Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580017;
	b=ylkAAJWqvhJmNhUAMftgGNAO/ljEDvb3j8d+iKI0k0t24184cRMgRHvoilmW7u1GcOa8
	 ItDh3jY8rug6VLTDURxazIga7qDFX8sGf8X6puREITJuYewKpI0gp8Gq9PaOm7XU0e6ZN
	 eggsxh/Ql+IDg5RE1yuTmBuuvdN3HmcQvrtUTsBO4mCWFofkd860YENiFakzwc5qccglx
	 yjCZZUmeXG2Gc02sbS2fRfPjk6iQfjRLDhUStkWKAfv8U4047otciY93iwtyoqSXDpr9I
	 2j1mSj6GH8i4e3w+lnTiCYjofkJnbn0wRTBl2M4pUQC8m2qZLPX7zVN9m/k+/M7GK0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=kQhS+C+fNebqOFSIqYDZBWNO5VfQUKBst5kfUXkf3BHQuqv3VNCc6RgIPqW+1UzElPkP
	 LCLFg2HsB8r1Uhf3fho8C+3D6GORLpfr3GJ3w3LxSLpCGdxkWP8KlUTxP6ziEcmhKzu/J
	 geh4gG95M12/ZkZcSOC7L5vNc+DfapHqqjOX427jO9hbXAiYaYru7+ogh3/yJp4ThaAUf
	 579IgUZWKpqL5kWvVqmlWkbPurn7qSZqNwsXzHziFYOt4G2aimJU9M+qtPMEbaEI4bV/e
	 IMNX+iTW2ilTVBjDxFe+HBF+LLCnI45WeFr14jiacryUM3QQ5HJ4A8t4d/3Vzi6jHbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqhnUmc+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B89606A324
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B89606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VqhnUmc+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3748945e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580015; x=1793184815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=VqhnUmc+IfS4dyLcwdf6o8jCet/Wr0E/jiJ3m3A47upXon3dtsVNqNWa67BzvlHBUg
         ctS27FXdI9Vsl+CAa7WYOzKIREPPU7di8eIWog/Ufj+GIrL+tg8tanndzUB7bHx+uhxt
         0JA3zlkJQxmu4y90tnFA8IGi9wup7y4n+aGLTxzHQmWNyaih7TvvP4H2cO37qcgB79oT
         KrAikpDILAnJbn6WW6nHFIcyUnyam7eA9xBRQ/ojAqAhpibdE3sCxV2qS6sd0FnAbvxq
         i4u4Fl/3EPgYMy1vfV2739UAO2TsCYI6ggwO9g5cPSpWXjmNe0zrB+BGOXoMiwif03e2
         +ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580015; x=1793184815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=jF6XKK5KLGp8jswppEVlZFVvk3ltj+wEmxjTPjIrLQoTf6vooLtevjktK8gsxUW/Pg
         Muu4b4/K0sFwi4dESA1EbXmre27Lox+Hqo7EH//5z32spsd4Gp796UCl+m0mx08ikYpa
         KU59ye1oOQhqGZfnKY/ed+xJ2KPt0+p0nzhL45Pxn0ZQeYyrJYsj4BTEsP0Ns8fAZMpN
         KvjkFJgcrg2agVRRsGfX1TNPB/9K6z5PZU7bvH81moTGsK3y69Cr4wSLB56YnZcUWZQ6
         qQVvkfzYjNah00SpXcPfnftgkWRlpIS7V+36sg2nW8aZqf42DKhRsb/FXyv3ztQt4He1
         7gXg==
X-Forwarded-Encrypted: i=1; AKwUvBy4gdg+JPemteNq82pC9Smg0n7eXSJ30qBhRD+2Ts/eU/fQHJMs+vR5eWo/9hPYqOik5j6IpNKKcnAa@vger.kernel.org
X-Gm-Message-State: AFq9FYKYX+Gl5YhXQ42YbQ7LyTue4zWP35uArIBFWaBA/1t3yxZy6cwG
	y4c2pautLGd0AT934Y+GUoY62ftskYbT6hTu4zPphu+KANlCwqCacEtI
X-Gm-Gg: AYBFou15uGT+Wmbcb1DZxJix4xdQJGHq8L1rXuo0lKjhGj6ipEyURqSlMcrunJn6k5y
	hUt50jv9s6dVzGAzANsl+ZKg5nxdb8jNfftrJGuuxBrxpxLPRBxZgv4qQDD11NH2Yxo7mRMmErk
	hVTPwOjVSU00iRZ75qmy4co7n487TST3QK5316QZ3ntThyUvuDGUvokPvUfKBbsOFx8bUzF0uVi
	jAPKnY/KQq4iQTjpHiaC+ygA+N8CPNyVKBJQay7guT8kDuvoEEPx2uIXmGTbkjafkOrQgyifcvt
	sUvXFa/4NmFBuyBJN2KapfrH8me6hjf+laz1M0Y5x8O+hHqqe70lbAu7DI0aU2pjokLvr80zsO6
	tk9TLqLVY476w9ngaUWRK+Ip/ZZC9241fvkPVrNrsWDehlmRjGolG2kg5hFmZO71/rv5eOBgWGY
	LXedVjgmElvFC0WaDzkfumbUvgRzEoqfdbDeuX+qE5/bsot+1tkeVghDJ/PgnomjLk86giGydF+
	LSMLFoJmfJj/t7hvWC8ba8ygH98PptQWoenn7z4rkvo31Vyw0/L
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr35588045e9.14.1792580015036;
        Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
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
Subject: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed, 21 Oct 2026 12:47:24 +0200
Message-ID: <20261021105109.199886-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

