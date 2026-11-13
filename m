Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567972;
	b=eM/GSHJvd92hOTTJUlTSDJLIFlxj9TcSq5xxKwIIPq5frjt+XIAvK+IamFxwrP6ujRtZ
	 sHmoFW0QNSkAATkHf2XSLOnaUv8p8Bd1eMpyHInsTddbVxlDALmvupeIpN8jMPvnbQsu4
	 lcQoFXLdIXAjtL6K75jZyZ7T5cbyDlqeesjqj3DSdqoP71AoxVVEzRs37aDIUJaKG0KFk
	 2ZUDhuD0nnTp9dc0U9OqSqpadKAwLJmyIoCUx9ei7b86YvHKdWt7VUaLuyY4deACP/TW9
	 x6bZ3dGxE41QNFih1Bonf7zFN9IKuEtq95ttP/AVwbj58q2O4aM5bcwFHxgsWYzKpbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
	b=PIl5Ha7KxE8pzAAzNUASo+sqz7vAM7F4z5j+f6qGzpgXSq6/KV8yDpeMTUOqL/mbZSxM
	 fXP1hhIpHYtLl6iKSOxR8y851wNMraTVyRVUSIm/x/M7mOQRtseczuycssqI7SoM0o7oP
	 3w09Ds2vJaRf9CDUPP3TdPdqiRUDzAF12Q5lTN8KLxorOjbkOmVGG3HayRiIFCge5JRet
	 iYWmKk/BAmaWYZf31z552uDNjdWRciOYcizX47XeAD0UkFw3+HQHTqetDSYmwP2mlEEYG
	 6pY2ImuamEd9e8aIuA0FKwlPrnUq98kX8VkDq8TEK1Q6eLFCjRD8D/zCqKvaEShnnyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LHClu9Y2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C483606A883
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C483606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LHClu9Y2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so382123f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567971; x=1795172771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=LHClu9Y2/nHrB30IHALaxE4iScltAFJ4M62ZvLmvcYVaSJy+ecjyPCZOKuHSBG1SXS
         4PJxS9f0oJX9PeW34ToT0rmpuRhhWj6vssLNwFQObLesRncJdMaEijDADIRbq5ocwv0y
         CNlQB5jD+Uc4nimIgHNB4HFhDPC2e3VGYlEY9av1KZhYm5hJj791cyjem+by+7KyhUvv
         m6trU7xoUpHZd/dReY4CcgSLsAZA9AlFWduFG38mYN/Yh3OvGFl6O7aEFdR+bw/CyOhM
         lOoTMJ/+CcGzxT10oOhwRMhlAxa4SvgSlg7CZt/qIGVhNf7ytGf1fBSk6anZVcPea9mB
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567971; x=1795172771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=q4EoDIjh6iqkLscjscMBUJL9PVsJWxT31NURAknTf7Hu2f7b75I1AufvpoWczQkcL2
         w70rRtWDl813+BQXBEt/eXmixygmuF+OOMmf9//7/rvURzGbFLEmDNXfS/APP4EZJM0r
         0MVzoZNBwDfsdjcRI9typLkQTQJS+pZCncL2G4wPAkSHNElffnMuAA9y/4/R3tARxu1S
         YMEC2Fy+bPxdE4+jnkBcFpCkSGppDR96zmGiF6mCiyiBPTt8Z6dggESWQrhTsTzV4VST
         YjtAXjA5hcI6NdVfVAkzW9yydSUt++ZnC46HVUFyVBh+e/RxzGr1R6CEYzBQML1/gW4b
         C+AA==
X-Forwarded-Encrypted: i=1; AL+hErH0Ag23qO21ydl8itTLP5knUo3ZH9RDVNJxVjoOXaH6yK6AuruhipBjCF4NyN9cGROj/xA4bSsQY5/A@vger.kernel.org
X-Gm-Message-State: APuU4Z96eoOBX5FfeuAlPuIOCqhz1AE9c1TlF10q4hDeEDJGiNIRos99
	80Flbq18keBcQMlhfQW0pQLqASbTL7J+LU4deahWPBs+zUJD0QlH2/21c3tih5XLfAc=
X-Gm-Gg: AYBFou2PRmkZk1ekVPAUx9cIXFP/4aYgoPgtI9tTPt1ndDixrWZdmT8tqLcq29d/kpK
	FtZSOk4yKAncnzj2w4otnS/2cXfvbohGCot2U/CGreuHNKT5Xm/w+YvX6GJjqyxnE2NQ+8q3PdK
	h2DKv6g+8/3ovBMFN8ZxEo9HSRCqWtOY/BeN3TfqU8/VhO3CKJ/6xAR7NZSGyo3wKGkWyq8uwYm
	EseIA+fbWaOs2dtYsibdOYkc5swIrDmnqLfmUC/K9s/494B+gvtek43BVP1ikY/4hWTew1WR7m1
	uFvOiuRvwQZEQUdu1L7etF9MsStY1xMCkpQ1mQReNjbcBKNfXHztRiqRT1mCLxhIZt0fsDJVbKy
	TuVO/udubu7EfD8eJJDX1elOSyU+6R8W2/AFGbnCZ13jnN+JpKPi668rARklhzsuMXKAcbtmdSL
	Qld5ozhMIOL7wOEIsjQ2Ru0GsuXyTMfpXf6dulP0Ua3/WH789lgb6vcllYKjtIRMrXUY8wPTRuM
	oJNAfiPfTzNp6gZXJ3qAms7M/IqhLFKY4c1nK42tLoIV5v8OF+Y8fN3lQ7p92ONWICQ6i9DNlTE
	QuLUGr1H43yanjwiqy9joaFkfLo2Btpt47aVLPHE+duYSSU/LxM=
X-Received: by 2002:a05:6000:3c5:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-49c6fc9e60emr4495337f8f.6.1794567970746;
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm3987770f8f.19.2026.11.13.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:35 +0100
Subject: [PATCH v2 09/11] pinctrl: scmi: report whether a function is GPIO
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-9-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43b9d67eb9e5..6d51025013ec 100644
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
2.56.1

