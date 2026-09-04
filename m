Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3C3D9023
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510251; cv=none; b=DluLQV0/HIIaaPS3ZbDK7Dqg/h3iCxUuCvmKEyEmS2xSQxd1r42GBRmOU/G7FYs0nddbqeS9fOb7rdo+tzxGUvpXeqQ683vx4O1urHs7jCFwauJP4A/kG23KgM/g0T7sfxkyHtsp7dLMXSG0UbCJ51AjKOoxzlyv2XgbilkEbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510251; c=relaxed/simple;
	bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EB1+BvZpKPqclajPENE1ufltbajeY0yvU73S4hSS/6V/AqNGJXsqnulDPCYradONJTbOaKrU850Scd/FVEARlKyBI9fLAMXFuCnYS63hw2MwuNldcSHsg3vU9SleDvQQY3SMcuqFFfnI8FNeEN22TZ2NrVDCpt1r5p7Z3i33nuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RZT2XFGa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RZT2XFGa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso5614945e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510246; x=1789115046; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=RZT2XFGabeGVMYnYuvbApCELKeWCwlHJ7lJ6KrQziN9fgyhdIvkR2XBo8FB+9O/j9K
         txor+j0jFmjyAs51yleBFwGr3x1C53w2WPWPpZUK5tphVzsn6ty8xAz54bkohQgLzxgr
         gzQzpiVnhNF6Ckntq5i2mdVGVxuUPUHg7iO+CCstjqAO6U+xeoJwsrov1RlpSVDc4JId
         cYDPl+BppRR12QBd6HVdiAPWBVguDj+/7xRZZ+UawR9CudjeTm1NCxPj0jAVjDNvPcM1
         1pcg0JE+xooZ1PI1wjH/8cbUB/XMO/yyqsnllSQvJhvwEjMOHlLldTLUw4D0vofurr6N
         aQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510246; x=1789115046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=Ok/3xzY9T2GQ6QTUxnTnaOdj+tWUrdvYEWq8MD9vo7gM3YZfwMJPLNXdWRd3cYWcBC
         NNm+0VoEOe7dAEbBTMSzvDHvBUwanC+FkXJVVR4GVvD/gAEtoAyeTscyTcnE3zLKuBng
         thsV8ctrxQ7wSdBRIQ8lo4y8bq9GvrFS2Tztde0vYduSwLJZEjLBqOoMo90UOPArm1Y1
         SX0gZr1xSyr8e8XjeFJyicmbad2hT4zoRXOOnPdBVSAENlm1RC8N2D3rL6PyP/R9tcLu
         /d1b1pyTmyVtkbLHSCZcBwicOFgOBj9TVfGKokgBH7+bWeeQ8hX/dliO8ppNhPqM7Yvg
         IGDA==
X-Forwarded-Encrypted: i=1; AKwUvBxhpGHMbgqeJ662+QtuNZLxNEP3Q0AqelEOgoyAJPlhVBxqRuyKeGDVGvCSBkUwxj5QZImPKqpf8MTa@vger.kernel.org
X-Gm-Message-State: AFuF++nL2GXsvL9vyTUbGrs7ByChaTssfKNxsvQ+Lz0Rsfvz0TJRUiu/
	6tUwi7goY1fXsjGJnT0miNgcIUb5bgdSj3z26I0R1dcWeZo913uvuqmUE71ZiCPm+fg=
X-Gm-Gg: AYBFou21aRrmRDKoYKk5ZmJK0/kyFInxrmZX2DeVH2Cgj49OaBeKGxUyMsvtQnkkbTH
	x43qSWQq1oA9wExSCnVfz716len6JeSWslBys2SRgRZg4RikQgPe+A4pAsJgwT0pJar5buHmgqI
	GHmtCUXLKOr/HSjhw1mbcuIzxrS+VBYokZ4KLlrlfnCg4KSvv4wKU7TPcpXDzKu1/kYIjh7YCfI
	BC5H3bh1bZnUjCgsyFQaPV0jAl96GmEA/78PjGccqNc4uME5M3mcYljplGA4SZndtRDtRW8jXST
	NzaHL+wlfUn8flShQg1eRegPkdu3WTXSIyqg5CIEqV4cNx5ZWAYru9UInkWPChHLJRPfTxHakQF
	ZnyUxfYeWUq4jAIwo3XRZ7LW63l/sGN00MGeZ23WK+WqfD6e0sZjFhgnIibQYHctH5QQhwoNhEz
	VI3/Kf/4qqXM9jPSzLCLj9eDJKN0augtOxKGYMhm+dB3gg2b+AWelQAW3abC63B8pWK3s0AlDjf
	TYNauhB59Gl76Y68Q==
X-Received: by 2002:a05:600c:a44:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49cf821e7a5mr40764145e9.8.1788510246002;
        Fri, 04 Sep 2026 01:24:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm4632933f8f.35.2026.09.04.01.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:24:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Matti Vaittinen <matti.vaittinen@linux.dev>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen
 <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Michael Walle <mwalle@kernel.org>,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 08/10] clk: bd718x7: Support ROHM BD73800
In-Reply-To: <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
Date: Fri, 04 Sep 2026 10:24:03 +0200
Message-ID: <1jik4ll90c.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 02 sept. 2026 at 14:05, Matti Vaittinen <matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD73800 PMIC has a 32.768 kHz clock gate. Add support for
> controlling this clock.
>
> NOTE: The CLKOUT pin can be muxed by an OTP option. On some OTP
> configurations the CLKOUT is not outputting the clk signal.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
