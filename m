Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032195;
	b=QcHtKvsJlAWZJO4+g/jtkQt+B24WUeLlZ9hAhcfznbLl8byhkBTcTrrDb8xdHey+uPBD
	 kpzGgo4jj8/S6XgB8VuMWAPbQudlD1hWf17eq9F+6H4Uz1oEB88FI9uKcPxQyVeo/xpuh
	 7fxzi/HiKFcEtq1pVbJLNMW43fcO2XlfAXAPF/yUZXTtoYsJeJzVZCQ6ED9YzOFE4LlJO
	 ypLKaPBecyHi5sqBenYTrQCxuRle2snn/QXVXOSgQjtQ45xiifJqb0gHX0nozkVUDTC8g
	 bzIl/erVHnQ1M1POwHzQy8FlkskUeK970OlBO+4NiksL9mMFe8lcB9CH7VHcdgdMiDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
	b=EevNseg9bw/+5XtsTCurSJsllGtoxXC1+Oht2KTXI14a2SiB9hg1jMCt9aSqPQJ8TlRR
	 FxazZS0Wrpls2b5SQx0ddlK2m70kWRNddGlHXrmnBVbrPCQe0195ZWY+V6BPjERXb4l6h
	 NVIuyQAbF8b9WRrXRAPP6agr+Hpk1pibYhPTXEJNoNvnHjTzp/SFJK/aKaDEC0w9qyzd/
	 94uRct7uMmaNMFcKEY6P6jAzu00xp7cwfs0bmFOOjQ3RqLwNO+m/SAlKM+9+bbF/uDMBo
	 QQKjBHtET6XrsdDz0d6Ta7Q8Gm+lSDI1ODamlQIU+5rhIxH/hKA7/rwMOQJdvHtsDvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eY8xR61K;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0125760A381B
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0125760A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eY8xR61K
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10573215e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032193; x=1793636993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=eY8xR61KDfHeA+ze3MHE7QekDkIqvCuAV3DpRYNmrOzTT6Zs08+zxWUs265lqeoPdu
         x36P/BEKlumjAkYwtlbU95PniBd5f9pbQvKRZuE7Iva1KtF9zHdDQXHvb3W83uLllm1G
         SUA3SV8/jbjoMBcOjo8OLiqHOpWy4D2nPWrooEsvH6XyNlgLa2KFfrQTTxrWmMrxNTYJ
         OK6fni3f/dwaslWFTjav4fXhvVjMZ5fGTVadq46BtP1pi8bLXzmByqf9CljBsHpantHH
         8js83ZWMMyv94cozdeI/9GaKfJXe/KaGGGWDx9Lj0s8VGkTrqPmkWRi4TWWHXhPVhi7H
         aXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032193; x=1793636993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=OdKBaCLJWiZDMBMAkuP/JUbQ4p0/tS/0dE80NHNJB/IhU0nd6qUSONPGS9Sa6x429B
         lEMTlTNaM53H927aCHgL3Ej7mT6/kvG+5RWIWWU012TdS5j5sJlzIcDcVO450QwG87rk
         /XrorKA6JIjvFEhecFxkB4TVuHLA00haL8510DKY5GweWT2Kl2ATGm4L2hQ2584yAo4X
         dd3osA6x/OkMvbk4ZjEEHwTqDInzbk3kaNKAFP/SjTT6hMEyD39Ov1q2NGxLBA9cY702
         8i3tqKX8z15gHHQaLMG3c7ineRWbVlOQbBe4A+fgcUuvYzr7+EXyOzjPe3ErG+pjZ2th
         kdhA==
X-Forwarded-Encrypted: i=1; AKwUvByzEHA5QJixuc+Ph4IDTvhm933oUjwfHQG3nP6QGPUUW0i2/fC5c7hn4uFRJCtvHD9ZsqpCHVzmeOoM@vger.kernel.org
X-Gm-Message-State: AFq9FYJFzKSDWvR2Y27icsW8Cc5BRCt0cUWbBFwnyEyKTmXORTkoIac3
	OXNkxa2shY2nlaENFWa0M+eib7z2/W5riiqlmrSrE374LCbMIFOKpm4dLbl3eU68FdI=
