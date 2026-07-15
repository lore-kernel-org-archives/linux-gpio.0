Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1E93B2D04
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134568; cv=none; b=Saay2LvyQg4naELYUDqldVAMnNQLjO/BTAUntO6FxyBtAmko9OrxjsAJd5Gy8shlgEa6A+Uj7ymH0mGvQ5MHy/txjDOpugHFd6Xa9PUzEHcIwr+GwBVKv6KJnzExWVqRbcs8AYojhHlMaPWawlCgRc6b2PNrjogstPoMWSOkRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134568; c=relaxed/simple;
	bh=VFQtJrX7tkOz1jHG8Rpayl2n+pKNint/uul7zVf1CxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dSrJld2mOE47pYrGcqq/vJSaBGuenpAOUEPW/9+WmQeAufZp3dHTIakrBft3SRx00w4biNOBz1xO5ymLkiUbj8KC77/Vqx8at5nvwZCWLMDt1i6Rx4NllcOKVLIqBSVDkIztMaG8a6WkdpIau1AM9v41KLuB4LFegys7n8yRoMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ENS3Gtkn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ENS3Gtkn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c7902f47so47480975e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134565; x=1784739365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3JKA0/svGj7P6Q+n8NAGcR1DoXZhQrV73mAbLowV7iA=;
        b=ENS3Gtknaw1AzKqEjc9/Kysod0nQc88U6BbN+BlRZr4qH8F+iyTFXStplUk34Zz6Wg
         /4vW+0F1gBCpJkCeXYYoFj7GT640HpXPjlpfLsWFSf8jAuZIx9N6qirJhsIH5rqRXReJ
         3gY73rVWXdH7M3UAqofWtUUGAOGeCvdQr7M5Rn3m6W0oKW/Z27GQOmcLNM9tUJdckiZB
         oQCpKp6FwOqHyf1nymxP8GmjP1YVp/aXNibWsAHzSoSgZxZJPT46nEVIEWbG3r3D6p5q
         HU7wijARkEzmW6CBcXSyMrxXt0uAwkFjIFCD9ptok2eJykbsYtGpuDrcZqKMf2JllZtA
         uMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134565; x=1784739365;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JKA0/svGj7P6Q+n8NAGcR1DoXZhQrV73mAbLowV7iA=;
        b=Ip7PdUeeVvIuNqe5ZfJm8F9E9InRrkk4WyweEmyXGTSSRN0VL1SQo4I/EeEwTE53wS
         tMW+dd9G/3LbeOOTsbQRznQZmrrtP169UaDozlRIZjsPIY1T1Lq9B+s3PpS0+qYoPeDV
         mGgB/Gg2btIQNTAa2L530PAZ/0ZbD2QUHXVfCjNBpythhP/yRis0IL3o5zfh//+NIg6X
         2dNiduMteoxAq/VVMz84rY0+SmiSOQ4lw2lYWfELzA9bQcoJPUZk7Qel6mDtuguCHpxQ
         HUxg4XTysub2K6bPHfaQHTlc3/Ed036+NvENyEATDkACfd0Svj1BO+pPeeSQTRlLpasq
         N6BQ==
X-Gm-Message-State: AOJu0Yw5nDQWH7a9db5AX7V/gO4wBgzfT/pgAUpSzm+p3lS3fHAYpDcI
	Bwm1YtfjCZjUvkrOnnCqjmNPmFJK+nCkG1uzeHjAxzRn3NkJOX2VhwO/psf9njEkqbU=
X-Gm-Gg: AfdE7cnBGhHggzDClj4H/svMOTRBaOatqvwyyrR+2pZZ39/kkvvulW2s7vS68M3Ykmd
	8sHP4Zj4ymwRDcBvV065fa4PJ2XP+wojhhMRa/gVkKrwx0sWZuA1LmX70qWJi/4VIEt9O4xMwJM
	An02FHPSgBVnjvn31DEzUEAu0HsdogkCySEFsCJYtY4DuCiDII/3nai3/SluaiA/17ajrGMICO6
	c7qxgbUVK4b+Pn7DANfRDBGPWT8cFxIFgVrjIiNfodYVn1w1Yvc1T45aqEhsSHSGoJqUC0X3fc7
	YHERcEI6omugkXBxbVPqhe932LDxgeCqf77GMM9nyNIEminLIjFUQAgIeqmUY12lNHHBxPdoYOp
	wL/HjG0UWqcSEtq7wli0igrdrqllYNmx2ECHFRwVHwSddnYR6jPBwgrk92nfDAnNhv/AZCDGuFv
	RLYkv2X6+cXXgKRCHCtodJX7Ep76N+ACmgnAVs7fxVG3uh+2ZVKzCQ4sx5UweOHSwpdWBp1xK1C
	YQ=
X-Received: by 2002:a7b:c38b:0:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-4953c28b6bdmr31046315e9.32.1784134564703;
        Wed, 15 Jul 2026 09:56:04 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634e5b8sm16561332f8f.6.2026.07.15.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/21] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
Date: Wed, 15 Jul 2026 18:55:06 +0200
Message-ID:  <4f287856563d481cbe6456ab3ffb870e0bda0ab4.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=VFQtJrX7tkOz1jHG8Rpayl2n+pKNint/uul7zVf1CxI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7ttLzBz2UVtRsQMyIyU7Mg3xCMoq+hCItyMq W+lWrqnKkWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7bQAKCRCPgPtYfRL+ TqnQB/0WE7mOS2zkFmCWCDf6Vb2wAFTEtdzxb0XN2TteYVYvB8iK2ramm+DiamqlegrvwDGi6Gf e5ZKS6DnPmYqIWlyTD9yiMuchRIKGPnruNT0rtPPt7iyOrxVkBpoLm6BWsR1CNE/cus+aP8RsRi IXVj3MtttaQBFHcogFL1ZK2gypVdkjHVE/B6ttx1Ymz+3BDmmOBdWP9otvuFtpWfByUpOUwlrEw 1rwfhqHdUJdD7XZE/KV5VsLAwGaqXvbzm/XrZ+2w5gG5gRoylSvJutVfh1Fk+dP4LQ+1vTu0MBN lmYRG7Z9dbxfGrQMIblXP1upC19lnjm+iNpSGp8Pk+ebzaQh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the ACPI device-id arrays are always
used, thus the __maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mlxbf.c  | 2 +-
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index a18fedbc463e..1d338b24d52c 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -132,7 +132,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 }
 #endif
 
-static const struct acpi_device_id __maybe_unused mlxbf_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ "MLNXBF02", 0 },
 	{}
 };
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 4e2f3381d82b..650abdce863a 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -448,7 +448,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 }
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
-static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb

