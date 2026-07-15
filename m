Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6748B369
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134573; cv=none; b=szpqSyGQVKQFA1AQNdJNw4/NS+YHLIPTEXCQ45Z+rcmgD0vKWOw0q7thaLz5D/T8GntEnm0val3VhndJ50yqtcGs0yI7ilVJXk837pJKmrPP+4wO5/pwbJLaUYvjeVE/aiWquVaUwPr1/A9TffNhgUzAqce5MdAbRnjK/b+FYkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134573; c=relaxed/simple;
	bh=zNudPnZfpECzuygYS5dd/9YFmWl70aaN+xMCCcjfptM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFnYSEvmwqnQbsauVHBnTZmPmHFfHenTxOzb4W78ApC66rAgR2ehF8YUCHU5vazSVRV/OYIYPAOb11AZSh17GfeoR0btBEdSNwk92ymntCkohHheHsewn80jTXRghyS4DjKdoIOpUHzMkFbi6bOHQJ/O/Ht4h9i0aOi+HtE7zTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KZfDA9Qg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KZfDA9Qg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c733f15aso51191625e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134570; x=1784739370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2djTFedTjPysCreoUk6vChsb1jrTfwtD6lTerjagjV0=;
        b=KZfDA9QgScSk1uWh1r8L4oa6K/Yz5Dr0zzBpdFB/ziW4DcKlN5LxOE0HRrpVyK1RLs
         q5po01N6emPWptw3Lgx3vQeoJ8+4TQxcPPg1J/mvlWhpRR8SIWRZIVtKkkAcC5WOByMP
         hpV8j33njYE2OuHj29BbyyFvXnqigqGzSuwrM2FekJ2/ivdSXR+o2TPD1+IrWgBU+q1R
         DWFp5AeN+zp+tap54q79nryF0k9aVUm2r4fNc/Dx/uZ9MKDt4d8Bp3FRpeWX2voALjiQ
         isucz9BfwzkuG8YOYlSOvwXBJr4slSIeKyM4HLthmJmJ4adQfNBFu1ZwUNkLDEFbL97r
         LQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134570; x=1784739370;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2djTFedTjPysCreoUk6vChsb1jrTfwtD6lTerjagjV0=;
        b=HxHUcGbSBXVAAUD5RC3x8CPnYPcxGw6wtwknqEMDroumgrBbqanx9oC849JO/QwRZM
         kKi/uNYTFWg/HHkANIKPZN2j9glib9n3yTs2dfIHqjIiLOx8Kfoz1fyJA7/svMhBlHlU
         ixkQSX/Xd93VGp/zv7zbXaZ968B2v8QbaVBUUnnLBq+OhbXuAguRP2wWHHhXwGNc8Q2E
         pFBfT0ZdG1ZeEU0D7KdPLVPdcwhhaTce+3UOVuswj74uXbxoNOre6QhU0bPxx6p3Ny+C
         AiKA2OobygYawoy53/2xzhXuoAIf+djdz0lpVjToMg/waxHy4RE5Ey17z4e648Waq6R3
         Dnag==
X-Gm-Message-State: AOJu0Yy4SzYKHBwBG0Nq4dVCfipvuy6cSyN67pF5ZXNUuIlsXZ/cRMyt
	uUn15ssgDx7W/wJ6L83/jCaTLt9loDoDa1YV5DiclRR+N73Kv0USF+SZAeEgVva0qdE=
X-Gm-Gg: AfdE7clZbg42jgK2TZb0mEGRfG2gqpcTyK+GPocHQUKteIoxwf62gprhRCO0dZcjc2Y
	oOcnWEOuFugMiwQm37j3TSd/XpFM0YJGNFUIRAuyw4EnSO/xlWTKACzsFqKoPA96s8OPo1tRNo7
	EgrJCxjvVFem5NEwU7yFnJ1V2YV15ZcayiuZB3xvVlskxHtWgC9mawyBhzRqSfTPH6PaA7go2I8
	RAizYXJ2k4JFHADxBpGfZYf+GZkuPSu5tlm7O9vLBvLGa8ZNWjcCbK/vSwZQm27PWBN83mQ2mNs
	9VjHqm3Z0qiQEAAOQhESAVPdLNVXrPDzvCucIoJE8IAmIQ6y8eH2PtQ4KqWWP0Ht+wuShIeBbyH
	3dCylfg3WqjinXcrSmtJcNs/hSsF8ZNuQsE5qoe1oy+YwOwaTeHi8oyLvz1n0qKlqTnXkNVYMtq
	hNROTiimyXrcHwEjqK5nhQlhFDgdntH29667ISUIfbBoCsVE9v4BHsCEXnwtN70sJqWw2aitnMk
	uM=
X-Received: by 2002:a05:600c:4754:b0:494:ca0e:880a with SMTP id 5b1f17b1804b1-495389d2ba4mr81124325e9.12.1784134569858;
        Wed, 15 Jul 2026 09:56:09 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950873270esm158077145e9.6.2026.07.15.09.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/21] gpio: mmio: Drop unused assignment of platform_device_id driver data
Date: Wed, 15 Jul 2026 18:55:10 +0200
Message-ID:  <c31dc2b9c493e8e6933e7920d5b6f4196c04b148.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zNudPnZfpECzuygYS5dd/9YFmWl70aaN+xMCCcjfptM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7t2GGMNBd5QVGpuo5ECw8cvow56Y1goFtcu1 9GRVixM7pKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7dgAKCRCPgPtYfRL+ TlTTB/9uTBvIcQn+GGc7rwvbuiIIWfAtaN8Dc1CutuAkeq7XhVgb7qquuAJ+Nb4vboFKuKxOY/H WzogpK9BSpzTLrees/GfEK6+fNXCAlzKWjHP0jYfXrfSwy7YZA+xcyCEWvyZ2rdsWkmH5i0ut3p FIRs8THOHJyHYHwrjZidhuCkcDnLlTnrhn2wm8P2KZIUXs5DL9+DQME1G8e0qot3JAgbSkUoDzd tlSy3ivaWi6kKMpNr0NnfroGrmkhgKJM0Ve7tZbYMm7iSZKVNCuz7R1CJmI1UVxbV7O0KGHo8Wt jHt8nfVI9yFgsGZwgJ5tRjYGJEi1lrL/c7JQOzVvUG9gzf2j
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index e9c531eef452..6928241c1d19 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -813,8 +813,7 @@ static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 
 static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
-		.name		= "basic-mmio-gpio",
-		.driver_data	= 0,
+		.name = "basic-mmio-gpio",
 	},
 	{ }
 };
-- 
2.55.0.11.g153666a7d9bb