X-Gm-Gg: AYBFou3vier2TGlMUTAdwE3rljphUVHNRPWCczB2cRpFMFU1u7lBsnhabzyCKhbagJz
	lKMbmy5ajqfZQBXWNF2dmWc3pqRF91IuEny7AvdqMDU1kD+ODc8S/bg4Glsq6t9MKCjTOn/i+iG
	5XpHAMTE3sWCqb8mX0U7AUOgpeycLumpJnQlEPd13PMszWGcQhuO6VbGl+kZ6YSK9Ff3FK3QpHT
	CCdNHxJ2Heftw7UwbHKQIHjzYgJUXX4WQmoEwxAbUPBAq8JEqC6KVD6POK/6LPCWlNm/I9jC/rM
	h36xoCfzIQV5SGmXR7KhiXSeRk2bbEGykNgYf/9ZnQIJKtUf5Ikkam4JtSLRHIwtb3+uVkvJmYn
	x5CgunEZjCEbQ4jngO7hww5mFyMVHfZGfkTvnVBXARVvW6u6faR/A3HmUd40uAF8VlWWx3S7vt4
	OQPZxGkEfw1jd0h/qVb6qYsxXNBH/s1dXNT1WPOkRQz7hity6PcZ9+Rf1zDVHCc2Z4qmNMsRU8r
	N3v+SCe0qwFth8uvH68oIsW+gBnZ5aOaOsepsHkeFT2dIb8X30/woKXWiGuPqtJFf/nURzV3+3J
	IATez/Z86tqEG03WTUUSPBZmdo81jHcWLWJvaYAxRlhUmClIjbFObqOberdaOxch
X-Received: by 2002:a05:600c:37c4:b0:4a2:ebb:397b with SMTP id 5b1f17b1804b1-4a35ac7f0e8mr126746175e9.11.1793032193405;
        Mon, 26 Oct 2026 09:29:53 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a2d9280sm202733125e9.13.2026.10.26.09.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/22] gpio: Use named initializers for spi_device_id array
Date: Mon, 26 Oct 2026 17:28:26 +0100
Message-ID:  <3c503f198cba5db5992b7c0650cb39283f6ade6f.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uNWJjvjByUSk/Alx6uwMJrOimvtVntzmd6YoLQUBMo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/BJ7vysswRUgQj4jFDGgUwv/6TJ2eFSz7ZA 24d/SxdtqqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/wQAKCRCPgPtYfRL+ TkB+CACQ9wyQjITvcsbe3/7Qm1bMtK8J/L+ndadXn4xssvYdKohEcktS2rj2JvqFv1SWQdzQ7SP /1U56RleGxawx7r6tNKk6h9QGbB9nLwi63YsvTwBuvRUdbqUMgqBG+TB9FCyYn7QfGU2ha/ZeAV ex3N0o51LRKimCKKcT8/q3C7L8MtfKUZgESQKyYZyvIhsoJK2OD/JAZ/uGEjgnbYGwy7/baTvtI J455enrf9NSEY6TsVxeKXNpGMkDmNmj1CJXityWSd97PwILSyTTXewx5GPXPjM5E5gohSMN2gpy Y3tTdPeTquVlYaGeBk26W5KL2mYJoDAtN2bNvGvO6tQmDdiO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union (though
none of these drivers uses .driver_data, so this patch isn't strictly
necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max3191x.c | 12 ++++++------
 drivers/gpio/gpio-max7301.c  |  2 +-
 drivers/gpio/gpio-pisosr.c   |  2 +-
 drivers/gpio/gpio-xra1403.c  |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 6e6504ab740a..b06fecc98633 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -449,12 +449,12 @@ static const struct of_device_id max3191x_of_id[] = {
 MODULE_DEVICE_TABLE(of, max3191x_of_id);
 
 static const struct spi_device_id max3191x_spi_id[] = {
-	{ "max31910" },
-	{ "max31911" },
-	{ "max31912" },
-	{ "max31913" },
-	{ "max31953" },
-	{ "max31963" },
+	{ .name = "max31910" },
+	{ .name = "max31911" },
+	{ .name = "max31912" },
+	{ .name = "max31913" },
+	{ .name = "max31953" },
+	{ .name = "max31963" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index c8bf6a9c3de0..9db20c22ba9f 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301" },
+	{ .name = "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 2732ea8c16b7..75a8f3efaf94 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -150,7 +150,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id pisosr_gpio_id_table[] = {
-	{ "pisosr-gpio", },
+	{ .name = "pisosr-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index fe0fba6ea902..3713475bdb75 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -185,7 +185,7 @@ static int xra1403_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id xra1403_ids[] = {
-	{ "xra1403" },
+	{ .name = "xra1403" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
-- 
2.56.0.rc1

