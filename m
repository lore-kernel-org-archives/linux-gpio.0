Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375925;
	b=kcWzpmXchs2jci+az2CduxwJH0zPEj0cSdZRBzmSUmDkp2S+yQEbvXs3Ws0mCb7jXBOf
	 9KUoIBlCIQiP5zOHEuYl4KTFm/WO9IjGUNnFVL3P4UHJqawvsB32vARSQ6Q9UojHPbFnT
	 ytsLmPDvm6e48htj5PDFqNLv5gLm4rVBXazzrT8Pi+TkQ3D+1uzuH+2Hr1n6x0c9NZda0
	 HRwRoLCGSRgL3r15IQsI6O4dHwMCUWy20X48M6uSRp/Dsrc5cMIbXhfxtyJOnhuQIddYJ
	 WWlgFOpOH6ABZGE4gGpL3U18MkWOGpUEVfUzdTNC+Q1eZS5iFyw9wQzQIOu0iN6lHSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
	b=UVmVSWDmOY60fepZJWMIqJF9bpuQCikmg/RORBk0T5onEqc3zAiSBxsW3uajYLjZnMyD
	 6/kOmebVurW65cgdX3ZstiTx069rpHiQaZhGGkFRN2fr7moAdnynVI7KO0zUef2ydMgyy
	 FWzCDqQEmFNuCzNSWBGw68Lrwuon1xq6Hhh7Zgd8oNbM+OfTDPXo54GRZLeMprRYibfbA
	 NVYR3ad4cmcDvwf5zxwaRpswtrVajWZ3iQRm2t6I+UiCtt0oPG9l4gCSEJzrq2eQ/gIxY
	 fCY3WICuJAdJ4iGotV5GjcZe5Sc0AGAhul3A5wRwf5o2W4McDxKP/Mphy3ljetwpGmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mOqzz12U;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4230606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4230606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mOqzz12U
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so7610355e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375923; x=1793980723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=mOqzz12U/LFejC9+hW3SXq2Xej3agCQm8atGTBh16WSKclb7U72U8hodJfoBqBGdFo
         9t+prirfP8gXE7eqlpgNzjZ1lAbH7EKzgyO8BcV8m6x4gi7fd+FN6qBdE6iQvi+wbmZj
         G+/UZIjskHILp08+se9pzO3urcTa+IRRYsiYAy9s0KFimuC7X2VvqkAbjqy00Yx8lcPH
         Icwdd9Ih152ah6l1NoDDx/zPl4JuFjwWfnHOjDtcUUZtVY2LahVxN97BdW+4TxzSOgsJ
         moHb08oLZSPklqUdIWrpBKz/fak6/y1M6Y+0AQXd0baWCglAweH9y45zOzfXlppg7I/O
         ullg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375923; x=1793980723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=G9g8qIJbkiSDfhwen2T78jBg8f2RpQi9vqaLcvYqKkeFqGLMQ/Vh2vIpIO+XtUyO9D
         /T+w9LRU2R0iZTxY+FjrPxLyP8Edx8fnQxiim7p81c4vrLyIbq5kYtK0o1V6OIdjfFbE
         BLkg093L38uAW3988VVe41KBnvlV+gBwW56EskJ0rY5+v5EUGdnFTf7prlPbSc5PzobX
         P+Ltltk1B+hFokXXs4xVLmsQXzTrKff49CAWemrjQaGqTbAHXGLvMT0V5aqGW56qT4lr
         SNt+6qTWOA+G4yRGbMPJ24PuFzZ/pZD5SHLn+FypJ8ZPfIlpsi9fVakVCXAac+jbfCQc
         jXqA==
X-Forwarded-Encrypted: i=1; AKwUvBzUd6FcfVd3pIT+9aLoGqawqavMd1YatokcB658e6uXMK6+TlZwUS9ByDKlQ0DT45p/L0f+P29aql2D@vger.kernel.org
X-Gm-Message-State: AFq9FYJxUGUEq6o83i2VFCZ4Q0C13t3CIYjGv4EzKkWdLEqVs13DPgo7
	X9QbszLJVZhvSMWQZrhCbIqs0w5qRKkr6BSHul79JAvygNmu6R0KKtGDr7156zNrLGi+d4PpN5P
	9BIwAquMvbQ==
X-Gm-Gg: AYBFou0kT5CJPPSVYnNQ2zyzQYj7AcERhRNhhrsUcz9h445IVbmFNbQZvZmqrZcvKur
	MQ9cQgmOVNzD/jZMJ9Lt0opEPlON9RxiS4D1oETLVGfV206XLjPkbNXJWqGFW2MWHcZvfZQrDpH
	vUzJHc43i7qZ29Rwq3jHn+B2Mhq4taswdATyqP6MASQvlVH63mnpj6PVkNpc0D5VNY4/JVCHXqy
	RTPMlM0f1zAOLorrHykETlXZz9xb6UMO7wbo23kegsfBeOzKZi4yRgx6LmY7g3AStTtLxtw2jxr
	8rQYRzyfzKnxrblKln9u15xf6Ju8r5dIRbDY4w/EmAe5TGHVZhStVp6S63oabBjSeibVdLjaKPe
	rFaI054EWalCc/ExpreLKOaCDtPuCjy+RJNu4ymW9DRR9JzwBCRyqaKjcy7FLza4RK5tZyBPTYB
	JizXALqm/gKo1KlIplUKutz4oy0cxSNc6vSKFgd+7hmrcjVPdWFAjzFZAyWnvu44fMVXbG9+8iu
	E26nlQ0b8uqlwkE1n3ykrozthWnI6MhdSUrj9mDLNBNDz0VONxOyrPlLEYlAheo+Gl6+RHU9U/C
	R+D8iqjN8aQOBDrtTks8CyNCw496bs9f0Mhki+Chtkyp2XLHFAg=
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr63299065e9.31.1793375923405;
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm71893855e9.1.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:40 +0100
Subject: [PATCH 09/11] pinctrl: scmi: report whether a function is GPIO
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
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

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 24e02de543ca..6f44e8c0fee6 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.0

