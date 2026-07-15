Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C054963C8
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134586; cv=none; b=Y1LSaBjKNpDDBEk9DjakZWetFsWddQtilyUMLzlwaXmE3LNxdza1dBvHW9UxmSW9x4AZuSF74Qp65+LyKZuR2ZTTdG8FTcFQ7+aoV/nxL4CnYGJE/VZSUvn+yUb6FiZ4+u66nCuN77eqpOaH0yxrHZho2Zl58DCjpf4rxEe7Gho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134586; c=relaxed/simple;
	bh=pjHW7pyDQ4JEIlbUWB07hiJX/g0Y55VniXF+f73xk6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgcA7WFqYRDj8GneDxbeXDS43uPRv605AHZDknlXZgP9/nOQ7JC22fqJvGZQBVZnpcqBNfHQg+fCNaznW0Us6cyeTYi9IL5MVFZqhOQ47yOv8YA4A4ioreqV4V3OqVOnQwPEuO9b2dD/RWAf7ELhXXBftI1hyaQIQYXq4G6D57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dM8i/dhC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dM8i/dhC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso12753595e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134583; x=1784739383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQuEWsCiWaG4AgDHABsWBe4T6yvitv8nY29ehlGtKhs=;
        b=dM8i/dhCQkP/U9h1Su9SqZkKI5cbg4ohcj5AsFGJOwhPYIs+l20BI3/qcyJ7r+ROEq
         YLHUnF9PYUTsA0M7U+bKTXlHB3JJt3K45wLARr/2R+1QGeWND/6dnlC3GBew/v8H50H2
         i2sGruWo1s8T9QW61k2T1CKwsyelC+fDNR8lnpIVix0O/4r0IuKBcs7U+f/aaLBCJpeV
         2WeQZKVcNLONBs4QqUKtd6KwUEIgOpOGzb9EG+XqeDiWWCLGUyuBX3Nr3JcCb1cXcHam
         qyvW9e/wRyRacJB1l0z8Iwvk6lUo+9mW0clcTCkaiU9smhwAJ8/558PmujNTdPntHZ2f
         UisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134583; x=1784739383;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQuEWsCiWaG4AgDHABsWBe4T6yvitv8nY29ehlGtKhs=;
        b=f+3W+GOdOat+Ygnt3YYs1ZH/mrx/OGhWJzxamj3oRa6aNuNQjdGp0KbcQUvsxxhAuv
         NaUJBg50nn2KZ44ONiqq3BQq6a4PAv8jCpebxZx/KPv9AJb5WY8nS8Z78ME1U5aco7FD
         Ln7Nc+MMvRg+GelIahFy74nYw8nJ3qSvI60s+uGPqzaL+Z5YBNSt9tjEd+IgJZ5NmsR4
         dU1IcS2CgrS21gy2Hwmc3ZcaaxMsHor0/L2PhrkuKjOQrhI31Hr+FoQagHXhq/lhfyby
         bAWMlc9lyRgBVorYmuciy3dwkPWdvvVvzMxT8o3AkLy7uNqbS8UeNr+ZXYRPsmvxa1QW
         uX+A==
X-Gm-Message-State: AOJu0Yy2wFFX2ENDGRRZ/4rdAmZRoDwTXioV0HDU7HVfGYF8xk2VoLih
	QGftSWEe7Sd4bD1oV9UezbPq/CSt907S52Vod89mgyDBxGxfcrsVypSlKymKpUnl4DIC8AlbKqn
	2XhMR
X-Gm-Gg: AfdE7clA+gIEgf4VMbYvxtnJ7dvGOszsDpQWDXgU51BFzNPyCi+v+X2yY8rGhEVWYKY
	GnmpyVvM2rdlVRDKIHQ66mEhi0KmP1si6Gc/8ZwOnOPQm0SKQBQCvHCAletGNBhLRXUrEN3jJ8p
	CYekzOcvxcWf5M6KvKhmmLQSb9xt8QCzI36OiMGtZn0Uo2QA+d5EZCv4rrVddUt10ZJb0kq5fH/
	kShizg6imHAv5FBq9ppmOzu8zI6c2q/bcWtpf7rj80QxmcdkDBAHycCTdmUR/6OyTHBqzXu9Q24
	2+9z/HIavPHUB3oGNCvWNacncZdvs75hwunhAMr8LSFcG/whCIzsN5LIqNTH5ukkSst6KBiweqT
	VhuuwC8fDQ3zeuLqVPBJmYDWqDUwZ+pxYo6qtP+vTFpFaMiXwtbyst/mQp6Nc36gfpux42VwIDv
	uwlpg7/nIKe4zAYtxIwX3eJecLnBWcEjlxGOaGTkgmEJqR8OYqumkM3dfEiaTyru67ivxK0gbWq
	PDqXqSHyoWUOw==
