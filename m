Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447297;
	b=qVEHHkrDy82iLvGPFjdPHP9mMQaX0fu66iGknQsCNvJrMBwmcJ0w50QS4x3zaERvUj4r
	 sksjnLMSEDkLj2P9ZdLdLDBFaTZ+o0SwYJxqeq1p0t34DVzJiQ/d4lKrrVZpk93V2zFvL
	 uQOpTzAA6Zz8UgDymziGgmH2mg9A9mUVI+50hF89etvj75mdzG8bK+aK8bewsKYE0Kfq3
	 KqF22ijxdyf1OjQ2GISXkUE61sJfDZuVs15wTtKLbffJxOBzMSPOyi4bPnTKHz0aKHvBq
	 bjq+TsDktMVQyzngFlwpFEP7GxtJ5rKRGonxmPuavhe7preCrLk9hVvy68ZYrBCN4bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
	b=lsH753Pe9C29Uah15vEmPQ4cuzTimLu+RKzvpzIf57km+UhqhJEnSIaPQlgVtHpSd+3g
	 9m2trLWfN0SV3oddZBu+3u7WcZl6BC6Uo3EXSIiR27lWLXVTOildxwFQjJ2qsGDKoNi2i
	 3Q1LD+7hi3VJnzXSYgtmbJiyXuIGPiJPR55MIvKaLyEPqn8tmVAAdVFkjLZ3fGt8IL3vk
	 aZy/PUijQZ8OK2k/gLfPXweY9ci8RviamVXvwtqlrupb68AWvMSXGiXyQhScEst/6xtFN
	 yktm4lTDBnB2biQikxNkDNOvFZQHGjuDjz7FtLOqaJ9L7ZQJXUfLM1aTr17180GBg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzjlnWQg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4CC606A6B8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4CC606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TzjlnWQg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33472905e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447295; x=1796052095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
        b=TzjlnWQg/9m4i46gpOgroSxKPT3OPfsYuFv2HIWxH//jRQgC1d+4f3sVv6eRk1yCJi
         oK8tKqe9nt9Z/wCbJ/OAszCXrmudQ7XEHujtCiY0PwxbrMzB/TO28QWzjFN74iLVUZqp
         wOBZcVC8VR4G2dm9zrNfl6Lre74ublHG/IBbfCSt36l6B6FTQbndFhb0TI1sUWgu8PmC
         pn197lgwk+NWzYF6XfLfCBqn0Pj9U09qsCRtH1J0PN4XfojKBYkXO7+S7Wl2jgsu+Gzz
         Y2NzUJbvdlaE2Jvz0EiuJm3WMIIlYv6hx4BDIiFEnXFLFRakt6r/QczBG+5eLnmq+UHT
         sTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447295; x=1796052095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
        b=xj3Ny3sxabBukFmneRXITTYny40jYS3ekD7Vx7IxFwSV3wkhNjEcK6roCiBPHk6Kb9
         CtxFSLceItO2/wN0saW/iGxnvcwyn8qmbF4V6wwp/8FO7fEb+85ysSHO4ZZJ4sDrFFtg
         wdZfoLzZ+HAzxAsdoLXxmwnk0QztlqNKkpOKpjMo6XWyibTzzrceW4UukCcmXqPz6k0u
         vKZVpyV/W6O61TG2BUlXoprZC/OUKkyUb21vR9RlBWk+S5cZT5jwZhBu8jMWJ9dY1NVk
         bbwjSytuOCopUYKsRV9ZNko6m9i3rd07nkicN6vim8cQnYf97JWy4ZjLq7ATU638F418
         it/g==
X-Forwarded-Encrypted: i=1; AL+hErExSyW3XQ2ddq2jXX6I3cfHT9j7DtHUEziPjBBB7JuTa7SwG6NAP/VY1lXKSvIiHnUi/veztuxqMb/J@vger.kernel.org
X-Gm-Message-State: APuU4Z9tLT9Fxs9K2uQ31inHbfokU49tOfSg3hDY58pBZN+kZv2IZim5
	slH06sVW2Ye7x7iwdLuTGYLoSlSP058VoyVkNMtMVEj3TLN7ycxFV6Z1vtE/jgLECJg=
X-Gm-Gg: AZFdTZcj7Z8RH7dppAy/fHCr8v/PO9rYYmy3E7B4y9vqXy+EIhyyTCWQTx6tEn6Kw9y
	CZObdunoLo/UUZJmpPyiPCpd3ZOu3Xrvt9pNpBDS6HvOsuVKpsRfCEEomTMbHiyu18F/rCEpkM9
	wKEtlIw44RjqVHL0YmuzDH6+2/pU3M+T0ueTVao6knP8ylr81FBYvs/r9mdIsqC1hZe59zxBNCq
	0xjCEj19BoHBjq9nHe7yWpIehsH7EzyesfLI9p6+Ch+22lwfeTr3bbCeUpDow34rAJspck4j8h/
	3lfQMgYTaV713ZkQERZ08sP5PXF/kr+nvYzS9AxopoPhTdOYPQczUmaw2yGBQJWLQtdCtS/mp21
	FyFI0dStLY9f+H35JWc4dwsruv47ONtsRsqXyN9FV/UlsEUh9A51q55xpS4MQNffY2ajqvtsRyW
	sRqHu4y2R5tOAiBQG6wtfYsTEgpS7m49xQwWogIP+4jnO2BjKFC4Ax7ynQIrbo+M7DwTtwgpFja
	FfV/vdwfMnxRaVvZZD8dqd/UP8+zGiYVWdFrhxAtFEM30QXepJlFZNuWr3MYCOp5nW626e36zD0
	sgMJIAb2PXb6y48g4JMTrp7/cDzWnm3jkulAa8EkBTiMGQ/ysuo=
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr260733355e9.19.1795447295376;
        Mon, 23 Nov 2026 07:21:35 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm22128006f8f.56.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:35 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:27 +0100
Subject: [PATCH v3 05/10] pinctrl: scmi: give no groups to pin-only
 functions
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>
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
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 23287c3add35..80c6e83a3a2a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -456,13 +457,19 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.1

