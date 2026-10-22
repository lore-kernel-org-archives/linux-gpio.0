Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705989;
	b=e3y0iGW45VX0E8n/HSmEYlzp0hY9huvP8zePyqGGr16M8K2AyXMUIipdZnW6HI+sPOL3
	 5h1dUPMwyQhqAMxf2PD40vUEZVw8aq5zqo4OyDUErR0gBC5PuGTvY5STEaicGfJClkIzj
	 WwT8ebFurUKneE2XOVWWGWBwynObPmfz8rkKih8domeChkxu2GoNpJxGT8dqp46V2d9T6
	 kPbLpJhl4d1sCKp0Zhresw9rsOOqJyOySul/eEjiuClEw0jXiIBU/WB2HjXPmF1N/ZMY+
	 0bHmKqZVAEIVpvGlm35AabifWJZuVFEGs0V7fmQHfBZyh+BqUwcoqT+6wLAkQ8pIUzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=WLgiRTVFXC9pKpiC92G9eY2w9buDYyNgClWHvbR/q6U=;
	b=VdTThNJgVdcgL6kjOH6dnoHcFnpnMFXDzZwzXi8NTpUmHcaJnDCUVOG4MLZ8W0HzvvOb
	 SYqBHhYxyAcV2qFD8QLun2+YIywjmfVDy0ciy9Skl/hADn8o1cJfMMYMiuxn1BStOkD0b
	 7Va/0Ov/x2zRC0tDqPN5dTyrX4QGwOlirSF5gvo9v5sfFovgxY0Z1LzIof0mW0e1OQxnI
	 5oiupPte21lTowrD0R7R78koyMaB4lNX8oenfOagcUZSqfyUS10ZwdTL2v8DXB9e6rVab
	 MnxLV8uT56IAcu7iigah1jyiT/lOelJf8XQr3H7cPyslJ1Y8ANnUV+zyE3Zsqq2NitA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aULPacGa;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAE0606A33A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 21:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FAE0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aULPacGa
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so295444c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705988; x=1793310788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLgiRTVFXC9pKpiC92G9eY2w9buDYyNgClWHvbR/q6U=;
        b=aULPacGan9SbyeH4kk70Wz/etwECX8Yshlkq/AIkaTXU/jfM7Q2dtCEEeDll9Lo4WQ
         6jt7dMBPLXLaUOVIA4FcVrgniOhFHK1tAGft8PlC0JDeBctwHI4ZSOfQl56UBXWUhr30
         JWZoS7zvAfNnvzJFH8mzMUbcpSbTiFj2i+wp1j/k6Qhp0XuPlg/p2+v0iyi1fy91I4tH
         RC5EVOjfQsWZf6TCeAW/gUkW1Fo/MLZ0j9zSk4jt1tKSUzn8Nfx75/KjIB8iFyu6yWiQ
         GFBcK/R7faUkfe5BKM+PnUtfh8eJRjfXyawJl5IKbURXajsbEcgl44vN0azrIdA2YOpd
         EeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705988; x=1793310788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLgiRTVFXC9pKpiC92G9eY2w9buDYyNgClWHvbR/q6U=;
        b=VT7tZu5d9QZXsiiy1VMnCEagxuEBwrabmjBLXWJOh6MpliTtLkDEYht6UIBOQ4a+7M
         UYmQHurNixdRIWgcnl5UfolXdlXF4CsJ34M6yldWiU4tIex7ZAGoEUEZdsrmOCTlrIDp
         ABzFqIqaFO/yoOTxrTKBk72p+1uAmaC5w4psqBFH2Z7qTanvpsz/LfWWPmYzjdi/EsGK
         rECQcwEVVKBygpJ3ZQHQH7G/2GPhfbXrHjbv3lNdALSnJsZBM6VUKgVpbiUv8QYK4SLI
         URFtOjlgRG/YjFLUTCmLimvwsj53Dr/laBbxZOFgGuY8cADdXCtYoamqhiyEiDgrSkbz
         Df0Q==
X-Gm-Message-State: AFq9FYLnLMll4ifQCpcsOJtjnqKMqf1Km7UmqGikF/nPVfmev1sbR9Kk
	QWWse3NI4xK4c5R0+HY5mivdwiKpjaQZElqJAUkElsku6d92U1u17N3S2wLEaw==
X-Gm-Gg: AYBFou2uO0fCg5S+xnlui+DVVVIoZut45qCGlYKnZU8S0/Ugn4rCFO/guR9OgJbYEAI
	OmwRRvA+zdgIMk6ORtpZj7n4ZGk3fUuCoMLPxNs2Y+EHlz4t0dDo6u7E6vpga66GmN/Y1UoTFwN
	Lgp0/y8zRvez2jmRaCq9w72uplfjNXFjqxWNkAG3exADpd3WYWoyRthISZ0cm9+7cjatWZ3RlgW
	j9t2FVnS2mL64Z+Eu3L8sff8DS5y2oxoaCBaPAndLXHfb/F3RnMgHT/kej4c+dOB8oluuYLGP1V
	mj66Y2dcP+Dmj39PqSRCRxYIHu/3eSqlr53crPytHcgvk6CqE3h34YGJ6hOEJSgU+x+jQ4dGWAG
	sDdzc6VybmW0rlO0yZNVRSuRDet2molLE7LIGoPDGQp0KuSaG7rX4o2Lnei1D3Z2FZu4xeNQefU
	Yqpi7z2UeEDMCBhAoyV4kUBmOmp6XYgJz1JX9TLIXudS3cViyBhACaPuI0yTvdyJLAF1iBPJoow
	zIaJM0BdICJ4K+mHLa1fo4D5QP+9UCsLAqsT3ykVX1lCueqYlTN8dpQ2gMtozgEQugAptRRDlhx
	1UMUIj8mcRbNO7Et4cNhIdfAyYvub3IJGm1mFZ5/J49Y
X-Received: by 2002:a05:7022:ec88:b0:143:868a:20c1 with SMTP id a92af1059eb24-195c74c4f06mr770405c88.46.1792705988425;
        Thu, 22 Oct 2026 14:53:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:45 -0700
Subject: [PATCH v3 1/5] gpiolib: of: remove redundant IS_ENABLED check in
 of_find_mt2701_gpio()
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
Message-Id: <20261022-gpiolib-of-v3-1-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The entire of_find_mt2701_gpio() function as well as its entry in the
of_find_gpio_quirks table are already conditional on
IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448). Remove the redundant inner
check.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f36e4b171fa7..03ce98baf68e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -629,9 +629,6 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 	struct gpio_desc *desc;
 	const char *legacy_id;
 
-	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
-		return ERR_PTR(-ENOENT);
-
 	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
 		return ERR_PTR(-ENOENT);
 

-- 
2.56.0.257.gf7497c7d27-goog

