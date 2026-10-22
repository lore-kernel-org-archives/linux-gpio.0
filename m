Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705997;
	b=Az709IFWDA2WVi38wPSDRIDIUkGTDNZ6ytv+uegl0aXKvZ9FnhmT7U+24xrpxl+7DZxK
	 V+huXizScpKURy0rbZJG7S3Q9uast3rzwvwr715p0hLTBznC0o1AiSdZ4esdjl/7wlGbz
	 qjzBHeNH8K8ftaSRpTJ72N7pZ8XiNUTU7BpET5DRlqNhyEk9AAq3tnsFr6U7YRUYHUP/a
	 xEDXgWULe3Wd2am8cWEIvHUfGVAXQAS+3WLCl2+5XlalyW1XZD4HDRiDdqgh50ZuyXWSB
	 KjbwjBXhVsHjtOg14IKNFjNY7P3+hr90YM0WWcCxwUxsFx7bahxXwvt2Tg3RESiZpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=+7xYBNBMdS31buKtvrCVWN4DltJtCF5Df1RCKstunLI=;
	b=ptcAz1j4PoWjFP2u8YN5nMxmO7Zi6OBaHEa37LogMqLhrZ4dn+GzNr4whGK9uMMezL/b
	 JtGfd4tN8aw3IikNWcRoZdgswabrd4FgowFIBUtkXFK/6kRO1TSLPd2RY7btMRnAKjnhx
	 2FW0R+Sggfbpz57MZDVewRqh0mXwfljmxN87TzCxs7hhFtvF6ufdXossziCCl9gRx1piD
	 D0GKtMD1XLe2mVl3BSoFtNjp0NCfvHCoVjY17o5d1WJ8yMjvg2uOlIxIY5eT/B1SnAQiC
	 1IntR9Q1iIMJUBXvM3Anmv4fm6QbguJZkwROPomeBh+lQCqU2TazRG/6s0vnw+3RmYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0wNJP9+;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FE460A3809
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 21:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01FE460A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0wNJP9+
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so310143c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705991; x=1793310791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7xYBNBMdS31buKtvrCVWN4DltJtCF5Df1RCKstunLI=;
        b=g0wNJP9+qMUoq4l7CC7ElHp6paJAwU3peNqvFYsSyx9iyJ0feSsN/a6/yoYX4rTFyt
         1p1RFtm79H9YGeZekYcpSnDgrioq87inFeQrcEng280PMg40zNuwfKO9Oi/CZzYOy3kc
         w+Wx7vKEIkCUwjdlWVWV9lySrd6tdmfIa0qGtnFyDM6e2/QH7Gkotni+SBK4gau/tQFN
         iZobf3y2WyAgUPyEoZA2nWcbiRPgLOGYGJXs4pa7IbBL9plXo9FunqukcMQJdCrX74Ko
         lKjMZTUQpV+C76zEM8b++2WtPSOO6O7y3/Q1Y6+CZE677S2UzOkzbsWsEaJMxhjKsixp
         Oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705991; x=1793310791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7xYBNBMdS31buKtvrCVWN4DltJtCF5Df1RCKstunLI=;
        b=uwU5dLtCCyqe+ANghhlga+w8nl1hnVmPa+isplaoNoIyomg9K2tGZEbrKRo0Aph1Bu
         jvSOT8yuj/T7uaqWIhXzlBqfcfwKn8Eg8Usr6KzQ2P2FcgtBy780X9V5KjbWIXTwIqzF
         0OdjcrWygKjr20EQHKksUIP3TgHW9/24tBzBPU04pYd+v8eUJ6BJl+nb2M/kcyh2rBMH
         Sbe/riCZNL2cEmiIGTAu9vTZ/2dB/E4kZv1lW1gtawO+OaVfWr/zxCFJb8r49g0yQJ5Y
         n4h458fHxKtg3b0Mcnclgic+G247HS7OzyozfWV7mUeHFkHqDg+avqjvDA8Rnv7lyb+I
         qm3Q==
