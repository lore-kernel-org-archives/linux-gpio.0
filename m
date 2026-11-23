Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447302;
	b=FvSESPFnZT4wJmEWi1w5WBPPep540VEwbvHO4Q0RuTrujbSprQejwYXlkY9pnVTcqoqa
	 ttuF6gjpYuGrlu1iCJFp5H4VN+wZr/gJQNVq3eIakT11JXnpwfrFuoRaEkKqLEUijSwQz
	 dDxdS84C3PfD307yTOutMQTleJfqRpErST/iwQOYdXmo3SVhsBkEUEKdEdRSgdvZZxiFJ
	 AipqatV47hidpbqUNtsXAlSSDy8EijqNhlcY62F4ufkSGmbLKVDVmDHcos1dn9+hwoTGw
	 7ofnR6e+PffVhLxKjKTlyWF7y0n6uN4raCpDfC1h45h4PAssD0n2zT66zJgDqZckLjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
	b=jIF1cS07AN/vXaG8vz63ogTLNN/rf9fH3wp3HgLah9HcdWoUQ8d+Of8kvzoVGgf1VmL6
	 MB94rMFTQnst7xjNGjVJY/Z3/RhLaPAmSftfB9X6D/GjYXfOYqzl4EarnLHRtKKCNDUuP
	 gEhPZweKViU75NHDa+0JltrBzXgJasPPXXYyVk+3jDaIB/pakIPsIUNO+JEAYnxTrvpwe
	 AKYzjST9RIQ+1DFTpYFbmezGX8EITt+/2pFVgIgSm1L3HDqtb1Frd+zBEtMTBhpPeHuhc
	 pe6yisAo+p+zA546/VXKF2PQdXNA499chXIMqyNRCIz1NYn+To7spHmpj8aPWKdtOAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fM2K8COJ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9297606A693
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9297606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fM2K8COJ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso42050245e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447298; x=1796052098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=fM2K8COJrhrSTLYmm5PH5oE747bBUhT6wEfrGZC0UsIuA8zrm3Qyf3yuPowhjkyLh2
         9Ce2xQivNEDPt5oQa37fnFZPFLVPOrs7+ba+ltWUC7SsC4hOlUB/UT56Bbe3ne87HCV3
         2MulpLiOU3CEgEHOb6vJ/GwFKCgQAcn0bAxbcqKnINpZvD2gVcT9CWUIeSFBJSDVfMNs
         RrSElVBPOjGzfTD+bqfgpryGq6iGhO7VYmDpuMkVu0RGnPBnfxvYRoQigOyM9+lCt2f+
         /6PuZxc5tGD/IMmTHi8nRuP9tYY6wAf4qQjVjGf0uaiMAu4yQHuO9hFq321lY45b32h9
         yXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447298; x=1796052098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=aYKG6FfCxed/7Gr93xo2f5dHnafg4RjqoFUccSZ18UhgWSoQfeUSJHP1kpFAfTq+yh
         DHT3sCPDvPF+bHL0/XmUE6yBtwyssdNVZRetHLHKDmWfRWKPvS+m6I5fs/jqWxKII5iR
         ejLrv5YnKVX8IGZ3lFEJT30Pe7TAlI1HhQmX423QfmrX3fOJRWhxNYJ1H6ZzK6APkUYi
         MSYnwwiAP6KYb6Hskwr8NzbTD3TWGsi8bi3lbzSomBCschSwmpa66oZ35UcT7pJeMq29
         6wyXR1nzvP2BMCu1WyxHP4bZNFjnfbOyJtAirmAq95BCWU5YiTv1zRH4flHdNKQo0cfU
         h0EQ==
X-Forwarded-Encrypted: i=1; AL+hErHOCcOIOI1ifaGPD0sfo2OIq/gerU5o92gBj3fVmZuG+outbcaEfNx/lsCx4uq1desuGrOoh+w3QEEW@vger.kernel.org
X-Gm-Message-State: APuU4Z8dE2LELkMvo6Nd2mdPRC9CaVLtw+itEv3Vpb3ZC29NK16yVHp7
	mMz9pP4wwBQKL4vr+Cla0fMUdokrY1z45bhk0MaiBfHLFDl8YiVu0IdZso/2bnWGKqA=
X-Gm-Gg: AZFdTZcZkpOlRZJLtau7KLrq9idVfXCSR6GeNUbR8hxBKiJXoUYBcRb5il+25gq7dVN
	XmX+ovwhinHIN+drIO/0mXdX6j65jGuBQ8N6S+WideFDd/f+XT8Gy/4178QRpvj+Lny60fRm/85
	Gyk50ba9wsVDWqpedrUygjEEoMKeD43IncnU7VkirFXr/ADly393o6mTYeUdbJBAveKp6W7BIkw
	HsWtkB/vZuqkte+gB7YLj9yAYYgqn134+dTgYyKvSquL4iLzC2mLlvy5wUad/bVeuehRbbdV0HP
	GUCbMwPPgbU9LB5g+N/P4qv3bKOStTK3X+Tr1h6mguqSiULXzgBe9OWb7myXlWacEn71RKt7I73
	5q71vTk1L8fKXmvUT7xteZBYlJF1HuEBzulzZ1A+P5gKvcdKlwe16rdNOoXVkFCMcS+mtYsEpcA
	HVKYuaiKQHR17wkh7OnSmX4+/80S98lu/ShxXwsEDYhblVA/jNeMAkn4MrssS9SDTNYNc4IA2LJ
	HfhFqp+3V2709a3P8/7hv4t2ti2lSqit2xNRY7sk9auYUhFB2XkVRH5t7ytQ4UxZ5Fz/D+7HTlr
	GEH2wMHdGX5P1Yl63uaUI6KOTHw0ULLgng5tTCbNaRpEvu2rjVQ=
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr249201805e9.35.1795447298146;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm513780865e9.11.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:30 +0100
Subject: [PATCH v3 08/10] pinctrl: scmi: report whether a function is GPIO
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-8-d61f039be008@baylibre.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 3965f920851b..ed563514898a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -81,6 +81,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1

