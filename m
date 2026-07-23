Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B33CBE6D
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788387; cv=none; b=kqVNAHCN8Mxwfbi3/u4Z+ZsB7RN+mhdtzkzshKyLVWhTOIqGcvhwhsrqy4KcZHckYwxl8R6ChjhVFvpWlaMcpQSvKj7k6f/TzLq7R2PVmSXFaABKmEyNRKd/YSjSAq96gDitQLR3PNa8hDUclCznKn14kAF7FKKdCgWD0khUcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788387; c=relaxed/simple;
	bh=sDQfXgRKI/MoYauIBPUhxS7ErHC3UJ7F2mE+sueO31E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfvYKbFVX7TDKO8U1RVU5MF8u9xw6p3btz/IQggP35dWERGPWckgD5jRdscL0ArVCaAHC+19pls4B5fARun9JueTfBbnNYzh5ZalghlfFWoXe1Vj15FlU0tws4n9l6p4fXlUx5fA7cBXFtCeHIlvViq4vK3KyVJCdxLDQ+pAFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f4OU0Hvo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f4OU0Hvo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590ba856so2101605e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788384; x=1785393184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=f4OU0Hvom8wddjN+ULWj9NrvyHQRUbHFPDvk/QVlVwr1b9E4N2E807/xjgpctqYv3s
         TIpzMV2nn1nphNkq0HUPSh2XFofxJM9Hq9y3cOJy584rcvF5Ivir+JZgrX02XVNFA9TI
         PRbYny5px5GXCx8Ky1Kcdac5jZ4w0JDbb++wUCmbqoKiNRwDVUP7cfjza5AHz94vCtAs
         z3LJ1P+ghbfgKwFNdtoUMDYe46kAb2wUOEdiYlJhDjjsgS5MBj/xNSBKMEVL8FpkBitW
         uJdwuwFW/YcvPlyCWSk4gLysrq4gmjrljIt2y0x/2EiKUJ9PfmV+9ZVR3Ub0ikbVJ+qC
         S7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788384; x=1785393184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=A+NZ/GlZE1RyifKc6/e94G16GhXEAiAZcHwQ3mTt/VFMiqR8+HtjPG31najcf0uOkW
         eXXMU06cehOL5nSw0uBySaAX2CSiYIXrB8i2pUBzczCN3GLJUxGUb3zn90uKxXN8UXS1
         w1PsfSpsTxdDLfT4M5HsW5NAlB7oQuzS1nh94fMopbP1sAvjSjJSHx7JfACyk7xw1o+N
         Zx1dxPDGG/z7TOjXZMnPtMXfPZ7axcCsdnvPxaVAMgwH15vjjD0OOBPnMEdmf4DD8TId
         d9al2U8soSLduTrB3O69gXJytPlTgzLQ3q5Byh9C2okpyxdyYpljk6UBZ5cWApQCB4ql
         glPg==
X-Forwarded-Encrypted: i=1; AHgh+RqooqQkQGbtGxA2lp+/Gs+3uD68QonvMPYtb03uBngzEUTK9BI8uehfRLlR7EtuW2xSA4Z1/RHDWvSi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44rpn9We9/tflH4CcljHlNo8EvbuflCcS//NL1CD+TFmMeJnJ
	bYb4S6ooBic5ULsyHcnD0LudrjakwvOzTUa0kKF2DWO4kUPrb7hlxZfqRK9iACJWFbM=
X-Gm-Gg: AR+sD11DnhAoaJDnODP+Tvoa5Xg5NricCKCklU6d09nSbCIaBGuQc5aFbs0QnbkdESF
	Sry6BDXW/GTI9zXAXY83mFqLU8WYQX9OSzVpQc04AFKHF80Uy7Yet9plyZxuJg+Od5goNlEMvr+
	vREl97dq9WNmCI+hbQXWNRdl73+M3dZDNjtuZYnR69i4gMkOEubItV71UbS57spT6NbmHKhi8Zj
	jm33Ft5sHtxvlCfyLJZLBbjqY5mVuq6JS2CVe5okL3ArdeqwUoVZQxMxAF0xqwmyKqsoHKsSnGD
	0sOcTXX/3uK1I2x9gOWKEziH2zqskAvk161onWr5q56Qo+wAJiJHWEN3merj1sPH87IE+rhJ4YN
	eqGYTnG8vqk3vMPJxFdd1ZESbHVX11BV0ZTBDkn1Q1AomoTEqHmNh+RZPX2UCoiqAKzzkbrRhSo
	Iid+4zSko=
X-Received: by 2002:a05:600c:c08f:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-49573cfd688mr15528255e9.25.1784788384211;
        Wed, 22 Jul 2026 23:33:04 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c531basm12160604f8f.19.2026.07.22.23.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:33:03 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:33:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <amG07XSER0tqQTDs@monoceros>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tnjgjfvpvmj54rn"
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-5-shenwei.wang@oss.nxp.com>


--3tnjgjfvpvmj54rn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 03:46:47PM -0500, Shenwei Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/rpmsg.h>

<linux/rpmsg.h> includes <linux/device-id/rpmsg.h> and thus provides
rpmsg_device_id already. So please drop the include for
<linux/mod_devicetable.h> which will go away soon.

> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = CHAN_NAME_PREFIX },
> +	{ },

no trailing comma after the list terminator please.

> +};

Best regards
Uwe

--3tnjgjfvpvmj54rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtZsACgkQj4D7WH0S
/k7/awgAj2vySxmy5vP1QwUkRZfLQnnTNKmx1EuDKoXg/nw4qRoyCtymTNF6iUvm
bSf7sZlRAqszzyqHR6g/qzf5yiGVUiAQAfxOlSYgB3SkP/7geaQXcPhlxzHxYU/8
aSWjMJ047hhilAq0C6ntgCbsBuUbHyGKC354E+EZYMESs0gKbdk1cWlNuay34k4A
Akaf2SEW/aZ/E/X1znyI/vRJyIqv1QBeI4+coopWyFigk2eNA1adyWif2iunnxtt
Z7EV690/VGZmcpQwDl/IAevcLh4cg2nhiEh2J5iIpJsvbmiDLQng0G5V7BQxJ9OO
7GNNyk0IGXtulJ1RztaEG5a7Kvc/3g==
=H5Si
-----END PGP SIGNATURE-----

--3tnjgjfvpvmj54rn--
