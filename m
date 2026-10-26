Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032171;
	b=e74CZD/NfvkJR4lwa3ZyDDtINp5hBzQ+yo7ufMoxaH1dPYCJT0FgrC/wyvoFvZ0TRnqi
	 bO+ysyK4hSPG3U2QiO4PAmYaowhmGp3GNiOqcImbbf8Y7AyJC/91vAohgtayOH+LBG3j7
	 4FQ8ZgsDem4zTZ4JqdQ7GofYAuO8g6g2Xkv/LYCgzv2dTfWy3zOCRwsYbIcjfvfAMlaRr
	 8MMhc8VrPM0DdZ6qHKyyxOBCu/rnVwzec4+lpH25abF0WBiX7R7rZvcSUgZn5Ndl4ib5d
	 5+T3KCUuZGR4IFMNQCQZAh1ejYb2EIGY9i+kSCH7RaldTgvL8MUst9EdQnIvZ+2X/nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
	b=VkLeIJD5G7FTpLuYU06bY3DhuQ5fT9ujrCblQwF7VCFHwRgWOrEWfHYozSzppTROdKBN
	 VIVAcokJf572MQbTZ0hyTAVa7A0P9X0SHyYhgNawM03eb+zYW7mYLD3fG5dvQSzqJai03
	 BmjYFbzrvK0Vhz2SSa85juOoWIN5iy5TCTAQ1LaOZzfuqPG7jlitpWI+2uJXXS6dSpV83
	 OmZCXes3sFVwqczkuzxjjRODxXG8tjBJz34UlFcdN4M8luS1mA64AkuldTGGybqvJUwG3
	 HsW4TM7dlcNUtKqjqYA2lS/S/mPi+kNboiwCX2vtFLRlgCRMU0ZQWtfb3fdAI0X1LKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFvdN46h;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3546606A325
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3546606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UFvdN46h
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so15529095e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032169; x=1793636969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=UFvdN46h6VM2vLA7R3cAPPK922u9tSe8C295U9Alqm8e4DsJtko9nSYuvcn4PyXkVb
         bripretixYg8PzKsEWrod7Q5w6I6B/qaWHytJZf/6OjOEs32KYdyHheMIo/M9/preWIV
         HJggu63BVDLzDPNMGF/sJ0fo5jcnLkQB9xrmIZJrLg9IPYbqW4o/6whBKpoX+K8UTsm9
         CCYqMaVhrC8+DKwudmoMyu/r5JL1FT9ybYW8J4zncUFNqhgWG/K4ORaQnEDaRzayUOp+
         PCcbUGO1LC5uMXL9ZdVBRhdiJEEKnf8vWJZmiFa0CgifpihVg4JdHF4im8bGbsEj4iE4
         kEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032169; x=1793636969;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFk2qUWDXql5/0l0pZa5WqN5xrNBo+HVTxlmxrGp31I=;
        b=ZlPYtxaYXBZVFqrHuXSWT0eNABRBZt30N0doOPpDQwjQi3jVBEUcW5528JKZTXZN77
         uvvSpSNn/KAn9MzMUrRET1IyIVknVpukq/H1ChpyoKOIOzwiwm+WVOk4t9Bo+4b+sxdG
         y1fuxOapm7OmKrh9kTW3unXODewHH6bejk5PUZEPrcJ2hAmlAUI9nF0J7+UfIBlr1DxU
         QJyLGKBRvHvjx7WHcqekCP/Ixv5z+yahRV3qSHYzMfR8cwCUOZJzkB9GX3Gh81VUQGbZ
         LWNTiHqmP8J0HBQVk9r6dP9UnerGMRVjR6HqIfKkDMDs11OCGEbx233Ykz7Jm/PT0uO+
         klsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGhSiR+TCAEiUfyonmb8vT0k9QOtv9Uz+7A/JVEwqNoF5pX7A7dqqxuLG2VNONyX31z3bUag2FeyYF@vger.kernel.org
X-Gm-Message-State: AFq9FYIB3pezoC6LeD0seTlTOky5dxZ0zmJkpTSzawc+6QBpppJvKFbw
	zYEcZWhqk6fewDQHHhVPdLTU8ip1IlYcdm2aHD5DVEn4BLAU8Xvg7vVkwgQo72RSAUrDFCy62mY
	04XRk110=
X-Gm-Gg: AYBFou2cTgbu9SZIL8TUTuvwUAVHW5GCyzl8Eg4IqZ5kRnwudGEaDs8nrg8R07y3A5i
	b7MpHqWyYUTDJh+BBNzhhiDhu0DzONMAdvXFSxwuX2sccCIawVQr0bDY99DyCWAEcu2z+/kk6OR
	pp+Qyayh5ZNyNubw1v4FfX6aGYKyHJnI2sl8BBAM7xq25cxQYEMwonmximkjUnPlCcKrQtJQNCX
	4hG44guxY2SSNQkq2dQzfvDv9epTO0MD81LlLgfdqrqSzCEkwvUSbmAzY6NUDY3xU0XPmDEqdDK
	m9N/fJMB8sGxpTgHKn21Cb37z/QS/SD2GJNrRp3AYo7lE7ZKFfcA+1ha6pJuLy6PUoANZax4HU2
	cvWJcV5u0vTslTsqRJO6OZnasAR8W3wfbZQUX7+I7iUX5s4gWLQHmWd+yBbpF/fTlLc2S3cBlRH
	DwWfJYwj2xeHPtOvHgRYnQnPojQNbrFyYbd+F9gg5x+lv2XEFzw2fFkTqWlpYDGln1GrzIkZDGC
	qFxhCkkJ2pDz/LFa5riZRjnhYfBCNHd/X1Jfq27oYpmYdY/Gq/CNe1fPlsaSm6fR3GRHlDquLzX
	lusr1NRUCsCLWosjyc6WCLcfSCXGDnHMvX9ObyhC/jI=
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr145516315e9.16.1793032169353;
        Mon, 26 Oct 2026 09:29:29 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb851sm14919875f8f.26.2026.10.26.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/22] gpio: max7301: Drop unused assignment of spi_device_id driver data
Date: Mon, 26 Oct 2026 17:28:15 +0100
Message-ID:  <0f73136ac61cd1ef0a00bf074e3db92f49e79a02.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=N1ag9qLsPodh6SZJ2X6l/iSN9O9FLF3gpdlS+1pEOA4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+mt5/hwLD/cV+XWUtgyFEIrN8A9KC/E0J/G JWLGTDsDD+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/pgAKCRCPgPtYfRL+ TqwtB/43N8psTSJkoaY6Lpg/IFwoExOM+XhsEJkZNx1LrfcROHleJ0xf+JNaa78FJXkm4GFpiOu aNkIhfZH+1LG7PdFr879gBb6Nqjpr3RlLgy+kmppercgVINS9keN/L2BBqmIZuBY8gcVXIMXQ19 fRIA4J0bD6QO+l4Iuk0pBjk464GoCZoyXjQZjdFYitFUCRRf7raFgs3DCSWn4LxvFFLFyWukIbs HgDLO4BsLiVl0yyOxAXaUkUrLgtrd4ENcudGX4Q5w6Pl1zBWOhckuf0PHZqBs7y8fYxXz0Jwm86 fFVoOw9R7l9PIegHiCg0Kw9MOdawsQrcfuw4opmsnmMLavA8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max7301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 11813f41d460..c8bf6a9c3de0 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301", 0 },
+	{ "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
-- 
2.56.0.rc1

