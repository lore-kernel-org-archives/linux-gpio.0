Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788131;
	b=vgxtOn8OjChA6MqPP3r0hAH95UXZBlE6vWWogkIJXnm8gVn3Xvejeo2Yrwqp5nPGUtcd
	 KHDSjYY6sx+AmxQu/Iwe32LvJSuCqzG07RmrmUNpH3vwK/oOK1XVorYqb8RZmXYYwqbHv
	 G6QpkYN3AyTslenEKZXLNPYqoVjXJBrE6bZZGu+G9SI29Eq3brFddaQjCNVKadnE9llqi
	 Mb/zzGyphAQWHDW73IsSX1e6n4tp9pXV9iccOWjG2sixSWCURkyvWA3nX5wLVlckGkY0u
	 f1mY0f3hanSJren3TgG9PXyIsU8u7livyQNmhhig50YNitt31iVGOtQbpZItB0NnN9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MnyZYcAhN5YB+BHIBPYmvkepdfwjhDJxK6kMr/d0yZA=;
	b=nUVqF//HR2LLvYGu+kBVSqHu7oMwmDXcXNZjPIHAN+vq9Dl+/z9etsGB9Px0v2UFoC9Q
	 v/fJcCWTNdh+Q9QLVZSv55K8PjvQF16Nbm8ifmdQsPRNvCVJi4LIjZgy3dyDQDgE7QtKz
	 xBaWiZGsB0R2kl+nT2EO5gyWu8nUKRLneBLbubHh08cPolEoQvnJO2tyulTjaNb6DSpT5
	 ZhI0nLaqfNW2rbpbYgwC3tVbnWEeGatsqUK8MlkWztuwxN6hTN4puVQLh/DB1Gke4oX66
	 4FMxTb43OX6PQSDx9fI6hXAWJ4gkiww7c3NkgT6ThDHWc4hmVCJM3mGnq8CneG+edbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ZpQxJ+0u;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B1606A32A
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 20:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ZpQxJ+0u
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8548735e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788129; x=1793392929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnyZYcAhN5YB+BHIBPYmvkepdfwjhDJxK6kMr/d0yZA=;
        b=ZpQxJ+0uZbQIi+Xorn0rFjJHsq5lajm3IKxrTWKEkqGRPXjr/5B54mREeeJMnSNIuk
         9lQgiyz2BahObsl1bIdB/YI91tO4o6M9xAPyeC75U2nZuHQDRC6IY2+IvkeXMjxHN/ud
         bL8Dwq/U9aepGAnKxsj5DECrYnlK7y9qMeLevcrIG8FS9nM0lo0rW6v6d5xfUlHaspM8
         L7ksoD01ddPprAMYmCDsBQV+E3rQVR8FcF7DyK2kQ98SJkDnOGFur2a9GeTeRgm/mBc8
         Q4JfKqOwoRSyhdIgohPAJTNMUEKz8ExOQF8CcuURYu5mfuC41G+Vf0MHt5CilQ1GjOPB
         Wm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788129; x=1793392929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnyZYcAhN5YB+BHIBPYmvkepdfwjhDJxK6kMr/d0yZA=;
        b=Hjj6wTcWEofRjkc7zKH5+j20/qGVved4Or3Y1ws5dsq94YS9qaBun3zgtBDgMfJ6J8
         LFAsAfvBR36ybvf4P5nYIYkuEi5eAR0WtXXdW2bEm2kfmKTQqLU0bJxapLOj5vOls6FU
         S0IsuoSDF50m4qfO2PCuH2v+v/8I1vufIjrksMrdyDAaHcGWyS3gJnu+tgcZ7gMBmdXn
         E2M4KJ4dMWI6QIYfJXWoWgvGUTg2PjELZHGLQb/E5ak+uhNNGEPv6JiCpbynrqm7PTcl
         gCXUHNx9bz28sBMUjRWa/i69YMJzTutH67GUTuUV3A4gFACgPdu0apFIlFHZ85QASvj1
         5Zgw==
