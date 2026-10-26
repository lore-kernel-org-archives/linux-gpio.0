Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032192;
	b=2N+qqe7Zkj789nda1sXF/SvkRsasZ31P081/1JorFBjmpNd41KI3kdzKhIgK9sAyt2UA
	 lWCYcUyrqLnNXX/1qVguf0CrOhPOCSzyGhOg15WAFHrvZk/PA1eicRQxJmxooxkQpFm5J
	 wesU7569JGiUsR284qDyouM2Ij7StxCf3Nnaa/Ck2zG1iIWKynYFUBM+ngbNBHU649Nz7
	 i7A1yNyxH55dp6fazwyEkEZ4JLfOlEwMCnoagPYuwx4Jp/g7Yw2fdFRF5ah5wFFoNWHxm
	 ICbmQGZV0U2RSdWuaBY5C7OOGs3sgXCi6b4JcJpwEKVPgO9ibdvtdPfQ+ErcTTf+8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=BhjWM9fwaHnRJu6W/sKAqHkUSk5au4WkBhF6Oy2pRHM=;
	b=h1dAmvp1z0T48/NaLP/2xYYrzx+Rto4aMykhS1R8tfEzuLtzQsUQBviuf6Iv9+6BIv2n
	 GqBwO8l05eMCVeNHzy8N2mqm3XGEQIWogq8zltZTrZ8FocGIiCzjFsK9GGA+48oyeL8VE
	 4WR3faZ5gJgksO+AoBsWl+D1vOtFXKM+EvopJXY2C8UNpLZAQAw5FWckzF2F+Y9tNfFLW
	 0EXWJ42snAhVgUpRaAL0udISiabipDZAPsjrN4Zof1T7KUWN3Tb1qzqfLu0nGgZObpqtB
	 Jao9ii5Yn0usgapC1rBmtMO0F2oMhEubXj+Uz4WQSzjPc033H3joyAipEWG/nm6wlOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CA84EdSl;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81A160A2635
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81A160A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CA84EdSl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2855450f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032190; x=1793636990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhjWM9fwaHnRJu6W/sKAqHkUSk5au4WkBhF6Oy2pRHM=;
        b=CA84EdSlKhppsa0r1RuNNr9hM2Fj0mUnfFQCHYA0ITakI9RXk9SxrwzeO643It0SQS
         wy0gf33O3GkFJQQuo8IS4fwgFQEp+8fE08TgjbxpHt9pTihFWjtt4IH9Q5bo7g5/HkCU
         w4BBKtRS6GeTHmpiCgHFZpsSSW3M4z/W/hDCu9feauziTstqG08+Fc4QxA9B4IooOP/b
         mQNB0nVZZJmXD4REN3nq+aXhQ/kgt2z/I5q6d6C2jI4RRHL4WM5e26Du3eQFVAnXAX5k
         Qsq0Oc7ZSm2tele5Y/bVJFYg00L8+N1YYg5yysSc3Q2u1lCgDUXWkbnujWbXo04wY9SY
         bT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032190; x=1793636990;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhjWM9fwaHnRJu6W/sKAqHkUSk5au4WkBhF6Oy2pRHM=;
        b=SLh2fgyR7nyD4SgRhOnl/4mfcFc5fatZw32YpK2Xu8D4KyGrKUwZcw2zS0GAzU88Qt
         LQSRfZ8BrKAS08qKUaHu2AAkAdSE6P6kaJQHEKefd8CtsSk6+sQCMOPOY+Fb2nhvF8Vv
         Ohcka+kl5jvIsBqlhW7VRC4YKl38/JSXbO04T2eulWAg+CAdDrC355AQH247G3ZhxzrP
         PXP2sSHEILQr686qybyf4cxgLFgFMGa3UJ0YJPw5A359AmovelxssIjFabl1gq12PCYW
         uxG0HTCkZ9HqAz+B5tWOi4jBVF5pbqJnWAiP8g0AzqLZ9Hub2tdAzhUz5c/yu8J8+enq
         Qp5w==
