Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3A3361966
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 05:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870308; cv=none; b=u+Oq00ABGM9G44FGNUvEi8yWlGQ91aFCRDq2ZM+XVDMIcxuT+sYCCLl/J0Y9FUBuojzj1VNfigONMgLJb/6fOPxjldKjknzTcO2UY+Gpm6oOiFwQEQbOgt8w1ByFch4sle26TWJxK1A5Wg8T05fQi+A8BoLbOJgFWdgSbOJlgi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870308; c=relaxed/simple;
	bh=t3nkXbnhTFYPV2YkPV6kdZre4n/Ql+gnsrnNJRn/iBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAjcCtwxZhd0XAh6Af+0X1UaU2k0oRYDEoYPQtT7YKXIPh3CQLGOfq3i+bymx7ZOGryWzLBxS0hHQ7RF2OYVTy1QQ0UmQC4kwvXFsby90agSrq3tsRvwREM3oRWZQjPTps4ZqVAPf4JiagMXd5fTmqS90j+IfsNTo3g5N22d4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX+Vz2RQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX+Vz2RQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso5621a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 22:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784870307; x=1785475107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54ga4ZHqkMHaUB1dGuwctQU0JL6wXRxmKXLS7dAxp5Y=;
        b=GX+Vz2RQ7aUy/KjldgFcZQS+kRVhDyVGJ4iAlELBDFqFFBfzxrOaDZDwZ+Y6a6kpjs
         04W6oJo32zV3gYOWaunnG4aVUpKDmURguC5TkBI9XIn1I4d9Ez+rfvd2kRsXZKWSsHaw
         rJkCiBrKwrEIUce/CEbd+zLs6o+MgBNL3uY/chQRvqg6zaCWnyihHl3xlifb+Jpd1Eil
         l8fL8/uwyynv43TwAa84bQlljJ9lKAiFsg/+OxzPb2bTITy1I8fE4nfpJiFOk3aMs44r
         /+XJPsoR2TKSpRpWGjoKnvU32yT67mzJ4Aud2j7bPRb5fTyZ+PbWA7WWMgJuJmuwvOLk
         qwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784870307; x=1785475107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54ga4ZHqkMHaUB1dGuwctQU0JL6wXRxmKXLS7dAxp5Y=;
        b=dN2NhLK8Qs+mb6XCL10bvTzOaCVOXwo8uuszjoVQ30C6lApykmJEAWQDL3hYp6Hvpi
         tDCu8r8jdWXk1RX0TMmNjXyPk77PUIsT9CYCdQKOE9Dtp6klW1MnkhO1JPNpPXdy0tws
         bca2xG5ngCtqbqkOyp9rbbozbheshlZq3qfCOHhoDF82qOyNtWSD8iu8iu8UmaAOl44a
         n/SupsWrTLpA59SsD8U/9tkuYr089VLxT7g2NkzJRWLdM9u+Umw5cq1v2aG9c4fmAxlv
         qSYh90dMCeXVAPMQsN552BhtS4UvsT20kMXVKuSwCnF9ExcL9/173hQEEr2DyiXt3+he
         eASg==
X-Gm-Message-State: AOJu0YxuL8a3AaM/IM8IVLvnYFStjosAOU8k/F9NBtdQFBYjY6Y2sBID
	aMiNkaekU9Goy8tcsTZngq5gNJA/rNVgOspI38F4EetGN3nvEHW6jZBBk08AKQ==
X-Gm-Gg: AR+sD111t0jTLBjkiWIw6dF1yw/h0bZRgMfdEmwKAWB3gAkzwM3HCSw9qiOl16vtWCQ
	p0VSJzsBA/WBj62xDLMchi/HtcHMF3H5B8xvyM2Ly50CH4l5MZD4voO7f3B4Yp85wsFsx96rnNt
	P2X00SXxpXTkWScEJDGovLbXaMof7hCO2mHqXlMIWYus5XXwJyCGw+e9UecnWlV7hjOHLLC0mNb
	83zC/cQOM1lyxPNf/+yxohjEg5ollNCsf1qnxyLe0FeMRmyfWojm+cKROgv+j2apl3TLfkjUD1n
	gxyNfnyejigFmf5x7rjouCtaDYJcy6cdihzK8Z3V7wYikT6xeRNrSg0zlBOF5cV11w/074ConVu
	KdITNCV4Uy6O6YVyjkdgHybSNSUVUyp5Fi9Ni456JG9A/kb80rSqDTKF3kRjk5NR/sac13zMj4+
	vqbS7isZDB+nB2wwJUL0O1f9ch+QbR4uV8/PyMiLDbY+YpcJ+e+f5qPMDLKjfx7EZ8
X-Received: by 2002:a17:90b:3cc4:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38ec65793a6mr5859291a91.16.1784870306909;
        Thu, 23 Jul 2026 22:18:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm19974430c88.10.2026.07.23.22.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 22:18:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
Date: Thu, 23 Jul 2026 22:18:18 -0700
Message-ID: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entire of_find_mt2701_gpio() function as well as its entry in the
of_find_gpio_quirks table are already conditional on
IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448). Remove the redundant inner
check.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: no changes

 drivers/gpio/gpiolib-of.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 940b566946ce..fc77cf6b306a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -629,9 +629,6 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 	struct gpio_desc *desc;
 	const char *legacy_id;
 
-	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
-		return ERR_PTR(-ENOENT);
-
 	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
 		return ERR_PTR(-ENOENT);
 
-- 
2.55.0.229.g6434b31f56-goog

