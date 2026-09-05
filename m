Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E0175A84
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 00:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569019; cv=none; b=RZobPMWDN2pPdmk1dGD+j/K4bpbwcCzZyP4BtJEDp9NjToXxFAS5DNCcMC4oXrHPBFvG4KZxBAQWdguds/plLiQC5v/Qo+HBgGapbm35+X8+24965PX/bIP+ujjG8Nh+TJP10F3M9j4qAQ0eojcebJpb/m4x9zEQqhGiWAOjCcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569019; c=relaxed/simple;
	bh=yjKMm6gChtVXHAw60HeDhEuMSDm0IUtrIFMw0nWgZ6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rU6/eQyPB//1xS7ODq77F+Zt92McIvL6fOaqNr17sNRDTwLLOYc5L0wvEt634RLwQOE0XoP5xiHgpLuRzEO9IVf2D2rK8ypKE0aAJOSx2KycviDqq0D9imbinz/SmW5wT9/ZPu0ev4ZY0t7I40DvfF16FQql5dTmylAy0O0Fays=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gs7836L0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs7836L0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1134773b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788569017; x=1789173817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IL56Z2E8ZfYosW+HWnzXHZbGWKRlHFAbG/aHlWv3wtw=;
        b=Gs7836L0+n3jLFCfisy04LfnwD/vo/tcC6nGO2pgV7QeQG1/jOyk9kSwEtqGmANeO1
         S6ehDB1pu/jnKqssjxvf8FNoSFfXB7v6enYK6X528umoGteyR11hbiguBNebHmiCwVZR
         NEcSXsBRNq6uw/UxcQQkxo81tDjwxGdxqH0/JHpYwxe/HNAA2Q3kNAmtSJgKB843VEBX
         hqMCOO5hsWBsmz703NgoLTak3yEELcwsAGAXMyKxjDlbMo7LCZU3C+IqJoYjhJfFR0j6
         vB2sm5T7mP7ufa2rnMmAIPRFGY2K1W7rfHDkGV7tQ0FM8R+3fctehsHFaSAmhLwY0lrc
         ki6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569017; x=1789173817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL56Z2E8ZfYosW+HWnzXHZbGWKRlHFAbG/aHlWv3wtw=;
        b=B1ZzX9Fw8I+gdz6O1kplIfj3yyVQWs6D06vljbZCwe3aD1NnYM95ehrRhBT9t9NzQX
         4lRPjBvxPbO6kDINPH+7Rfm56CPiszcPqI3gtRvNXXpQctqR/AbGsnjqnUI+63t/HmSE
         JvG99F7p8t776qeGxJVk9bSPfmyM4YRJ2QAFDQK68KD8kB1/jAUULE7KGi8cZl/Z3IXD
         prjrckgqVA5zPha6CXIlOYLSS5Gc/cnqggOHcFvsWfgTVbhqrH4PxkxPsoZT1vfXj/Ut
         XEZqTcbUmXIAN9UHDM6wqqHBY8VRrh1V4TcCEVsihHqi7JO4u0qYJus0JLVABf/wNo25
         ZjXg==
X-Gm-Message-State: AFuF++mFQnGu4emX4S1YliNZLLIn+ZAp5IDxEHE4DKulJQUneDJ3Fo4v
	WwD9IIm5a9KeGoCJGI0sZhV8rGMoTFvUO5f0Zz2s/J2dl0l4ZjgOYbE4qSVkrQ==
X-Gm-Gg: AYBFou2S4hcjXco5dXi+uVET3N6gKcchv6eZEU8MSekHbMK+kI8U7abuAhqQMKA/vkQ
	AT2GMGS8Usk1aYu+AVYwMNxeueyGxmS2UJ70WmuzxPmVdLDALYF3VHmNnsln7zXPU/FTIcR4BKv
	5S1KkfWVzKuHX3AvFIlUirQ2EkV6WvVoYtzNGbbtdZjetw2Hjvqvb0MRYTPmIwAnZvYqi8xa12h
	b2EfBSxmaVV3M1iYilY4tgSoje8FxKBq+IT/rFu+4cWNubIB87egYyjpUEYSvhxKxsx6W4JBs9x
	NGQcP3pbFfLwFCB3Ze9THO0M3Yef73of1Zg0yW18dqTAnpUw0vsJ7lfgcvR7y6p3fTi5/JV3pIq
	ZBsmUNSFtQIpAojjYB/gU38gq4AuXituU7vD2WYvRGh/vLcn9FE8/viZNxE8saG/1jt2Gtx+trQ
	8ZzTI2JAvWZfkfBVl7SJpqVe6y8mYqF9h5losnZX14M4sEZOILjXMM/BesvIcx+uBEPKV0StaLE
	ZPaG8siNOu/jGT3CV7dx5Buwu+vb7/28DEz0JVG3HW8u5XsNpTWpHatQwmXjCkUOuRJZ/4dCjdD
	qxf7P+hSRj6YOhxGZdXKLdmI0a2kF/iBIHaLHWCeYuw1mSsA
X-Received: by 2002:a05:6a00:4388:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-8616a266f1bmr13670831b3a.19.1788569016786;
        Fri, 04 Sep 2026 17:43:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d32addsm1673997b3a.34.2026.09.04.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:43:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: name regmaps to fix debugfs collisions
Date: Fri,  4 Sep 2026 17:43:34 -0700
Message-ID: <20260905004334.177074-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each marvell,armada-370-gpio node provides both 'gpio' and 'pwm'
register windows, and the driver creates one regmap per window on the
same platform device.  The shared regmap_config was unnamed, so both
maps defaulted their debugfs directory to dev_name(), e.g.

  debugfs: 'f1018100.gpio' already exists in 'regmap'

because the PWM regmap (and on Armada XP the per-CPU regmap) claimed
the same directory as the GPIO regmap.

Give each regmap a distinct .name so the debugfs directories become
'<dev>.gpio', '<dev>.percpu' and '<dev>.pwm'.  This only affects
debugfs naming; register access is unchanged.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 93b8a08b04b9..c57758019e92 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -599,6 +599,21 @@ static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 }
 
 static const struct regmap_config mvebu_gpio_regmap_config = {
+	.name = "gpio",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+};
+
+static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
+	.name = "percpu",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+};
+
+static const struct regmap_config mvebu_pwm_regmap_config = {
+	.name = "pwm",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -868,7 +883,7 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 			return PTR_ERR(base);
 
 		mvpwm->regs = devm_regmap_init_mmio(&pdev->dev, base,
-						    &mvebu_gpio_regmap_config);
+						    &mvebu_pwm_regmap_config);
 		if (IS_ERR(mvpwm->regs))
 			return PTR_ERR(mvpwm->regs);
 
@@ -1114,7 +1129,7 @@ static int mvebu_gpio_probe_raw(struct platform_device *pdev,
 
 		mvchip->percpu_regs =
 			devm_regmap_init_mmio(&pdev->dev, base,
-					      &mvebu_gpio_regmap_config);
+					      &mvebu_gpio_percpu_regmap_config);
 		if (IS_ERR(mvchip->percpu_regs))
 			return PTR_ERR(mvchip->percpu_regs);
 	}
-- 
2.55.0