X-Forwarded-Encrypted: i=1; AKwUvByTGNPliSTR4uLM7x4miuHC8G+2CAHF/bfiUA+mLcS0oUCdvEXRgRQ1X1dAYaS8lw+APGWP4IvdqlXv@vger.kernel.org
X-Gm-Message-State: AFq9FYJPyUb8PjVPOovtfwenFKeoXQAu3VIc4KMuwNW+WRiQ952fiZcL
	v5Gy+NKpP+77j1yRMcwroo3ClTTBc4hNhvctp3HdyrtGT/52aMViNi/mjNUV6ezVw48=
X-Gm-Gg: AYBFou03FRCIiwUQ7e2w2FURrp2e7weO9lGLX3/SWopJc/xChF5ZUarz8k9S6sM37gU
	SPXene8IE3MT9bwwmMUoEeFiGUlQTJvsvY8muxwUpwzi11zYKItx2r4wlIndWD25dNapxNd3lxg
	sgAQnUncx8nPyZUvFpdPMEs/ETFdwxkvvGXXbkNUeHTmrcIegHvlr/03n0MRrPRFuxGWFdZIkoZ
	VtTXUROlsZe2B2Rh9EJE+2crv7XRzQeVcJxxpLbrVhzs1SSyIz6vpqzpW9Cc9ASUhEk9SVVyY3V
	yXi+1rx0Yw1HuuOBLDciBYn4G2OiyL+ncKlnaWUtJfKnuYQWKrBbFiMmseVWsdz/1NwCSQ4L5RH
	ExGPqxbschp7YGJVzPr5D8gZJtmmvG4bOsHqtWvNQpUGH5m0FqowrH//MQvhoce90QrMSjHV2vD
	N5zXjMfAIX+sPTvtjn6Wi13uIXR7MwnRrCCrOKiTVG7w8oJG6UBozKzqgPpBCBkv6mLuszPZtuH
	sJkCUyTo218JjRD7OeNAc+0mHZZkbXfE8jXE1b2J3z0StoIAXuPKXGcCZWDuthHHQ1wf63vSmza
	djs8CNwxlK2gC8TkGZgyHItmQfmvwN3+
X-Received: by 2002:a05:600c:8519:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4a35ac3b22amr1048415e9.4.1792788129204;
        Fri, 23 Oct 2026 13:42:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm253565f8f.38.2026.10.23.13.42.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 2/2] pinctrl: ingenic: Add an X1600 group for 18-bit RGB on the top lines
Date: Fri, 23 Oct 2026 22:42:07 +0200
Message-ID: <20261023204207.48277-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023204207.48277-1-olivier@mgcrea.io>
References: <20261023204207.48277-1-olivier@mgcrea.io>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boards that wire an 18-bit panel to the six most significant lines of
each colour leave PA0, PA1, PA8, PA9, PA16 and PA17 free for other uses,
which the cumulative lcd-16bit and lcd-18bit groups would take. Add
"lcd-18bit-msb" for that wiring.

Used on a HiBy R1, which drives its panel this way and uses PA0, PA1,
PA16 and PA17 as GPIOs.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 28e7f1852054..8c424db27fd5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2442,6 +2442,17 @@ static int x1600_lcd_24bit_pins[] = {
 	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
 };
 
+/*
+ * 18-bit RGB on the six most significant lines of each colour of the 24-bit
+ * bus, with the clock, data enable and syncs.
+ */
+static int x1600_lcd_18bit_msb_pins[] = {
+	0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+	0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+	0x18, 0x19, 0x1a, 0x1b,
+};
+
 static int x1600_pwm_pwm0_pins[] = { 0x40, };
 static int x1600_pwm_pwm1_pins[] = { 0x41, };
 static int x1600_pwm_pwm2_pins[] = { 0x42, };
@@ -2503,6 +2514,7 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
 	INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
 	INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit-msb", x1600_lcd_18bit_msb, 0),
 	INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
 	INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
 	INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
@@ -2549,7 +2561,7 @@ static const char * const x1600_i2s_groups[] = {
 static const char * const x1600_cim_groups[] = { "cim-data", };
 
 static const char * const x1600_lcd_groups[] = { "slcd-8bit", "slcd-16bit",
-	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
+	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-18bit-msb", "lcd-no-pins",
 };
 
 static const char * const x1600_pwm0_groups[] = { "pwm0", };
-- 
2.39.5

