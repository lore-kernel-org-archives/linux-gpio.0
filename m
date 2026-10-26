Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032178;
	b=di799sYTnF9olXlxo43cOlwxjuXHtM4jI73Z8fKp0iH8hTG8xRrsKXdUTl0Q7xk94hLZ
	 cX6NSufVBNkTV0HF8+MZcGpC966RcwiucfaJpWEJ0JtC6REOSsUwXozOzTRB+uJdwOEU2
	 XzVyeWoKZqZHIRwfth62IXDKLIEosfb7/S93sUxynOhRXg0PpIwPv+mtPDaSrvZ6Rew63
	 qhySUadq2g9TwzwnACssgdhGjngaj8axsN95CV0cWyG7YikiRCDNGT0RAyOuz9jC5Iobc
	 XSaCrXa/8/iA5xGWgCqBjSrunrrg4gzdp049DL4C5BO+COtdOZP1T2Sc5o0/gBse3kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
	b=osL2Q73qCEe8gLErGZA/bvStatB8d5E0uX7xtvEAhUpDxqrAARYz5V+XBn4sK0/Nl3f0
	 nOmjffdc7l0tJ9eqBAtNOoBzGrlTS0VKpqpQTykpFLSNFsHmP4m7sOjILC2Mzy4PEQG+t
	 3L7K9jmi0VIfiZJ6OKfF77+y1wBfYNpc76eMwE1Uyy5EvM6zulXKqsndnls/oINFB42NA
	 5BffDugwsqtjweA5CcVC0mDq6t7k0I3LYihCFX+GCjluJn4WCVdbbJRXYt7B4Z2I/BBdV
	 3jViyZ+GbxmF+UZA8ZK08MlAd4qKvOF/5oQGHRTwY6B9FEfMEaAL9gJSLEHLJLwUM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PYnX8AoJ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E760A2603
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56E760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PYnX8AoJ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so20292375e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032176; x=1793636976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
        b=PYnX8AoJBp/EPdaPAmaDOiu3H57VwLmwaOQUV5W3sgX4kJjOkFEeFCVImeI07D4EVe
         7acb6XlKclznwA/HL0h6WvfQk544az6Z3tls79dQ/h6oZFaUKyoqdsqNhDtIvmxCuX4y
         4hkh03fwvRkCNUlugIj4akmoJ8NU3cDTQ15imXGfZu7lWTMPej7dgh21d2CYHukpMmQX
         O6Smen/nerGOQKFi187wgZaL89SKjojLaVSaQgVguY7vO1MK2SmYP/qL2u4Ii3th7lch
         Qe/T5HKt7WNPcyH5sPkD0FPkDPVDZs4iMC4ymMlDYAtnKRyOldim4VdV2CSi+/e8NvIr
         cz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032176; x=1793636976;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DufeBrqyUbSnmQ8skjhQG6l+F7Ults2Rkyo8mZPpFPY=;
        b=O3YIbxeaYc7t0VahXqEK3rtZzFC7ElRfe07fWKtvKdfz0HRcDFF5tcgY6JuDdpnZaA
         w9FLbGzAU8O2BWJNA6PHazmil/aHJLLLRTLrPBCR/nJ2X89PiJ1rrQLrJVPtwauci1DZ
         nJ7vrNbooJsO8bUAWB7ZRFJ2iH2vBiDlJW/7FwXL6JJAbH2IPxd7f2b0vXtYMf4Wx8ZE
         pXN8DcOinx9OdqnCibIQhCy/yR602SXN7NbtpqXFhTYyo9fjy7SkCu7Zcq8iz7H2M4bp
         qVdutAmF3iN/G6JurFRWJnhiE5J+3PJpu7kwDCFmlBadknA+9yD+Gyj1SUgy0MrsQ/sO
         HzVw==