X-Received: by 2002:a05:600c:3e88:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-493f87d8a97mr178125435e9.8.1784134582848;
        Wed, 15 Jul 2026 09:56:22 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2edd6fsm160244985e9.11.2026.07.15.09.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/21] gpio: pcf857x: Use named initializers for of_device_id array
Date: Wed, 15 Jul 2026 18:55:20 +0200
Message-ID:  <cedc2616b12c3d4491e0a0277efac5ead6a0cd90.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=pjHW7pyDQ4JEIlbUWB07hiJX/g0Y55VniXF+f73xk6U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uNCGLaNfMHxVjsXAHqhHFpKqMyKUGJtZbZl h1KMYgdVr2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7jQAKCRCPgPtYfRL+ TjXfB/9r8Tmxw+lWDXdtUH84Zp7HKdFXLMoSMN2iovBEWX29M2VUR2ns7ZxkikGpZWz8Tibzk3m cRGO7VsfIt7rtETlqRJ/aDro9k0ng7grUov2mUibOeiPx/mD8h78Z5X6f64pQRYSXK5dnGYQFMp 09lq6ZjBi+4idy1gB//arTVIK9JOVbY0ZtBJ9IabPrGrtx5WStzQS9qud/0E5UV+9YpvIKgqu6p SR6EomXawDD2+IL9dvT0MCPA4ZxeFTDzJTDvY8EbAc58wpaXdJlQqsSNBw1Ebqa3KruZpgwE3cV XmI8F4V0/P1tAxHIT8thetXlVBy6a7HkMvi4+gNadIJKJCiR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
of_device_id that replaces .data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pcf857x.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 4196916c4f94..d6f0b571223c 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -37,19 +37,19 @@ static const struct i2c_device_id pcf857x_id[] = {
 MODULE_DEVICE_TABLE(i2c, pcf857x_id);
 
 static const struct of_device_id pcf857x_of_table[] = {
-	{ .compatible = "nxp,pcf8574", (void *)8 },
-	{ .compatible = "nxp,pcf8574a", (void *)8 },
-	{ .compatible = "nxp,pca8574", (void *)8 },
-	{ .compatible = "nxp,pca9670", (void *)8 },
-	{ .compatible = "nxp,pca9672", (void *)8 },
-	{ .compatible = "nxp,pca9674", (void *)8 },
-	{ .compatible = "nxp,pcf8575", (void *)16 },
-	{ .compatible = "nxp,pca8575", (void *)16 },
-	{ .compatible = "nxp,pca9671", (void *)16 },
-	{ .compatible = "nxp,pca9673", (void *)16 },
-	{ .compatible = "nxp,pca9675", (void *)16 },
-	{ .compatible = "maxim,max7328", (void *)8 },
-	{ .compatible = "maxim,max7329", (void *)8 },
+	{ .compatible = "nxp,pcf8574", .data = (void *)8 },
+	{ .compatible = "nxp,pcf8574a", .data = (void *)8 },
+	{ .compatible = "nxp,pca8574", .data = (void *)8 },
+	{ .compatible = "nxp,pca9670", .data = (void *)8 },
+	{ .compatible = "nxp,pca9672", .data = (void *)8 },
+	{ .compatible = "nxp,pca9674", .data = (void *)8 },
+	{ .compatible = "nxp,pcf8575", .data = (void *)16 },
+	{ .compatible = "nxp,pca8575", .data = (void *)16 },
+	{ .compatible = "nxp,pca9671", .data = (void *)16 },
+	{ .compatible = "nxp,pca9673", .data = (void *)16 },
+	{ .compatible = "nxp,pca9675", .data = (void *)16 },
+	{ .compatible = "maxim,max7328", .data = (void *)8 },
+	{ .compatible = "maxim,max7329", .data = (void *)8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcf857x_of_table);
-- 
2.55.0.11.g153666a7d9bb

