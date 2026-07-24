Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104293D88F5
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881137; cv=none; b=C/K0RHOQtpPq2H0CIfYa8gzMqFw5DqpODeIHEmoi0rSF7QR4Mm0AhaqXRUyl3vGzNlCupPUBeFDJo1jGnuNzATECoB220XVwtxV6eYTFE/MHqbGPC5KU6fKzC2uJbxa3as6BynCzNDVwGPD2sTYsCUBeWWYOwNRkMhxDBF32E9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881137; c=relaxed/simple;
	bh=wq9AUZROdSYeeUC2iGR5jOJbfo/Qd44CLkpjQqm1Z0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKcz7hExUeJH7fe6sms66crtyvwp5GC5GPPdb/g97Jnh2P8TiBhPvBnTRMhJXX0OrBgR8OKL3pMWis/J1dqYNhP6lw7dz+/E2N2HrxTn0ORE79iI1iDpZYl5dgHm5GgV+sjTtc5HKbVqKa+lIhTxCHIy9zhTrhe+r1u0XW3TfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUNgijPK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUNgijPK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso2446545ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784881129; x=1785485929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8yb57MQjSXOxTukoYKHIFQN8VCyRC3LNTqImXXW8V88=;
        b=gUNgijPKKYzPU2amFAxdk8FM2YEH2CK+wepXvXaU5Rx+dIhsldfOhBtlU4fpjGNmod
         IPiDa/PlNn9pBa9yX5GfXOZSWJZ4cw8uP9xC1RATkx0dxNUwLlaGF+VNmdm480Yw2nlR
         iqf7zA5fn28c8LiIWg7mAIEGP6JcOTBPZ+ApfGbQw7XNrElYs9Xe4zs10jSqeDi5Uwau
         9Brg9LuqAZT15VR25sKXa4DKJ+7khyTLlelBb6lSHl2soAmol/W1p6xQ5qXh1DrwDSXV
         Fa6RkWd3TdUtXzYRSM3CEQmIv9SeJx8DiJfDEHBNjYXVMqEOVgkryti9PwQZ83tlArmG
         1NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881129; x=1785485929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yb57MQjSXOxTukoYKHIFQN8VCyRC3LNTqImXXW8V88=;
        b=kkIOVqIZnyDQ97HOrr7uv7Q7OVpoQuGWlFNqpTnCcK5/M6JIC7j/wAUyc/Hi6h0Gjj
         vWDbY1+lHXDyRtfAMGJNWq6zelvP4dk6vl4rz2rFMHvQEXYsRL4e1Q2WGpB3Rui1Qwir
         xCvHdS/b2blYQFfkNNXhZKaOLHOm4IoCm1j3WTetn6G7TnirB+9FCfDEaE/xJ7hC9fJW
         TzbMOJjWUqiibxkm/MXN5IvPJI4gD28fRKI3u0U6eMhSrm254RdyCgqTkz8SaW5hLlgR
         Lx84kPrTelk3TDl55h4IXW9806ZLYt9M896bNEgSXeOG0UuSp4v7d66L96R8jlkV1L8t
         bzkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHCq95ZY+msQ1PRTynRVnA0g4t84+q6HnsMNw/KYS3QuEa89XrIJ4zmjRYlpM5+NHegazvaZeTLAl7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb+huIY/hIdoHnnWM6UW8jAJN4BS6huBFXpxRPgVSaplj9CtX8
	islIMplWJPqP+A7E2v40HNo1zvPns4JOwO3kYIB9SZnR4BBQ/UzYESl5
X-Gm-Gg: AR+sD11IYTzfyMld+Pme1WmpYyc3HpDFa+hpKpfvxYWWbqx6NaQs3VrecbdCAlP8LQc
	SWBE24ENrbmwYX5F2tN6zPy4BMIcpNRJSqSnea/7DcUs0jCZs1pcfA/ywB/N6dFB1x11/etVqeM
	gOeIcYNKr1nN+VN3TZYItEVY59aO9jwcwzjnhqdtGxXo3pDjSzmI/JKlBTHSQVs2HYwRAMyEvw3
	ivpyzJyQJHkAbknlDPGnIQH8L3vHdvLv28Xukv6iEtLb0yWxbKAnbJ4zyuEZA7psCbkQ3aYUmHC
	TfSfyYnPbaNsRdrRlDDj6vnrPkw4H7sq9SiTbuinkSXhVgFY1UyLoHFrBlxDlB5G743H7eUUrk3
	GqqoYL/lzveScQEUxmaey+CpCsOnEv8NbnwIAMfvHcSVkZne4TjN8lnTSqTjun7VXjv1hQ93fZk
	gJCFb7ehrNLk2BW490lidz20ItTulthkOWq7+SpaFFX5QLSAL/ftslnQPqwmkawmk7VOO5upWks
	LjjXYQqAh5dUjhgyv/f6Q==
X-Received: by 2002:a17:902:e748:b0:2ce:d5e4:2fcf with SMTP id d9443c01a7336-2cfa6f8df14mr78577165ad.42.1784881129069;
        Fri, 24 Jul 2026 01:18:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6247sm47168265ad.54.2026.07.24.01.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:18:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] gpio: pca953x: restore cache_only state on resume failure
Date: Fri, 24 Jul 2026 15:18:38 +0700
Message-ID: <20260724081838.33428-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When pca953x_restore_context() fails, cache_only is left disabled and
the IRQ left enabled, even though register synchronization may not have
completed successfully. Restore cache_only and disable the IRQ again on
failure, matching the state set by pca953x_save_context().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f6b870b7b352..0c94630f3160 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1369,9 +1369,20 @@ static int pca953x_restore_context(struct pca953x_chip *chip)
 	regcache_mark_dirty(chip->regmap);
 	ret = pca953x_regcache_sync(chip);
 	if (ret)
-		return ret;
+		goto err;
+
+	ret = regcache_sync(chip->regmap);
+	if (ret)
+		goto err;
+
+	return 0;
 
-	return regcache_sync(chip->regmap);
+err:
+	if (chip->client->irq > 0)
+		disable_irq(chip->client->irq);
+	regcache_cache_only(chip->regmap, true);
+
+	return ret;
 }
 
 static void pca953x_save_context(struct pca953x_chip *chip)
-- 
2.43.0

