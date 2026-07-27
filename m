Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7A3D6CD4
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 19:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181723; cv=none; b=KfI/jwA9bE3JhqmdU4k+KQ+2iGlx/yM+P6JvENFnXDolXg8dI/d5fvHTPGAoOu0E7ui/WFfUcublRV8prN9Tep7q28pohLZvcaTpAdl5YRgjYKp0SLqiKgv3YzHwVAkb+wIAinHXvXc1/39ZNTF647zsRijibr988BNdIdWCnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181723; c=relaxed/simple;
	bh=g92HLocdRA/w3YM68miWwLxYb3rDVNqg12i6lFPfJgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnBDylSzqHnXCtEdEV1xQcmpq8vXsrhqNqf+5DageGX7v1XfvcC29dWVsOtjrRk8M0Z0fvhsbJH0N1T9ERD8S+O9Uo+ccQu2/jfs35REUPlKjaPjDazdeliZ3v51AsrK/pX2t6P/Mnhb/c5D6sMUD7Ht2UejsaqdfywYYaVmvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGe/SxxX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGe/SxxX"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3021756a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2026 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785181721; x=1785786521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=;
        b=bGe/SxxXJ6vAWNQ0UV5Dp/OvdyOSqYbucNlPMaClKCQpqzRvsEkxch2DHp0nLc+ZYu
         MScl1RAnV2PRnwBxMEXYPmF8HOwNau3Hl7u+zEGuFQ3ykCP7MvgOm8U9WWfalDZpXEWQ
         dcAv1IvWBeJoKMfqgaFSDrFkMtb3YY0xGZW1tIMapdf1+L7NTMkZ4GmtfRoX+3TU/d2c
         qOt82tCk5x6PUGDBmoMttY5a4N7Xx1jOo+E+6mdDvTpbjIyEUlYvkil2lnxz+UKVt+ta
         nnFn/CPfOhvmkSURe1NpqXYhDKWIvMWOLEXKkmwy6ouS6ytvSvwXNy8K+PoHst4CfOlN
         mwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181721; x=1785786521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ph9MOB90x8/rsIoED4kDLbacmQxfQ83Asvuv4fsdn60=;
        b=Z86AS5OdigOFh9sUeHjy0R2GeBXNIcbsfmz3tiEYufNbwnXIpqH5IHT4U7+CxG+BH2
         IW2elPMQAxO4ssP50SOO8snpAruUKCXeP4gq40Fb9TSdDAw/WNoIBm0F8g59IhnerVZG
         gBeWe+gd9ovL0cYCRS+U/+0CxV4uMHO+GnkaoV3mqgIxDe7HN5fCAG0vWfnqydMzw8DV
         PDSCWfri0ShzP427NjjsJ3U8ANbfVxx0Hir3Zlgfqnd8b9etOPsyWCnvk/eJEeKjo+gy
         F0vrlt+kBEb7smFipVBqP0wKZVWuT/12Qf6Z26lzikikEUj5aN6IjpIIwX0w6Z7RiVCb
         Jbew==
X-Forwarded-Encrypted: i=1; AHgh+Rqdq5aqCTbzxADezYlComNZtyq0bJGVncek/gjBeh5XYYJCT7MfBDnCCpkIdGcmOmz1Fk7AzL7TQCaO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx012Et94xjm6EnORhl7pdLoe0MSO63pj3C7W33BsdHtoAPZ0ND
	LwLiCjBE84yIgemDtA3DgcmZR+WKFsLVocqmius4c2HJKWz8HBXidURu
X-Gm-Gg: AR+sD12iOCHTg6Gn9CrLMmrgdtws5j1dbYNf4yD9+5y0tUfoVpxPGI8z7TRZTbwABB7
	dKHvn1tUgZjnucCa88CueG5zfB9d2qQcFYfXs4kyvrd+TiiYMdFyDoAv7nSuT0uGt/U7M33MTj+
	NaS92ONcZwaIALgvxRJqotmLaVR81g+SZ66prFLXBAsc73F+QJqkuR+uViD9km9FY0j/y8/D/Pb
	hTFpuHibGoM9rD2EXu7iQx4jccdbsI42eicx3ICmNxO8fDBuauYPm3AiFI6zY8m7XghBKAcL0w5
	IszxcxyJtvDrBwZAnNdbsQg6Z5XqU4WDAxAVK1P05M/iqqUDAQuLm1UbgODGvjwkTAr6ec5m89B
	O+S1gCeCiTTVurFN7nIUhklJCCN7axXPjHiIrdiDgVxtipQ4poPYj+DTHcSlPodgOIE8366C5Yq
	tpbSSowjpdzp8mdiNAsATvFuV0cugJkx9lMh+gD7b2HG0haZzvqaCsvRwJlldSm3rC93ei0KPrt
	832y6M/KVoIRRym6y2FOkg/MWex8+DpysyvTmvXfrfyZeONGHaMfePs5wNmKWdNb7qiaAaTqawx
	FQYzVLkqvoY56FRNK3Ft5fDCX5HmULtMyY4QyQ==
X-Received: by 2002:a17:90b:1c8e:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38f6480d1demr780368a91.7.1785181721391;
        Mon, 27 Jul 2026 12:48:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc71sm270847a91.11.2026.07.27.12.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:48:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SAMSUNG),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: samsung: exynos: replace irq_of_parse_and_map with modern APIs
Date: Mon, 27 Jul 2026 12:48:35 -0700
Message-ID: <20260727194836.11689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with fwnode_irq_get() for per-pin IRQ
lookup and of_irq_get() for the muxed EINT IRQ. The fwnode-based API
works with both OF and ACPI fwnodes and follows modern conventions.

For the muxed EINT path, change the error handling to propagate the
error code rather than silently returning 0.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 81fe0b08a9af..5bef230f5bed 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -824,8 +824,8 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENOMEM;
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
-			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
-			if (!irq) {
+			irq = fwnode_irq_get(bank->fwnode, idx);
+			if (irq < 0) {
 				dev_err(dev, "irq number for eint-%s-%d not found\n",
 							bank->name, idx);
 				continue;
@@ -841,11 +841,9 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	if (!muxed_banks)
 		return 0;
 
-	irq = irq_of_parse_and_map(wkup_np, 0);
-	if (!irq) {
-		dev_err(dev, "irq number for muxed EINTs not found\n");
-		return 0;
-	}
+	irq = of_irq_get(wkup_np, 0);
+	if (irq < 0)
+		return irq;
 
 	muxed_data = devm_kzalloc(dev, sizeof(*muxed_data)
 		+ muxed_banks*sizeof(struct samsung_pin_bank *), GFP_KERNEL);
-- 
2.55.0

