Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375921;
	b=V0STaRdO7DBc34z/37PT+DpV0X66L6MsMa/W2cWxUzQKyZSATRqyVbAV6+3oBRTugr4V
	 5Sroz4Fz66wrkD7U6KxHg6ZO9y+BGYd4ghwrpN1/xRYbFMUYISHjO1aNzgTluElRrSokz
	 QFg/ogmZ687L0UIXQq+qs6xDL/6zW0Av/d/f1qxS1Fahh6i4LTwxuzf1ZggxG8/AMUpiA
	 oDeKMmxgdddldN7G+jPe+OEOhyeqtTvXBx5hPpRi0PajC9SXwCMZVr0UihEmQX+2OL2En
	 4YjbRCTzsjAez1iRvKEQqS21aIh+DsZIIhfwuUPseaFwbueESKA4ZITNwGthh7LtwFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
	b=Eq/K360ud0zxakT7J2LJ6euzHowFRqwi/wIgLT2V8Oupt01cHIQbis6BI5q8onn+/lJV
	 Q/0Zdhd78N7VCyFjuQXvJW7yy4peY+QvoPR32uy5ZuQEGVdm4xtTULmg7dw18d/NUhrps
	 bEdbMefouffBcsh8Tyjh2N82g5KtMwpJ1Z9DvzW2IHcxKnKK4VKZYekFVVhzT8QM1vR+S
	 RhMmSe+DdgJ+iE0+PyAIRSV2W0Z7WIvja0gbnmzl/vckwZ0ZgXsyYHcsxDZED13x+PGOw
	 42C+QeKHsRO2Oax5YmlDW+dxxGf3ZCgP7LEK9pRmdlxOKMhEHFn62A+In1UW1DDOSug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkPrSPOh;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8999606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8999606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TkPrSPOh
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48bbb06e746so445856f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375919; x=1793980719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=TkPrSPOhxPJ8/bxACPBSXVJ+BuLIvkXtRzxSHQG72tIqYLAMBWGX8ZMWGWVtCqWmQp
         N01CLFwpGFpFYlXH+bMZEjarAtD2WBgpICxPW5pAfFoH4T8b2Sb3eF/8pemtj5sj6zt6
         nr1EbGe2N0xwV0VUrkjnsCBvvueXWqPUfwXqu8ORlknhzB2JS7lYcvcIXZHYYK9Ep8PK
         DyVA/yLPcSmjLT8kcEgeMumP85YaVCItGKWb0/VFLR6mkvCo3a314ziPXHaH4y8Yy0n+
         1JmvVJk7cXax2dL9tV19lWq+AxYwxOTP80JdQt6CtRaFdPGPsavY/gHTo5foawxftbBU
         Sfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375919; x=1793980719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdGs2n+FjnN9kQRvhMCKfS4IaxNbiNIQ2+gny9XTHQg=;
        b=hk8S6YXJ0TIupL5FdNIfktZuUF8W+6hoJugAgX4OHTAK8RpH6sH0bTnfCmf6+UzFZp
         9k9olA+rXfRcyM1G9NavJO/RWH5XaayUEoQJuqoDuIQvsU82A3QB54ZM/n6il51rdd5+
         6hiL7Wb0uY+saBDcZvvTgErQy2z6oaNyz36cXaPC3KD9LqATQrKpCPBSmuP3/yIJqz4K
         O1ljAMJ1sPNvtNo2q5dbs5B1GbaBggCUX0YUt0H97fB6cJhoqFwuQ+CgtEdfdpV5e+4B
         m8wQsaNw9R9kSBVje2K1hSGJqobAxKEX0+nGDMtRpKAAMjPFnTNjn7/Mp1RRZAeBY/C0
         rSJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzhal9aNiFSO+WlYPCzLqCgLaUEvvxVPkHwChPK8z/vkxdjIDpYwJauVyqWdeNnkFqV75vqTWyUXm+@vger.kernel.org
X-Gm-Message-State: AFq9FYLDf0MuuFXpC6EujYnqX++q1MAPTCsXWhR0AZO+Povk5qV0uwGi
	Ebf/P/MHU1ygVPC1qBUa21lHrrwPwoBgKUkznEwInNl7VQL0Qx8cCWZji8Dz5b6YgU2t4FoZK0+
	D7db6is6itw==
X-Gm-Gg: AYBFou1tsH9kfnjEm+t+znqVemMWj62dXVJOz+NPY+SWSj6W6N0ybNRQsF5GTPCLZxY
	3H+kbaBuylC7xLl6MwSMKBWjVOuvNxv4LTcq1pSMJN7REJxBe+XwHb7XJnWEOTvNfGU6ZWMtRzx
	DjEkHtkVPVxZZ9grxaQAF5pMmUQn3aErxlbYg5o2XPEmfhqEquAGkXB+2qQ6FUK4hPZUbuui9Kd
	q2HBmM8ZpuYZgXJUOH7jFaGXDlsxqoNu6AYLfs4+uaJQGYgzk5zINPPKBdw6ZrLeFdjQjvv/5kf
	vOXTW97CKzmqEGip7SrRB+UjYt8y+g4plkUREV74/kMfRSCgm4bsVtti8DR/lcPUs1OIhpiJIcq
	a79qDZ2qBittoI40he8Afnjn6xSxA028i584YYgSSWSORYihP4c3sqOyTqAjsg22budKlKnwSXO
	/YMD5Agau2fMk2Hc3PwZxjV3edBM74rNaH2JhgWaM8bifhDohyNOKgJMaXfdqPdulfTE/x3ajug
	TcGv/U1I9UkIFp6qZ51BEggJ/UyeL76JX+I2TgKFCE0fP82TMvrRjpFe/iNp3C/0qM9+w17FEjZ
	bGAFd8adYk8cBChwmM/sKCTKRbBrgO1NTWES4eubQjYiM0G7+XM=
X-Received: by 2002:a05:6000:250a:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e6e2fcd88mr6043986f8f.23.1793375919216;
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm3862691f8f.29.2026.10.30.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:35 +0100
Subject: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f74ef0952ba9..355ad26cb215 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,41 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param,
+					       u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -232,7 +260,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +421,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0

