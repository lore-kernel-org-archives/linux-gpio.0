Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375924;
	b=H0HVhAnwy++TeealikyN4lQdJiNRXNHXQ9Bd0Ew+E3MT7cLsS+4FTHMOjiIQtw/mT+9W
	 VcEIatSPnhUWOvNuyyq+ijuecmaeJHOqZtSi16SBn5mMlvW7JB8ryo5cPCFmGGIjHWRv3
	 XaB5j02xtWSxVJprmDC9iplS2LZ8nY1uAoMd7hFtzUWRbYGhq+XK9X+e4cTlOpn9QPB/0
	 enCijjhNE95UwAqFEblT7q97kDLsH8RMV0kFGEGRbUF2KCzzUGPzXfOGu9c+hfu1z1MLq
	 XrNMnexfv+7Gw4l/NqmhrDkYoxV725+VoRRKBc5hfX3c0+QRCXu+cR4Df8IwEVP5CGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
	b=zBsIyQlrCxybwZ0SYoisuYXVxsEZFnHxcDefvon6jX+EXhRVxyGgY7HKDxnr48VqcGju
	 MXgZsuulWNkAd8/uL1JHEU4kPKEHIuZrHeG9Wp8NGf12cE6y/RiECeMPJ30ReD8EN1OTt
	 m7YMVjsnkVPXkIhx23d5xBU/uB9YB5IkW1l6H6syT6/haI+KSKAqz2427QCYdWAE5PRor
	 LaGwU67YmAMyXckf88imsHoLLCE7bpjTZB0cBaZ4cnd1rB/ZMJ/f/QwIKyiqqEirZ1qyt
	 3RU9ppWl4Avv79kj/ZcObIUrpDYm0aSSf/VT25QM8zd70gqtev46+l4+RlkHbApGfbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k6O1SYsD;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F63D606A33B
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F63D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=k6O1SYsD
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10383955e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375922; x=1793980722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=k6O1SYsDSVANxNNncBHsTL2zKt4/f8ljHmJ7SYl3TJrL3w3FUhVt5OsfZch+sG8vyz
         XKU0m9LGvta8AsVbxbCSGkGhBGYADZE3EsfvCoGIMqEuAopf9e4EB5fG5KuGMW6Wlkh+
         rS8D8ftTYLpVKV5iKTfQIYd0v9E2zjTBTfPHtk1T+p3QNUnzBZnt/DyKLFRpdJQ7h5jD
         sex6DHDEoLQOUpB4+gUo4MsUcdnH1sI2os8UJkidevVErmtKVvJTbVyuc1zDYBXLUyBD
         /z8EOA6UGtubC6HBeWh29Av1KRvL1xYqRvTxwbGj4/jPFuA6Q2b6qlhpRRiLIafJylol
         mQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375922; x=1793980722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9EgsHJBSN0ffaKVUHnt8yIvPrx8yzIST2CQLH5g6Wc=;
        b=G496Gn4iqodhjWGwLpywxPhO+PTU1IfkTFQq1zeDEpKvyll0OoDsQjZpLKX3Nxpnsx
         odb+NJ3xsBciji0GmF2Lx12WGj2+Lx8nTF5Q5xXUk+PBmQ4aafB3XOZsdI+CYBRD8wSf
         nRh5EikR0zH9SPx1Xa+OfhPmSbwjfjX5WO6EXgKBA6KSyV9HUSEFB/xA09BkKzfDvd64
         bcNerhgDdlgo+y+itccTQANj89xk7wwFnjGyPdgd8qobtmMfAT+VlcL/m47Q4uRTLMxa
         gkL0q9Ekco8SQ5RK9hTOnLdfhaUYmkAlOuF51Jvi1em0BtBo/xLYxngLlQOVYm26BR39
         4Omg==
X-Forwarded-Encrypted: i=1; AKwUvBw7K2gba75vdu1gqyzVQc+5NC46fCmVNsWd0yQU/jucem1NKpftSEqbtxdz31hUwLER2/CgPMqvypbO@vger.kernel.org
X-Gm-Message-State: AFq9FYL92heKWmBsIPffTg/7zGS3XbhL/E3LnZAUp9t9GFxBdYWddPDz
	bWX5ivdBS2//79eINEXbTspSt3ZharPUNL92lhj06AYpMbqhg2bR3MlqLRMdGRHwGmk=
X-Gm-Gg: AYBFou2Iz5j8uCbXaMdnYNxUbox1DdMiaWJTpIb1qaEdk1FrvAOaOmNBLdGvJTb2PoJ
	7q2t12sMfEyQfnTjUabqRq+YTIJP44ejtOnmKneA4Vv4ZzuuMlx8kUeUC7nMcDafTFAN/4Bw/26
	eTaYPo1P/DvAnbWLTESIluyFvp6LoCoQlP/aIAWuvcUWTE7aDEG9ZbH3ZD5KcZVB9crkaqkd7Ha
	h8B3R4Ea5svn2XKgPe2LJhB9xDJjxcJmEy2wGN9yAdgyT+OgHAxZMNfAD3oir16KcWTp2xxdIYo
	Hl2juhR7K7hvu7L1dudqQP5ufoQQANPZYfwVvLisyB00FZIfjJBobaid8Tb1Zu9DGf1WljhL6+o
	h8YVWV6cu5KGXw5q2du/rK76f5jAYJWm7XLJH8w5SlZIsL5IC9Nmvr3YP6+Rwnu8o3nZ4siof+z
	zhjMU7fuY4N2oWf9VsuoJ1bKalMoUOmVWnQIeMYt+X4Q8R+lnsC3NVXhZXRWCfBEl0tav0ZgJbs
	cdX2AA4ei5Wcw5zOxybB2XbchHZH9bBjwQD86J8gObI9aEt6xuKeVTBRR99aoRRdwXXGzR7VUiA
	UVe7pwaQUfMkexGmW52oLUdcjLObvio1VheD4ydVMuwX2uYhCCc=
X-Received: by 2002:a05:600c:8116:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ac182dc29cmr57138645e9.15.1793375922493;
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm50402805e9.0.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:39 +0100
Subject: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
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

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1a14e254f011..24e02de543ca 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -486,8 +487,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.0

