Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A6331EB8
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 03:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404863; cv=none; b=tZnfiFVvQFtmf7+VCZoI2RRg2a1VTH3Xp6SenhJjLVN5/M39W9aSOY7e35uWdRhKdv4HNr+jCwaL1rI6NJ+g4JDAv/TTX0KEj+8JquuITDIIaci7o3LaKB7/H+zMWit7MlnJZlKue/NiK6yOZQjU5X0wSyXbstH/VDMbYqXJpak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404863; c=relaxed/simple;
	bh=OwY4526r8NGD41XWfHtfgvXiOTOjUHxMAUau6BxnM24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdi7C0NJYWyqjJ3G8GxZoQwL29CKCncSgDKbO+jllkAJUNAztcSYIDAXuO4tn+aBH/EaD4NyvE/rKcBUrom7gAzP1ZNrnsVbZUFDwaiN7HpDN1vEzbgt/WJe6M2YzVJrajuwjITjvnfdgb5UHNfKsVy5O6y46rjeTyd2yuK/H/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llycUH1B; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llycUH1B"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71a50caa9so24966745ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 20:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404862; x=1789009662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eY3y8kerfRWmrbbQj01Vx2Al4+dxXYV6MW1wD432koI=;
        b=llycUH1BJ0+H9IcgpXEdPyRAmtKgQfysEGSK4fXklnszKPMZkOLFACclMhQzl8NXAC
         UsK8Hb5AyKute08DYc2E2N4wp9i1TtAUMP4ZTRbYiqtYpr0yi3BP2fX2kBoP8bfzFW0S
         3KN9xIv062tfq7MnIo5gq2GMhlPqQugK85bX5+6L1s34MyQ9JfxMZ6rlMtpvT2I1eKXi
         8uh7Nvnqb15fsQ9BIBzAfwFW1OJJsEkPnd+lFmf6LogOdcJDPYAPcbewsE4CV9BRUzTR
         9SL/7dCOWhZZUtYUgx89xODgtd1quz5KgkguPuy8KTwXBGYE+H0BjepwUdtZTpGJLc4v
         StJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404862; x=1789009662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eY3y8kerfRWmrbbQj01Vx2Al4+dxXYV6MW1wD432koI=;
        b=JneIKeluiS6ADWzcOa/hP1cqpvioeMLfm+SJXUhYMk6z9RdtrsqzptBSjIq1khzTt+
         7tiDBC6Pl6dhEZ/us1aznNbCSnkCUMF0XZ79j27Im57MdsyZ68Zzn7fdS8AlrKdnmbJb
         tNv4+SIh6jTVSKAJGvGTQua4UeT9V+OpKG8e6xvzWT393Mq6yIjc9+63/EjzL9bYoCcl
         6HtMUXEPt9uSAcVRu/Q1Px4R8Gr+MN23B/o9kT12dD8lHoU2eUkTOOsmEE+TLEgk+6+W
         rlyOwApT3Knl5KaH5aBo/ulrZ/k9BIUGSSlEa7tsuMUMuyJ74QdfMCLbBBrKcAtv2B99
         GzAw==
X-Forwarded-Encrypted: i=1; AKwUvBzzCg4msgWpLUZl4JECyE+XAw7t9ttjYoQmZFFDIZyhY6w9JY6aPaMNAfasZKZ0PR3A6KBkt8wWU1IW@vger.kernel.org
X-Gm-Message-State: AFuF++nd/rr0KYVvnFm4N+K6uY+WXunuLrrT1vWTJ0h+cA2UxX5Z5Mov
	OoSnD4EKjq5Wn4G2TCtVrfLSfW+Yx0ntHxb2xCBfm3Cu6UZZbFtOdUFw
X-Gm-Gg: AYBFou0PYje0lOrxdi7t7ILDLAwjATn8PdlF5DXDzuIl+bAtWfw0fQVgIMB8udpQIrJ
	d7tWoFTcO++vThCF9U5Iotnt/1mzPOSZcStE0SXIRXTxegWSa8f8BPjwRBH/CLT0Djb/uOD4kpB
	Ng4HibOERWunA8UESDFgZa6jz7U2TGU0cy9RnWw/P+TG7G3ayoj/Q/zd+87PbrtM92IO0KSg2MZ
	egULC90EIewBeEAhTBzfnO+BEfUNiYJtyfOY+JF7JxSn3pN9zeFyJOg1I0QkMw/Dr62muORPknQ
	j/nQjljI3/5cElmFSGjqWqzZbMQL3spp3lF+Mv2meHnl6MjVIvj2ioIfpiwQToa6ggY5hXzghzY
	Y8S0RLbLYp5MZ5TZY7nroM9byYznStN/e3DfNPFR4XGaAlAzbnCYDAnhtIUxWXlVafpzskPf4Gt
	5tGXbjbl3fMtE9rd0gwxIF4XuBuwBBfXH5puYnOd235DPCmZ6JWyd+E0ClcOc2UvDoqaVts+FA0
	efbXUgbXTgiZ2vc0HkapOWEFSwVfYSvjAOv2bLuGGl1NbuoEeYQMxuweFBIkvwiMViwuOOc7xPw
	VZOt
X-Received: by 2002:a17:903:32d1:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2daec5df7f9mr112667475ad.3.1788404861588;
        Wed, 02 Sep 2026 20:07:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe928217sm2872135ad.37.2026.09.02.20.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:07:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] gpio: altera: Fix build failure caused by undeclared 'irq'
Date: Thu,  3 Sep 2026 10:07:00 +0700
Message-ID: <20260903030700.132068-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use 'mapped_irq' instead of the undefined 'irq' variable in
altera_gpio_probe().

The incorrect variable name causes the driver to fail to build with
an 'irq' undeclared error.

Fixes: 6e6e585b603e4 ("gpio: altera: Handle errors from optional IRQ lookup")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/apgNYDiSiPmNZspF@sirena.org.uk/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpio-altera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index d22f5be00745..a6ac9356229c 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -221,8 +221,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	mapped_irq = platform_get_irq_optional(pdev, 0);
 	if (mapped_irq < 0) {
-		if (irq != -ENXIO)
-			return irq;
+		if (mapped_irq != -ENXIO)
+			return mapped_irq;
 		goto skip_irq;
 	}
 
-- 
2.43.0

