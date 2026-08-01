Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392B2F25F3
	for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2026 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785622216; cv=none; b=vCO+97/CoAI205M0Hejr6Y0CvTB1yfAhzg0sweJF5xMwnDOZBUfZ6Ah+2fgWeL/njLSacGpoFJqZ5fZAkyaqZsmVaO3ksnZEpuwy8WiHRuzBtJOTCZvFkQ4f1F0njUesx0cu9GfCFv4RG+Vj2gHcKpnaQUb+crhdCpbiBuE8BAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785622216; c=relaxed/simple;
	bh=v6FLlzaxvuRI+eKzcxTmVtfLmwaLXwmBPtv/mhG5j2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7Z5ul0cMM8U9YZ1WaBsqfJPKzxOnuoB7+MwkeFE32QnpSuRYOR9o+FwEmLXq71LGL6dAmNT0/1hRT463A/U1H4V1nxZfYo+aRP+K4kWg0ANrDCjxku8+r5jQQFXuU0A171vFEjIEwkHf6f4B0AY85V4MzeyjbNDDMN0/lP0/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sgdj550M; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sgdj550M"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92edb12cdf2so142238285a.3
        for <linux-gpio@vger.kernel.org>; Sat, 01 Aug 2026 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785622214; x=1786227014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxmLBep9DxGKAT2MJoLX8E/AhHBeKq4XjNfAEIUfYrg=;
        b=Sgdj550M7D+otKgljXfIBzFIMOggf/cLPgAEqzZLPe6/7qmU50D5mW8+Lz0ZItB+l8
         IgisproS7bdCAOxFXEM3CW75LYbPfaVVBGIb+kZcNabjXa43EOsTWuaU1SL6RsDqaeTa
         oWpcUdqRkwoKmVjSqu5lw74F0x0ZmutP7UUwdUbdv0cZih9BWYJx51Tk0csaTomIEXLl
         qCuTQMiVwNcbvaTRytreUDhA0US2xdkWNDRNpOkeKk16LjJkACGUJnLrOibvCjXx9kpe
         416MCe5ujK5NaZfl3E1lqGx7m7yTLgy5S2jBlVBRujaUZOwTx/W57OM3KOgrbOIPcKJ5
         boFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785622214; x=1786227014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxmLBep9DxGKAT2MJoLX8E/AhHBeKq4XjNfAEIUfYrg=;
        b=IsOc6dlVUkYfIh4ywOKjSDn3LO89Ov96/HZF/wvvqfdiKhe/OxA0qHV9Pnkr6jO2T9
         y7I5jRhVqrq7HJ9I+Xf1okDrE/sEUr+hAzhOiZ9jwxntWZ8HTEHEojbacUK+gI3xf4+I
         JzcoEzV6Wtp8O/svzajJG0LM64AKxr5KJiKgxBPhM53qWBJM7b0UUJ/vF3QANiTmYUyZ
         LZFd8PP/iyOrO+j+D9O6NBLqZIJA9SH92WVn5GrnIn232R786ucSdHi9dMIAkDNzhF5q
         PBERGznRq1kM8PV5QJCpRhBKCsVy7OR2/qnW/OaKetASNPVp+WWGyiKPN84TUJNO5fqe
         It7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq9101/V2yZE9muNafPZ33ec4WOwFuZK1Y8OkEnl8E7sD246ywyck7FbkfkyFrJWvNZ4S/mqbh19bQn@vger.kernel.org
X-Gm-Message-State: AOJu0YzStB1FqqaKPIW0z6NhPpso8f3pzLcI4szRuvYSthn640E3wo2i
	Jwo2ms9gfKgvAyMUVFgWVNNZnqs+qUnfJJQw2b1zpHEQl8/O3NwqAR0Z
X-Gm-Gg: AR+sD10BcxS6W0wKAqeyz87AZxgLavUpeWXZu8OzQ9vgEIbjG68Yj14pvehDRiRlZkw
	Gb/SyMT8ZeGqB8KYEUAgn2gkMoI5Z/XOpogJ2/1Vt6v6/rLQOjBi3UEZN3RU45UP9Ib6svWVffw
	FQ9mvOe7VYwmQLhY0x7GtMM+4F/9qprT8Q0uvhdsU3nxSnT6TTSgjwQS1PykNuiiOv3vpixCOMH
	ldTsgQ8RAyQJKhQpyVT/FctvNPNbZr5MbOkLQTyrz6Qso5Jayud3g3klUitwhfxbZkyTV5vHuWu
	LrIQKIw49qhEPQVrgnUwBSElmBlhavcuU045/YYCka6+olDRc9covKxbll+6tBfuwWq6OJMXxWo
	OT42o+sX/QaqsApGf1M88WRbBa0/xePCBjxrRBDMqIMhX9sLII59H60l3jRuNLYpucoSPYyKiRW
	XXlNA6H/ATiCcMo5zXCsVUJWpwYJ6fst4jwEP8vr90QzdxrJf7ORhMJ1mq9jkhd2a8RwNgtVXtg
	1aBgXaGFrH4lL9bsX5eGcCTwhUa9yN4Kg7z0rVzGjWZCsZ/I9TP5g5y5QGFO6U=
X-Received: by 2002:a05:620a:284e:b0:92e:db1f:185c with SMTP id af79cd13be357-934a0aaee08mr1071570485a.43.1785622213700;
        Sat, 01 Aug 2026 15:10:13 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc5ea6fsm350026785a.17.2026.08.01.15.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 15:10:13 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] gpio: mvebu: Fix optional clock enable handling
Date: Sat,  1 Aug 2026 18:10:08 -0400
Message-ID: <20260801221008.456426-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvebu_gpio_probe() ignores clk_prepare_enable() failures and has no
matching disable path for later probe failures.

Use devm_clk_get_optional_enabled() so clock lookup and enable failures
are reported, and so devres disables the clock on cleanup.

Fixes: de88747f514a ("gpio: mvebu: Add clk support to prevent lockup")

Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a010604e5ff7..095881603b75 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1153,10 +1153,11 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return id;
 	}
 
-	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
+	mvchip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	/* Not all SoCs require a clock.*/
-	if (!IS_ERR(mvchip->clk))
-		clk_prepare_enable(mvchip->clk);
+
+	if (IS_ERR(mvchip->clk))
+		return PTR_ERR(mvchip->clk);
 
 	mvchip->soc_variant = soc_variant;
 	mvchip->chip.label = dev_name(&pdev->dev);
-- 
2.43.0

