Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984477;
	b=Y0/NhNzCnHo1adk2w2ax8F6ExrU0jTkEq5jWoVPmJ4ebSvMOE98lVmPvuEodbD1AtFmg
	 y0xfS9VPe231YdWk2YpEATcHbjQ9FFNO68W71vsTFXoitxoe2ygiCPjNqm3hO0rL4UjGk
	 Zm8MHIV8U1QTqcPP95FMrgeofDgSSMYQJpR2pPOJa9T9hueMHR5uQcb67sJRSuaCJI1Q/
	 JM28ycimQWR4rR/q1YeVHSrKIl0KSdkpH6kM1thGMbtKBr6UKlg7NIh40u4UOfoz0k1km
	 biMgkykNMgLetry+6eJsHOSnPfM+CGQKFrWC3+oX80NqkNLNrOAh62lNNZfAD+tKCEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
	b=IBnHvCX0RTWfcdfVOZ1UZ1BsOedWxEFGeolNYf3AwWt6Xf9a7vxKs3MeGs6vD8RmkG6X
	 NnzQTHa7+/iOwU2xp3iHfNhcoSgD98yVXhqZ0slWrsjJP7hrkbFdW+QC4jgrF0sn/Zl5O
	 /BcxuvMUjZ8dkdLUc0azE0hM4eOXoNt24YvyONnQGzpXYXYelr90dDX0TpyvbyxOwdIHA
	 of48MxrOL2X6ANkL2kc3oDaWAmzFZtupcIrQJhRyd3LveADZBcWR4Zk8csFz6CfSQJzF5
	 cXDFVFyUZA1UzbbCLefvU+bov5DziNhnWw6PmMj2By8S9zErxECMyQA+zedqgsjqQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ng3OOWZ8;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E575606A331
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 17:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E575606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ng3OOWZ8
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8503395e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984476; x=1794589276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
        b=Ng3OOWZ8IrmsKsrad6/RsItRavtMbiq19ZqOmOWfNLvU1P+payjbAeAl1898rL6uhy
         0kJP6UXDC5E0M8Hzgq9/diGGQ8nCXbNcDtMx1dSVJWRUJzSoMu0z8H6Odxpx/wt7v6aO
         8KLWIW9+mc2rnCnGkRvdIg8WL6Q049lubnkUaJuqz2dDUIqn7wPpZ/1e81CyOJJDzxbV
         CTXzg2sYJh6akoPBXGAeWqlue9uUNUIwnC/Buw5oDrPPD/WzuiiAgzBpRQ3QV7gvD/n2
         XyO4XN3vGG1k2Bsf4P8HVsZSh8wGx8DmPTRNA9Ma51Q1UGAyLRplO0+mIwySZM6a0K9A
         2HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984476; x=1794589276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3okvGIPuT9iWl4myy0QkIT0Qs33y5/YWxTYMyFUZVhM=;
        b=hsJwi09At8dOZqN8pRtzfBZlcrHf2EPYfOHSi1SzAM54h57i+zHCbfiCMWrirQlz2+
         mDPwxjE6Aj5LHWZ+2kSqef9ct5m5WTtnNupl3RHj1Ea4NGWPIqhbrd8xcRgxZRPGjAMu
         axrUVytMLjYNFJ86EfoPqj+PKfBTSCEWtxguJDW174fnmZ+7l8nOfJd5z1+KOgHP6Gnw
         +GSpuFeUYBg28dyYgTjpp/L+bytRssLjOJu0SJh3d0r2iUnc3Ry3EUQjiBe/kzxt7O7V
         9rAUiui+m7hn91GfkfOPOHvU3Yx3RIHmm8pldoQ2SurGKA5wIDhjXmLnatB58toiER/b
         dVsg==
X-Forwarded-Encrypted: i=1; AKwUvBwdu5LAjD5BotVnCgTmhto866ijpsVomOgCjAyU0YjVu8loEAO2IR6PamXbP3L48b1oXQDnWP97AGz5@vger.kernel.org
X-Gm-Message-State: APuU4Z8449IF7dUeUhFVePZzteDFNKdRkxApWS2WDmITlX835tjC2PmS
	85RZsJgYfUNAoYwzEpWtXWf5V/Tn8OOcPmtidDVVJilRMuPzA42EnExggh+BmbKqvco=
X-Gm-Gg: AYBFou1/IBNxjf11nNiulL2O7q2LCKDAxFcHyZ5vN5AsG7h3PTMsouLc4nbf2bfl/Ve
	EOp/jOtiq/t3uq0YjyssnZaZDJjEjdHpqbkmuqGHEmnMPb7N2Y7Z81xBQ9aFh3QwMcj/qxb6Bnv
	WBwh2eRHPUzJNvxuxKqkWFxcg508pqFDD/F1ExyOOrddvJ/wukSmDjKqZJs0pXumjcFW2KFN8nz
	PlPout7Ilqx6LrnPs7/Cylg97LJ7MbG7kv8O9lyYYhv4yJIaDhoXeIqoHc2+nZXJCgsSYGpO2fo
	1nR/jyuTbpI29JTOO7QDfPxJiA9JlDIqWnjPc7h/gyfxg8UIScBvKBI9zc65YTU94qtmV9mrE43
	HWwDXeFeJMr8Po6py2vzE6ZI4hGnHZDeqm2GKIGu7nu61KmLcwRWz92b6sQwvNLB2mfZbSZW/M1
	dN/lU2H3+nAkbu6oJqleVZd570CFkV7t/iG9NW8/8hpmhTalAe5uslOkiBiXOP1npjoVOjyBwm4
	WccLMXqEs25XA/eftaf11xQt3ShUvCc5TM4QPPt9cdd9IFwnH+UWtM6vp/hui3USbQLPre4xjb4
	7r0Pyu/WQZ2WSa7ScGQIELnGnUWGIB7QwQ==
X-Received: by 2002:a05:600c:4e8b:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b6de4a6fc0mr55956715e9.11.1793984475474;
        Fri, 06 Nov 2026 09:01:15 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-492d809ddbbsm4804011f8f.53.2026.11.06.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:01:13 -0800 (PST)
Date: Fri, 6 Nov 2026 18:01:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
Message-ID: <au4HsW2aMYKyMspF@monoceros>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="o4uxavg4tbipdm4x"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>


--o4uxavg4tbipdm4x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
MIME-Version: 1.0

Hello,

On Wed, Nov 04, 2026 at 02:21:18AM -0500, Joseph Telaak wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe


--o4uxavg4tbipdm4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB9YACgkQj4D7WH0S
/k70YAgAhxWSI5oFd+bG1IqCr9QN4qV0nHY8dR0wZt/s30JOYWejw0raTnkHbfMt
1cLN0THKoG3qMmY2yzVpFoHtreyYlcQK6NcK5fqhPRSFwniSgluT/eWevLV4H6NN
oVxFxC97OUD3EpjECtS4q8VTVZWg8kFbqxwARQl208IoayGOXIVNe9/A+/U1rHTJ
DNyJB0xyoYCnDmd0WA/wYkSx6HlNHUbTW4aDPaR6cW2G217wQnIQBzsnb2dUFn9S
q9yhYPN09un908r9vZU8s/sz/mY0bppEUg3ak/jVp1gJfu69jFo14DiN74abx3Ui
N6+6B5mC+kJGbjRTDMCieCzt0cZHEw==
=/RG4
-----END PGP SIGNATURE-----

--o4uxavg4tbipdm4x--
