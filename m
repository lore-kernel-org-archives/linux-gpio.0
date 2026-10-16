Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3331451DDE8
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165360; cv=none; b=Sx6PG0fx7eoufFKcVj1x82OxJy/cFIR8epb/IKZZbEnaVS7kOr1e125oNxRtn6N4Wgrq1endHtyZ5/g7wcZus3Te2mG9AAeYYkUYHb1Q/Jcmb6ftBvXaab4+ZpIvrDkuG0JCMj6w8STFyNGfhDzXOoGhT0RzuWWeH04bOCEbldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165360; c=relaxed/simple;
	bh=zk3J/AL6+Z3Ly59Klf2ISnugpy+IF3qjEzcB3g2kr28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jB9ob+e1zZlZXyH8iUFp7WmsAhonzW0/vVyKDhaacG3fBAEMxAA2Y73el/m+qT8m49h4nL8Iw0HEGawlRq2FNDfMZgNkktE01Hsc5+xvYeXkc/9qSCKCPKAqWj9TNW/+Mrmr+9PEot2URNN9/UAwHd4K0oYBe/5AS28wboce7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClrYcPFk; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClrYcPFk"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so6385848eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165351; x=1792770151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=ClrYcPFkgXXAK4R2h4FZHHDO4rmBKH9B+KM9AqDymgVbbZwd4UERMaU7tXfpQzvwZW
         JZf4KOgant3D9oQhkEAys8FDQYbeTEWqbEbVWM/5B/kLo8Qt/QnJUae9xe2C5zLlyvfO
         VaDmI0S8Z5EpREk4SNHuPqoIHvvEZeKPGBcfqt92oN6yADwntStgOh+g3RD2Hgcv4s60
         G8OLNLwrTLUpxmBNxKu5v4WtgpuRIn6ZkeY4X8BYO/rz2zCjS4adwWUdYgMzYOqaPbqh
         uMINDUYO1OoVS3id8iG0XlzbrkCWR761e2tLJ+tTM8GWzCxYXkUgccgZ94iKHaxr+HmM
         45kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165351; x=1792770151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=Exu4BrclyaNVNx4rmC7KaUuJ3ro6VEMl+KRWf1bCxO8qd/Omb1mZzMELT0THcUQCYl
         NIYLSFvw2W8ki/VjebY5HSipe2g15dNitHAHIdk+TRL3+lmrcM/7WscCxhtYO2olnnnz
         VKQ05oo5d8QN8WbgeJXmMF5zevj9uRqQ1W+WMXnOpdfC2EXqujtm4UX0FNW0n+1JXKAU
         FndMHLkFXLSmna3+CoTQDoNhbv/fc+4EAxb69W+UmYUOVddQ3KOGXElpnU2wbbolWT4Y
         6FGA2ZY0O4BYH5Hf9/6gF4DwD2wyVY7p6Rs18ST7jxDJfcQB3K/8NbyNoqDtZiMXpOh/
         V45g==
X-Forwarded-Encrypted: i=1; AKwUvBxK8Ytv80zStQN4FVhYWsvsqedP0XFK+zcX6TqUCOpeE7zkZdxy6Edxu4Nx2/lXB1DiaEzynwbDTR3p@vger.kernel.org
X-Gm-Message-State: AFq9FYIIGb7sLb3dsIkaSweh8P9qafnC4giF6AGHwdgSGKbKREhlDH08
	YYXfnCJN5PSURErikVr447Hur+iqFpfKZg40KHiqkDcLHnt5o4zmsWXg
X-Gm-Gg: AYBFou1KfPCuLCDrGGOknSnx8MsJiWZtB6uSsCQhT5eVnP2LanuguZPj8xnrubl664G
	QFMZlTATwZvT4zTM3cp8NSHQT2kWkYtq1CdmxTFuJbWRhLhmdvlmepQDylgnClAObxEj0kYCTh4
	t7TFNlpbHjNB7ykgADDy0kmKCnglb8sWQKkM1zpNbWo8Uy8y/8x5CS+JlKM0alDAeD8QQ9WU7M6
	oly3KASkgmkRgpjKL4xmDWbEjexX6hI83jT6zI+Bc0sqYnBIq+MAbpoVgjhnbD5oQSdhUNcwTl5
	xyAhfjaiGHMnlE5LE6VekkvD5Lcii4AfpVVVy/Jc1GtNyqQo+GSUuRplCPa6XvK1atnz7I7hGJm
	3jTdTFWwhzNnRIaxnO99ls3Z1k2PFPNlBWYKrB3mYBaiwA2ME6LfjuAJR6IHUPu13kMJC95yt5C
	gwJMBixWbj3A6ipJvXafP5UAIN1uU/LSgXM9HH2+69Ky9CiNtUWhT77IiGdPOvExwVOkQ4+hlWo
	Im8osGCDxoPHIC11wYI5Lf0MioDcDU=
X-Received: by 2002:a05:693c:20cc:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3619ed11502mr264970eec.2.1792165350843;
        Fri, 16 Oct 2026 08:42:30 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm7273806eec.26.2026.10.16.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:42:30 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Fri, 16 Oct 2026 21:12:09 +0530
Message-Id: <20261016154209.23193-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc32xx_gpio_probe() registers each gpio chip with
devm_gpiochip_add_data() but ignores the return value. If registering
a chip fails, probe still returns 0, so the driver binds with a chip
missing and no error is reported.

Check the return value, print an error naming the failing chip and
return the error code. Chips registered earlier in the loop are devm
managed and are removed automatically on failure.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
v2: use dev_err_probe() as suggested by Bartosz

 drivers/gpio/gpio-lpc32xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..7fb46262e18c 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,11 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					"failed to register gpio chip %d\n", i);
 	}
 
 	return 0;
-- 
2.34.1