X-Forwarded-Encrypted: i=1; AKwUvBy5P0cCNs1VubINkP6ytAitTj61KPaa9fixpcRgEYC4eTpV1yEh8B/xCDjqzBavR8p8ph8UAwtjrqH7@vger.kernel.org
X-Gm-Message-State: AFq9FYIGpY6JRIdDsoKxCn7cS9EqUvvQsSlL+lQ4fqz4XR9/F9eBYU+7
	SP++Da13IKxsOdlwM7sAFmCGLUMmMaI8aBPFAmvP4gsXB9viuIBG6qYzYhujpoQ3OFE=
X-Gm-Gg: AYBFou3aV/KHIifx7wARYGFaqB85t6qxmPKLuGpd4van312TrYkeGqfT42YWyVnKqDr
	NgFHq9FnA0n1GaRxNQqLSGxao4B6V+SQF6mcNt8DkJJ9QH2j9WB7Hzraf5kM5dYE0xwzbbTayj0
	eUPfWntdISGl73N6TtW5q7GGKbim3oaQy5P1Mzri/2PpGIdOlkjHbgK6wwI0JcA5IFG+ZPMJ5Gu
	LaPfbXjoT95+5NshKGHdQ9VN2h+sCchblKWsrVRB5lMgdWMggdRmvfQbZAi9qQ+PpdmZf7rCWce
	IETYolOF27nJ+9m+w4fE7kcvtGKfuBhlwdqdQIOXofMSwhuMghrA8j5z6Vck5pSVuRW7G7yBEuI
	3oC5hYHEs3Oh/TWa59jguDttoResqGDm5ibkSgtQMSXyfc1XjB9HUoJFSCC5pPBD7GOxCsgxA+J
	4oy00q1uETC3KamzewPi/ydYQJ2AUu3BbBWKz/qG8ilPfxsRlpkyGZJ2l9iFkDOejYDEY/aJVVL
	nl40ggqIL09wtuUg4+D1WyIVrMx8bIrr97klJpjQ9tbay5DMg9jNvZxXp1SEFNBLkMg5AKqYVll
	mAsmoOpDNz7zYum7PoWajITDTVky6mWH8MrW3S+wHms=
X-Received: by 2002:a05:600c:3e8c:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a35acbcc9cmr119400055e9.25.1793032176435;
        Mon, 26 Oct 2026 09:29:36 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a03654fsm101933995e9.2.2026.10.26.09.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/22] gpio: xgene: Add missing ACPI module annotation
Date: Mon, 26 Oct 2026 17:28:18 +0100
Message-ID:  <cfd62d95bdeeff03197d772e311a7d88c838bd6a.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xq5mEKXuCDf/ep4/z+js4VuJ0kfEYf1RuGm8A0Z4zms=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGrff62iv6nAXYPQVhP+hTiQDr9MoVev4MMt/WvduocvAV11K okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJq33+tAAoJEI+A+1h9Ev5O/HQIAKxB 4Fek+ZzgGDE7Gm6NtkogRCQEEs5u/HGw2/us5twb5jC06z/ItbG9XAAL2TVWb1fz5+mipXzDeAS muBlbpN2a5XG6YCSsoVfHeLQLW5nemlCoUuDuDt8/tfbyXX2MfMUrjYvWlM34+Q9gxfqFOOmAHX CdxqLGGxR5zAp/GQrh4brInDYAYwf4tEPHLxASlU2rJz6G3OD/EUHDcb5Nvr8LcCIj04THvDFv+ 49od8IDyffC7CqPEgnbjdVzBUSFIKCCkOpCnBj4ka33l3ZO+uqDl93S0v8B6i30aTB6umTdg5FS ZQVU7uuLcK59vd6Nlp/SBevXrTBaf1NpGRJS+Is=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using an ACPI device id table is
supposed to declare that in the module's metadata. Add this information
for the xgene gpio driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-xgene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 22d22962963b..ad0f1551c271 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -197,6 +197,7 @@ static const struct acpi_device_id xgene_gpio_acpi_match[] = {
 	{ "APMC0D14" },
 	{ },
 };
+MODULE_DEVICE_TABLE(acpi, xgene_gpio_acpi_match);
 #endif
 
 static struct platform_driver xgene_gpio_driver = {
-- 
2.56.0.rc1

