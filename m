Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757401;
	b=AcLxAq8ZulG15D/Jlz4d8SsaXpBH22hwOR/P7wi+UoTsYH6K/yEo+e6I8U5Iwgl2wzsi
	 q/gIiUabtdMV8bzSAsgFIsv5/Oze2mWme2Q2Vs14ad5tOditE8WlL2nuNLYqeE0bt/1uc
	 oJtSNON9n6eVR+2Xpj2PwdbAiBwoHWeDikDahDNoaJQcmg+8JCNmAnHrLZcAQwAkbH3Oe
	 ejAxC0xXoarQjFsIBFVMqGjxWeFbl3hqpIOe4whHBk5tJoqb1AYIav9kXzhyjQAmbKsw2
	 cgsA6ajj6ujS6DMbxqpuzgxPJFetm3LtL5QQ5wmSsTtb7ca//LQyZBy4diGT/Cvm+jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
	b=I4+ZxF27c2yQ2uz1ihcDuEGvEtRyPZiFoaoRcZaMEj6GkEfwA4spemzt8xzslTM53myJ
	 5NwjkOtXGxgoIsA5Ykxw6j5uYNjzLlrMNySOkp4sEh3S2FUXKQDZB5Jwfma6a/3M39A39
	 whlgZiFxj34/Kalu1ubZKTrzZNzh8xyNAtLPhU7Nw1iIehk1LG/Evf+cbe9KRbQHPaRfu
	 1LtHlDZJ4VFRrudVxfGXVISv5fYZ+DY3BlXt/P38r4BIFgV6nT8smQRecHhsZdvYU+DqD
	 +tAWGzhrkuwFzgNzk9R8+4h6lHHhIb5naW3K42/aS8Jn2aG8ZAw1GDdEjU78uvj9beQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4AC606A887
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 15:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4AC606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HBYr2ghe
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5019295e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=HBYr2gheQUl7c26Y3yfqksOaTOYrIFYUyEUzlZUZhWSZy+HAESqRcXZrP+TZZhM8z9
         75y4g55klpFlA/Qulr9Yg7kYDWq1+w93Piu62izk5f8edZNdPTqmw53yQIcVZJ8POpjR
         FCFDGpFCG+XXUQSOtyP6WZHieYuBpqKKanKZ3wnDH3I4OGAaLXxf7XH2XvGb65akJdzr
         QUEsYnB0UF1WTP5FCzRnWQED5TK5P0HAm0HJ7Hpeq/wgtIM84HN+PLhoAeYrZah9RjSs
         zqZK2w+ADZMGUpKyIfEL5w7Zfqyz1Z40uP2rSoJOgyF58OsUuKjbbaFJV/9eOLQrvgqB
         Q1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=L4YZyvjy50mjvWV1/1hTFtbldjCgv28pOD03IMt8h6sp9vBUG3vzhKU/RRPJSX1i3m
         sHtKLUIMpjcmU9oQHiYKG1PJKcz4qlv26/tdrs8pBMI/QM/nBgk/Up4M3Ob9Dx3u+omg
         ybcAQoi0OuI0/jROApKRjNu+VpsZXi7hcD/7OA9x5x+wdoqa63KYg8Qx8GAie+CJP2XM
         0m384f/nNU4Krl5K1xftya2cTeAKT1jYbEXRHd2hIQkyCrT4l27mw+dXp/QKQowZwXU2
         PIORExW+F2tEUxU6wW9DGN4FIdlpBTxHGSKqRm1jE0G98P2o4ktEFtLl06gkYt6rtFwA
         197Q==
X-Forwarded-Encrypted: i=1; AL+hErEPuWEQ4j0abr08n2sGZcUvFe/iijAV6QYYf+ZK2YUDosekgN7Xhluug979v9dMwcPbL4uAFvOJRVNn@vger.kernel.org
X-Gm-Message-State: APuU4Z+h5rL2pMa5MubCiH/WfdG/Y/9CVvcNoFYZcbveqRTLDpYFW0dM
	D6VofKscGbnNSzsJc+M95Q/fNUWHQYj2y4zGF6R3jWO64t5gwGR4NlfklSO1MAM9Jwo=
X-Gm-Gg: AYBFou14k+Tri09QtXoTEJ8GRtC2nfbCHz78cVKtK/dE8xRI+7IL8WNXLS/+I+YWZIW
	R5R/ELFTU4pWqJEj5V9shnR+tgXW4x8Nd8NBwlD45wpArteDVJb+GNweApUs8X83b6A2XMWSsX4
	ZoQFHgoauqbjsKIPg3nM6d0tp2f4FqykL0xGFk5PNbJlqGHgl4N3vm6bbv+EkSfoqZfiYLpFoC+
	2OceiFdiu/Yogcn7wAP+BMCRBBhb921W6Z6mQAskH23VtuwOyqr64tDQmLXVsccsq8g/TGvbPzB
	M0KewmcZ8rm/gqLIwt18HmaE28NSxdwfGl0PYiLPd7/yjYzyEj9w+zq0FPlepGozgGsF9TvKN2q
	FrTHf8K8sJOf5kJMni5rbc8ckl33reGd0VeuyIFP5czJZIn/lPm9w7P9ipDd+mvXjDTQY4iQS5V
	DSuwADdORiFY1MrMxMPAgYO5xCtGjH6SBOgor3MEqAwl2XMf7PzI54JVafgJwJm8fl6K6bXyDY6
	0KxNPttlS4Xh+UUXH5jVDaqCDPBCUquuIngNodA8iN2hdyIwDIXW5bXqhngTGCgrc0lx4YYr2U+
	ESCPk3XKnt+7r14TLd8SxTlfBUyj5p3rgRnmDuvCdB31lK3oGEqETh0a
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--
