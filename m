Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447298;
	b=EKiebrAZ+RKKpQ49BbXHZS+NDxSAHBTajH3QP8xPvKFhYDmRkUCcClZAYeeT7xY9rPKm
	 XpqhV25O8EzBIcfLrriedY+AW0qak4XXEVYmmnzaUfTklC89VUfeLqpTLIixxIq2VBT4A
	 ylvKmpGqZ/LUf7G3vs9+//uEIgxHZa88rEXcCynyCe6yaeN9Crzqr+xA8XPA8JezOEBIA
	 LPyDzW7L4mUInIXXbGLglV7i2cz5CZdirDJGIiUWE2sM5WKRrI30jnvLDWUPzh3LUTZ94
	 p133vAf2KNcsOt6xbGlRjWSDhwHpifdSGpGZp76ojR+b8jdtGepjNcfAdWsUj8PH5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
	b=1LPOIglSGVRD9ZwZ9rYbscP3dOg7SjD6lPX5rLfScPAP0iIxBeA1FzYuEHKSKgmZ1izY
	 tR0BObL5MgXTAk9a/KEhrtgLs0RE5jd8GjgKSUrUEh3E1uRu2l+hnCWWiIiYmp/cfkpcH
	 oN3DgfwpFjevtNnkKI6QRNu101sXkPb7jqwqrFiYuEz01jIjd+sY4HUCp1KLMyieo7NSw
	 DLAqy3cC9rsw4PLfD76K+aK04jZPcZfmoj8h7HrcGBLdYe3hRDW51a5pIVr3NSs6mNolZ
	 aC5YGERxqgprZGJYB0b3ifyiNdCMZMk4BC5aidYBRx5Ad8KowSvOiB2VUGWnbn6eNqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUKLxk2K;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D3606A33F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2D3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cUKLxk2K
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so34137225e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=cUKLxk2KwQ1CFNjJAH55dYSowalnoMS30KlFmfFb8/N+MJ3exeJfkl4VS1J7+/m0z4
         CD41NjZuAo0C0xg2DSfSQIcCFX39/3Pafl9W0i/Mxu+b6Aj4sB8y61qqcpCBtXbu0l50
         WR9q/4ckU1UDOVB7OvM7kUJS35kUzB3EvX0Zf3tXfkqo8q1Dv/kJFm0qcxhxmOvyFt++
         JwjWYXgwt3eiohWqgRaUlDUiXq6i2Doh8KfmqKS3G12hVppqV2c5ztjV1z2h8bQGMQRb
         QhNW6EtHJZFV9i0GJ0pwBOHzqz9vYFH3ZDtfZkWmplZ3miZrgLNDKiMqtib1kaZDW+GA
         1NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=U/pch1/OgRQOVBTeMhGipcauXitmZZV3FPo7w5mSqtgakgXIyM2r6fYKKpj3YEBgks
         /iLpLKeFM2Ga3UNEZiUu5bERxfUUiSEeG+qS4b+DM/ttTJIwFgdwgNLhgRARKPewdKyW
         2LaA4KLFPD35xnD4H3jDMHjYX8rM8sU90k6Vv6E+pfKjueSb/DwHfGRk0B8jNLPKi1dE
         7h1gMCgLS7aqh8MWfmgcVttXdhlU1rFdgupG4w7zcHPR6PobjZ4aJW8txo1q7AIBPuVx
         PCLdvj6/+6URZi+hQrgjG40hypfJ56DgkqJ9SEH4pu/ffOTDvGTRG5DZdHQkmHAu3SdD
         oxbA==
X-Forwarded-Encrypted: i=1; AL+hErFMrMl1BQPF9obZ5DmGfmNqCnoN/EjNPJwqsiCywzVL/YUGDCOdGPSp9BnShWCniqARGIOeUzUkvFoV@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Rxrj9A6+aj5b25XTg4NxEHVYQC9A9Xj4v+hWA1iVd5FjvHfI
	LyxZotvx8NnxDvlfRPnK6zY8nb9zcIp7+Py9EftBW9f9viK8iLD/j/QNH2O0x6Zrykk=
X-Gm-Gg: AZFdTZcg3WKfxAYbZvHqLJob4SDZAA11nreZvFZpipgUDKLQvAUZhGAk/BPtUVoPESn
	BgK9k+03uaRLW8d3tcfv0/xdwvXswktboBQ5VktXFG3f2lCZgUJaZfoxwgcE6rfKiDr1qvFo0DQ
	ciKjn0KqHDqxE8nLMlPijdSS25smF6Q88XBHsjI1Ltg7jiW7ph7YwRG8y1rRgPBxGqdkP7k5+fn
	pteHOiLoTNUjqAijHbcr3iMoMYA28wDEVLbGsRtXFQEz1dnHIALAGpt5XDunvYBigGwXmay6j3V
	tv3cN2HjAv2kyB6XLrm02uWRjuzkUGfHpnoVj73K39qiygA3s6f2BtwWzgiUYXxVRGoETrQcsjX
	VA1Nxk1qLhNSDRXIaEQNx6gjNlEqzUnr7UI5BZxknE0sl4TLP9mYvhEOU+1+1KhWp6B00XTPzfg
	xNusS+K+7g5qflb2409X5CMYTmXSfuzDmIRNaa51rUQfMKrkuZlO8c3ksmNcKtDyg4USY/MudsM
	NHfA+LGYcH811uA1bquYVpYGQ5QEOKqZotOZk0ReTuHe7G/4XZRZ9YK4RNhm3piP4wZxCsWR3BD
	bPbIVXo/1MnC6bPdHRMCRoIdI1Pbj86039z+ZCZQYpVNroykH6g=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr163432115e9.26.1795447296665;
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm313174005e9.4.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:28 +0100
Subject: [PATCH v3 06/10] pinctrl: scmi: convert the drive strength with
 MICRO / MILLI
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev

MILLI has the right value but not the meaning of microamperes per
milliampere, and <linux/units.h> has no current conversion constant.
Use MICRO / MILLI instead.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 80c6e83a3a2a..dc3282126d54 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -181,9 +181,9 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 		return -EINVAL;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (*value % MILLI)
+		if (*value % (MICRO / MILLI))
 			return -EINVAL;
-		*value /= MILLI;
+		*value /= (MICRO / MILLI);
 	}
 
 	return 0;
@@ -228,7 +228,7 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		*arg = 1;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (check_mul_overflow(*arg, MILLI, arg))
+		if (check_mul_overflow(*arg, MICRO / MILLI, arg))
 			return -EINVAL;
 	}
 

-- 
2.56.1