X-Forwarded-Encrypted: i=1; AKwUvBzAy2yKLSE0++2ChHpbXcdpqbOgYafFwQ/FV3by6DmgG6YuCfR0etZ2hn9RIhOioiPLrAFNlovMbYTr@vger.kernel.org
X-Gm-Message-State: AFq9FYKWFUHshueNPr/27QolIS6P5KUaxBbfP8ep+59mfv6MpRORZCdB
	oZFdI/wVSQdIb/7Xu9ELvzyAxjTcJ4kJj3myfvw+rau/iLElHr/atlDb5g4SOfG6vOk=
X-Gm-Gg: AYBFou3b7TLGb2U7rhVNOYraXNV71LCt88hwHrBcrlLkFm04hiu6VjwCOIo+LJQVpyB
	4jKO+aoG0gDGBZyqiY1DzD+pINjdeYiqHkeo3OiLfNPPI276w0MkgHNoE/GHfrXOL5gBJ1jS6dh
	1c7NRlX0ymX1RDrYP58JcAsVezz+pbtPp7VbU03XJgossXVvr9vHVSXB4U8yaFH6SCUrYXzuGAG
	IlgFrg+Dd4+gMwvLHIBEWzgVnS4aFuqdsZj9t4r4JuDf936hw+zBVrvqG7epLrfeTjEnhqKqKeX
	0k+Ao7OOyp24EskZvUM/Wa9VqBTlDgNzOljG477M9/C/baBSRRT1shrCBkvlQL/jfwkyiXiMTvM
	WTk4wjnRTFX7yYnJ0xMl4rQrV/3w16j8ResSx6onRdtN5zRWrBwocRfEwo07ynVvKdxe/LyooSF
	zQkr0ISkvX+gkDt9Qs/NoHfmxZfcAEw33kp34al+cU1fyrIMFtBjHhWvg6zsCLg0Q8xI4P7uYXv
	XmRIoNhF/KZumVDaRF0vqV9udzMS3RTa/9Q6c9lhbJiKJ4vbPRghFoU/TGLVtYgRb5P0ZLCcDsZ
	j27OLIdwwZhuZ63DzlA4wTbfMdDI7W6MJHQM2Gg1EAM=
X-Received: by 2002:a5d:4f11:0:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-48e3ebb84b1mr10189503f8f.50.1793032190134;
        Mon, 26 Oct 2026 09:29:50 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3932sm18573493f8f.18.2026.10.26.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:49 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/22] gpio: pcf857x: Use named initializers for of_device_id array
Date: Mon, 26 Oct 2026 17:28:24 +0100
Message-ID:  <2fdbc561669ce62b45d98ff0d5aa5e8ea622ad2c.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WYs95j6U3d4ePwnS1uhm/Fqgo4kFgcWrrBXRXKM8Pag=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+8ByyIDpWQzCLncGPRX630tzWAZtfpgcewV 979HrsWtLuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/vAAKCRCPgPtYfRL+ TrtvB/4jQS4c4it+3N2lP6wMlM3V7iKpLNfnRudT3MDBgEkWbgH4zHpjHdD8KAYb8VydkbJF6JP TEhzsh3bRbUrwXvgehjpUxi2WBk4LXoGx91WKzHvULMqzQk93f1mn70DmzJa5u2Xay+yDvP4119 p6dbxGEjdoG9AfYGIjnw6NDA3E74bg0SJPik8XW0pk7LPt9QzlBWIj1JPFjfr5Mk6AmVI971YOb LH9A6mC0t/3xck1e98FhFNm9nX6e8hW3RYy61H6eFKrecz0C8Lf4zRHy5/buWn4tFMyD+vZP7xj Jp9I87vQJPbqhtSoma3/SlYrKW9tUtQeFbc/Mqt3QHMz6Pk4
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
index 1ba6a09542f3..a2395bae4ca9 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -39,19 +39,19 @@ static const struct i2c_device_id pcf857x_id[] = {
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
2.56.0.rc1