X-Gm-Message-State: AFq9FYLgutaNlbHRX5/oZ84Xlcy87PAvQ0NBYgYouT5pgPJwWZ48TPY7
	QiYp6eo3lySeE87gd3aM+PKxPh2bfBFqJ9oxcOUNxDuAy0cDZrsDSmmKMDaT7Q==
X-Gm-Gg: AYBFou20vE3m7g6wbc/u2FI8N0delHZGs7Wy1+2SX4URTk/iBy263xg8cn71hDdVbHv
	krvi0w3YaOPJ4Evh9K6fjhsHkUH2CeSFpzLrA9EBcDgW4w4TQOCu9sXVC8/3PZynd0+kk74T8GN
	/W4Pr8MgQSzJO9HDKoJfY+oeXEz3ojRo0JhPTVOVLMx4d1hjJlDwTiLQ3KlOYzJ97bmqeUifLn2
	miYvu8UQTgKVs0FmJbejbJ0IY5P36TIzLXkuFIo7h1bd+Zlp3GcYwxN7QkSAGLyVObT/ShSKkG+
	/jzRdWj6gtKv7n/lFeDmfO/AjEctgWuG6L0a3JdoyEzApdF8vgiGIKG4vpt9YQG2iQXLr1OiktF
	OSDe8+nFL69vfYfpArzEZDlwoSFs4/iOjc4DUEhbj236hoBAdHo5JWpJo4Fy3dXHsrEY+WVkPc4
	LhwV8WDmykh5/5ZNl9XTQXUOrKnjLJX/atnc5WDKoqOJ+xi/AE1z5jB72t/rttTUi8SFqBjJ4WF
	r6OLbBlFmu9v0uTnhi7jvCp3k94hgfmDl4loN+/WX5QQ/UtHhwBmQqpWOfRrrYZRg6lbgDUD39k
	8F/YTTjpahh3cgcReO/KGGrn3l9ck1rzXieXAkDN+u/pQA+3GYUVZMc1zVxOItLHGQ==
X-Received: by 2002:a05:701b:4244:10b0:144:fa58:95d8 with SMTP id a92af1059eb24-19599611181mr785699c88.27.1792705990921;
        Thu, 22 Oct 2026 14:53:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:47 -0700
Subject: [PATCH v3 3/5] gpiolib: of: add a quirk for legacy name for
 TWL4030 external mute GPIO
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-gpiolib-of-v3-3-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The legacy property name specifying the external mute GPIO of the
TWL4030 audio codec is "ti,hs_extmute_gpio". Commit 178c169a30b0 ("ASoC:
codec: twl4030: Convert to GPIO descriptors") converted the driver to
the gpiod API, which expects property names ending with a "-gpios" or
"-gpio" suffix. Add a quirk to gpiolib so existing device trees using
"ti,hs_extmute_gpio" continue to work.

Note that a custom lookup helper is used because the compatible string
check is needed on the parent node ("ti,twl4030-audio") while the node
name itself ("codec") is also validated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 44799a4e9d97..424c02f81c20 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -676,6 +676,35 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+static struct gpio_desc *of_find_twl4030_gpio(struct device_node *np,
+					      const char *con_id,
+					      unsigned int idx,
+					      enum of_gpio_flags *of_flags)
+{
+	const char *legacy_id = "ti,hs_extmute_gpio";
+	struct gpio_desc *desc;
+
+	if (!con_id || strcmp(con_id, "ti,hs_extmute"))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_node_name_eq(np, "codec"))
+		return ERR_PTR(-ENOENT);
+
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+	if (!parent)
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(parent, "ti,twl4030-audio"))
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, idx, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+	return desc;
+}
+#endif
 
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
@@ -688,6 +717,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 #endif
 #if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 	of_find_trigger_gpio,
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+	of_find_twl4030_gpio,
 #endif
 	NULL
 };

-- 
2.56.0.257.gf7497c7d27-goog

