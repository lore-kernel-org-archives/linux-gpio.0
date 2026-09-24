Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EB3386C08
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258588; cv=none; b=IBv2pPFX8Ce8ujqkLHvV1Jtj6GO4ynoISFHbCSFYxUWWlg3SIBaXme/3jWGMM3JHlNYLthg9Qoaiy3b800TJhAZkuXJGxt369sfPmBeNvHHouFbf98KXzy+67rYtEiX8GYSLwA+M6ewgiDdPU6QbeA7IfCGzFAE+MtBgkondX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258588; c=relaxed/simple;
	bh=vgPaatv/nuuMB3kArXx0HJa/hPvxZmi/7qbO2VHTEFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSklHk7kKjaCYkG9Ik46j+AlIy/9Ay1jZ9TcSx+ZdBJ2Ba+oQQDq1W7umdo3XUVzFpvqyWzCKOG2ZX3FKn+oqJJ98VMwCvQJCjW5Qx+wn4d96ZcY7M2HGCZdEx99Q1W4e178CyQ/UJabdClAsNiSaUtVJGGFQRc9gI4kfGpLgPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gs3elWvW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs3elWvW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so858122f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790258585; x=1790863385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=esKDI064jHsR20UuoDXImNuPdjmJM/k8p4cbmXH1qsk=;
        b=Gs3elWvWKeRY0J20jtnX6+M3qmB7nrZ4L+y3R3RS5wU1TlH0JuMe/HeYnT0Co60uId
         Qn0durQopaYBC9mBGoP9CZQuAoFZzJbV/Jmw5CnBWbD7RqRL4iKgtjQTw6k/6I0yJ63D
         tobNWffexYOrQYfaVxhOEE+8lQNcbRvohb9VHxsHVCfRive+RSOsKwvx1NeVone8U/Sl
         V21W5V9y3vm3WRkcCuB4gQc+p4QgsZK7P8z2iHSc6iMPL9PmoijeDEDEZiEVzRQgd/HK
         cmAWr0l6F5ZC+axDkyw8Rpd2as/yMUVEuK/3DwAaVT/+dmk1o/NGvSIjRmnZZCFGBydZ
         lihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258585; x=1790863385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esKDI064jHsR20UuoDXImNuPdjmJM/k8p4cbmXH1qsk=;
        b=S9639Jr8CDIR7Qk2EHhgWm6ggIgPIjt4vAyifwSbe6fLXyG8gi+S2FyOLdI78zcVRP
         KBZ659xuVs+g0WOWtRWc2/PmM0zTCzwag2iQ02y3pzjcdrPtK8zJIJZerFvscKOyE1Q4
         bdqO6guxCcgggKzSCJDbzDZyDskoVSuV3EDazthZ0C3nzRM4gJ42pJtuzQn4BIjatecC
         dBL7rQrGnPHUq2L4d9nznfoTT/jR94NiNv+slzIh8wftWdxGLScy1lkDPCU3h19fcqAU
         5CKqq4EprdXWOgfpSJehCE1tccBiih0m3YwWjhLSaeiwuv0JpNd1xNHzosr8Ed/n53Nt
         uttQ==
X-Gm-Message-State: AFuF++nJ0NjpkMH7yyI41B+NgAyy+mhn3c3YPbhBxpG/Kjy45EuUGnMf
	3oQcaeYiMCbehX7W6lHEhNnkT0XGz/5tQR13m9gjjzwGtDyyTlmQimAI
X-Gm-Gg: AYBFou1cJrZ8OmpnwbX2N987i+TUXoXUd7Jv7s2eJl2cznPNL+zc1eg6epBVT0rP0Ri
	+lHherm19KNAweVDtaBZYdyH4FryZA7ESZUVrLsWVnbfzC1jCHrzNDkHASMmleM9gtVCNWD4iAr
	n6WuWbUY5uYYMhZ8OH1RPrSJAUKK0tovtz8M/mFvOxlSLBFS2rNlLAEq81w5kGOgYc787GXARuE
	NTloz6TV3PRlnAIQ92DSekwvR9BgMaxyJnlYnCCIR1GYfYiDWcRct7F137KQ1sHdU7NVS1TOO6+
	gkily5JZSIFBtQVw650BdqqXOapPuw8o8GO6qN+a/BPBAQXf46Kw8sSMNA49P3qPG2G/65hJSl8
	6FJM1+MCGfGzT8FerAkM53mxSyVudzYs6uNzNHz4oTWFSfysCOY/zBsBCdsGgWxqomBIKNVRXhs
	QzyEWClgIojvUkJNav9e87qVo0ro+aXIXGo+ibTYpFierA/+FrL7Ib1qkin2jPHObNXvuc40jLd
	15jLoGCrDBJsOfpH1F2H42ahh2qWXvn0h+wbcPT2JatCMVoZHLUtnSGPg80K6Ox34wyJdGii/PD
	tw==
X-Received: by 2002:a05:6000:26d3:b0:486:fed6:d7e with SMTP id ffacd0b85a97d-488716d3d3fmr4957139f8f.22.1790258584350;
        Thu, 24 Sep 2026 07:03:04 -0700 (PDT)
Received: from localhost.localdomain (host86-148-231-190.range86-148.btcentralplus.com. [86.148.231.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a247sm15542626f8f.28.2026.09.24.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:03:00 -0700 (PDT)
From: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Areeb Ul Haq Mirza <auhmirza02@gmail.com>
Subject: [PATCH] gpio: pxa: stop reading gpio_chip::base in direction callbacks
Date: Thu, 24 Sep 2026 15:02:42 +0100
Message-ID: <20260924140242.126159-1-auhmirza02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__gpio_is_inverted() identifies GPIO86-89 on PXA26x by comparing its
argument against hardware line numbers, and its other callers pass the
hardware index from irqd_to_hwirq(). The direction_input() and
direction_output() callbacks instead pass chip->base + offset.

Pass the offset directly, which is the same conversion that commit
566e684e70cb ("gpio: pxa: use new pinctrl GPIO helpers") made for the
pinctrl calls in these functions.

No functional change: the driver never sets chip->base, which stays
zero because struct pxa_gpio_chip is allocated with devm_kzalloc().
This removes a dependency on gpio_chip::base,
as tracked in drivers/gpio/TODO.

Signed-off-by: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
---
Compile-tested only (arm64, COMPILE_TEST, W=1 and sparse clean).

 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 2b5da973f51f..3ff21e899278 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -268,7 +268,7 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	value = readl_relaxed(base + GPDR_OFFSET);
-	if (__gpio_is_inverted(chip->base + offset))
+	if (__gpio_is_inverted(offset))
 		value |= mask;
 	else
 		value &= ~mask;
@@ -297,7 +297,7 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	tmp = readl_relaxed(base + GPDR_OFFSET);
-	if (__gpio_is_inverted(chip->base + offset))
+	if (__gpio_is_inverted(offset))
 		tmp &= ~mask;
 	else
 		tmp |= mask;

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

