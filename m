Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA294ADD9E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134591; cv=none; b=M19n/hZ3dw9Uck3jFUxM3DAhMMu4OLXfK03uC/c+EgP3fEKoJdTrGQ5i8bBMm3dZs+LA3HWUFwfEvEydWhZTCTEVZzOGNzf/nNcWFvOxGMIPEszO2J4OF3HzdmsCBwq7huF5zt5OJqUAero1tCeSuD5M6nduPPMO1aMee3v18NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134591; c=relaxed/simple;
	bh=tlhpfxWNLfu1I4z7wJOpN0fnYBl00+DJVsJb0YfBZgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Igs4a9WXJBnLxglIUAIZbKKxClKv/wMcAo6e/mV4YolUgHulTUy/zefqIFAcSvFJOz3J0FfAiNgARQYkvmIeyNlYM8tXwuU1G7cl4GyMMXslYEr37Uc06tO5/gM/w1IKlf8BEScIONW9NKaE6vRM3EZAM08r29aehKy8MRuJPxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NMQml6MH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NMQml6MH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso23306685e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134587; x=1784739387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JJCgbulnP4Nf9RZygKfTbaFY/tGF9/egVfE7dbW2pow=;
        b=NMQml6MHQhoW61KgEok5IzuupbmwLSeFehwDKFM1opIf0PN/gtmbf8y8DScm1b+X7W
         ehqRPI6nndkaOrFdd2m2ea9MOgJoOjikAySa8whwwESsAgUWOc8e0E2F5EHU67G6FUYw
         psmVibi+0ps/fdnkx9fpZH7CG9bDAcNPMdR4ghVqfIGBoqlD8jbGJcmgdq7bBWoY2W1+
         1crBOBIFU6QWK5DhPDVG0EQrNrWPXsCxIH+6Z87Kiw35Bgmgm83A6cT7BNdsGU3iO4bf
         tF/n9+tqvsP5qxNKCOLQiLuXC0z9X5uZwXTU/II7U/3ewt9kOuIbM5lNmpymHBRgQE7M
         S3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134587; x=1784739387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJCgbulnP4Nf9RZygKfTbaFY/tGF9/egVfE7dbW2pow=;
        b=PKiiu8ycRMHaY52Th1OHZRmqA+46jm7fHTFhTl0eu/v+l9iKHJFcWlpqqSLOKEXcLt
         RZDVCS7MBZaobpZakFKSEvjy4CMnsTCuIAGOgX7UMuu2oCzw9I6J5j6tV3IjFSFfMSzy
         tgaEgWG09TX1wnb8adb6bMOqG5N0ca8XzyI1utznkPkTgdHr2hTrTbIXpsC0R7gGXdVg
         gckV0Ilg+vrKWw07dVCbL4P/IIHxLxv9//H5eioiEULKlVO5VnLIz9wGXK1eRdApqywo
         9kQlC7ZltPOdaXo5265So+xEDd9Ue+d1Gwaj+uUcmYN00Jf5WLYcUXcoCbLWNg5NQhPR
         yJLg==
X-Gm-Message-State: AOJu0YwYQN0KMlXnPDLtnYRdKpFZpfSJ6Ey3McmxwpKjYtaqwmldac26
	6eEV6qU0+BUY+YvVCU5AIWCk7xvUUsGFTn+VGFQFHlOGMGZ9lt/WoMyrEcBet1rimOs=
X-Gm-Gg: AfdE7cmDQUrOuC52KN6+aBKkkLAtaKFue+9I+QKBFsthdf+4prUxOkJIh+95v6n9bYc
	e1s54USs9j5ACvtwqieSkEDQdNff1EUo9EYNH7Evzihh/E+smAXSUnz1bqN/O0M9dwge03v1OVb
	JUca3nTYebXht+VptxasD1Gqi0OF46UxJzuwVLhmsr/eztN6u08UtPOK1zTV4NCoyyytin24sO1
	TBqszdi0n5Ll2g8R7XbG2tb72TtE34EdDCvi81n8L1w1Kkmg5i7OoPbSBX8I9N8Ti8UrjxTSJGV
	cXImqZVJ4Ka7pgLJQ6dX/J111huEk12wztjearPO0K6W+HPDcz8jbmlguToPvInGPuyxgJPSVOP
	0cSxJODVtiHdC/oCz0nj0TQm+aq89NBihXjhnI8iYE0bCzzmI+XUFOZWloCkeSNBgl50LnNMhyL
	fnC+ptO4YiaE0+a4BezvOOtVEBucOBKdehOLeV0kQ3fAmsCvpQodwYiTaj00b90XT7kJKqwsWhL
	po=
X-Received: by 2002:a05:600c:46ce:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-4951830a532mr102332995e9.29.1784134587182;
        Wed, 15 Jul 2026 09:56:27 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4634debesm17815408f8f.8.2026.07.15.09.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/21] gpio: max77620: Unify style of platform_device_id arrays
Date: Wed, 15 Jul 2026 18:55:23 +0200
Message-ID:  <3cf798acf13dcd7fe0df25c956ec0f15819876b0.1784133987.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tlhpfxWNLfu1I4z7wJOpN0fnYBl00+DJVsJb0YfBZgQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uU6mp9gnJSzu9df9PgbT8x/16Ut9tGBmTEV XcuCdgkMc6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7lAAKCRCPgPtYfRL+ TkUlB/wMAhi6Ro2xhwNgk2YzkPXVTehI5+5tdRx9a7MfSolxHJabcxcU9ZCLhUqE9dtm0bg5fb5 ghFBJSLWH9z8TN9/AIGGpoRh6e2DX5IK8lctxg6xy5CIX5pK3NGtv/bkMsEQdQImmjU+63dt7MS o7/a08i8wMsIJow793X0XB9bHR13vk5KSKEbU8DKvhC1d71nkPqvs9Y7PrtKY7wgGFb0jbf0/NU w4Cqwi0bWxEeBwA0MGOt3pvI/+Q2apHuhPgkM9tewlKc3IYwsT5bblT3noKOPRprw6KwMAQ/8lg vsdjk+va+XCDio2PKy5y26EZ4Hb77p84mA3Xru+MLcFNdV/Q
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various platform_device_id arrays to conform to the most used
and generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the single offender accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max77620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..99ac7ffb650b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,8 +365,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
-	{ .name = "max77620-gpio", },
-	{ .name = "max20024-gpio", },
+	{ .name = "max77620-gpio" },
+	{ .name = "max20024-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.55.0.11.g153666a7d9bb

