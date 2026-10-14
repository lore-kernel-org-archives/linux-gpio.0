Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E4F483811
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792012308; cv=none; b=U6YrtuK0yCYOfrD5sBQza3sbOmVpxhRukLon29PRPL6p2JdjdjrTAOCcUNkFWg8EJwQBb96zWeGm6r6qZuX7wdXhq8CWwgvxEys1V61VHnBmETDiRHz2z2e4uT6LZqnO6wEeRCgyaDUP6bAFUEWRA7MyiMWh0TcHYdNT1UWjVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792012308; c=relaxed/simple;
	bh=CoE04PMnttbaJ9PkbQhUpqa2+v6RSVm/eH1pXik1yT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ead5fCN3McwPA4Pyhdy80EmgpyM0oaQkuooZTddvV6UVO+zGsLtr5IpN/lY1FqouXARhB5y+kpoccU8LtyLyIEJ6tU2f43Aae3UEowmgFmD/wsgKawiaG6Z46tzTzX+6LRt6/iRT1ctTc8eN5EYhm8rp09QX2sidu9RDBVBE97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Our+ZM+9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Our+ZM+9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c399641so44672675e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792012305; x=1792617105; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wdgF2BDQf2rF/BhRn+nlQhMcqxcBjtWlSkaY+Ug2V4=;
        b=Our+ZM+9aJGpyHPaoByNt1STVpiuSkmiEzKFa2vzTTLCobrV0BKk6FwE8Irmwicf4S
         D+kFyDd8hx7tV5pEs3M3lcNaKw10oikleBAWTPLEIWbvlyrF3xOx6bO8+RuF1bTuZ6hO
         zwpQ0I0XLagi95JLeE+8jg5WyB0FQg3/Vn9TFmONmCbRDWsI4XW3TmHdKl4bk8837CQ4
         yiaKm89G5pfPhrDtdSXNs4B4IYJSbX9X0nkWsIAOQ09p1oeTskwOkgjdckW/iLFNrlt3
         3y1j6R3R0M44E9vvnqxqA0lwoK9k9V27bTp0uQhmIWvwR7yf0p8T3LQSIVuWZbSUeHgL
         6xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792012305; x=1792617105;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8wdgF2BDQf2rF/BhRn+nlQhMcqxcBjtWlSkaY+Ug2V4=;
        b=ultXkWJMqRCOWOS4yPY6WvzRdBa7e8cawEdwK9JYdpGxR1yaSy7VMx/2etnanq8FHa
         7SjbMzjUBXFWm+0BBn5eus7PVgAyCdkdE9UTmEsIXEYU1Lw+V39DTREdkicJVc1Sexn3
         myf3fUYc/CAxa9balddNEiBkxfCM/fh9ec90cycTKTNZi55/jxdIhFVd0tmxnQSramoY
         hF75Ic/rcEZB/JN0KYbUtHpZMnZ/umIUyn0wRnkQs85TJHX9f7lmrwQmJeML0YFfJUCe
         XjWXImq03anUCka2opIf/sTEDqmKgzXHNn21UsVFvr15ROCjVh+pXtMgW3Rluf2kmKFz
         7YpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdf/aKr87UgUkI7rQzV6ASNwuPsEiItYOVzKKXK2UNLmcA56RwMB7jDaf+qHg+OpXD59Q3OK/dRGZ5@vger.kernel.org
X-Gm-Message-State: AFq9FYILgoKPitIa2GOlnbIWIZRf0KnhhELXG5FIJMyLA4OWU/wY2omR
	pU/6OD8nnrPMkK4Ctnygh/nqS4XejdvAaRyDYwGd9AATLrW14/4hWfkf
X-Gm-Gg: AYBFou3QjaiMKPi1uvOYkVxf64i7vuKQlUEeh9/+TrFLEW9BlKBaX2/KqkzLpx98pBd
	UOgM1auIs8tEzTSXBJAJvQ2eT2KB11KEsHjNVC+o+n9FxOU0A7vYX2iyGUKqdglrVF4EYmfesgZ
	Lh5qLG+v7Ij3yxTtNCN7V02/Y9ooKOnlAOMzANleWpXN9Amqgs3guN1l3ByNZh5DAS9FnudW8nZ
	X87gnoijrpUfI/rEn8KpwyIU2Re0x9YqnAdPYBj0cmsbiHQ5QGLWEJVtTqEBozUqllkbpxvl5al
	pKhsPIUKiHPycxEjQJOZ08E3aNh7BhUkJGyImzKnw34ZbkQatLvpCAZlxamdP5XWZcjdF4YQrYm
	yXsrMxLzOf/E89TIJ/sFaDnuqyM4dqrlr+QhabFU5BEmqNObIgBR3oPheu9go15osPzHCbH5bIX
	jV+UIcuSWd2o/XFFKuUv/fxRYqaxebOq57+zB8vpr7W/1no5RaW8ta+3foIbDyUA9wIhtNYRhQP
	0+MuPgpCONik/QtqPGNQd6xlUZQh+duSamTmvx1/RoYNI4+5n+EC/ezspGhnw==
X-Received: by 2002:a05:600c:8105:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a18e483818mr364919115e9.12.1792012304648;
        Wed, 14 Oct 2026 14:11:44 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4edfsm15124324f8f.26.2026.10.14.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:11:43 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 23:11:40 +0200
Message-ID: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
In-Reply-To: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
References:
 <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-9-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParttNiNcatGTRe0X_MNundQow";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextParttNiNcatGTRe0X_MNundQow
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 23:11:40 +0200
Message-ID: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
In-Reply-To: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:48 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> + * Each bank has 16 lines, one bit per line in each register. The regist=
ers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> supported + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */

=46yi, there is also Documentation/devicetree/bindings/gpio/gpio-mmio.yaml,=
=20
which allows you to put this directly into the DTS without a driver shim.

--nextParttNiNcatGTRe0X_MNundQow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP8AwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi6lsP/0RJ+uVDbDDI0O0CKlkY
BUNsbFtSFFTvMf6KMJlT8cFc3twEamjPapWShtEPN8tAIcT2Ckzdn3nETcIhVpMk
f5vVb/X1Iljo9FFz6dUyXW9Lkc9DalGhVptpyXH/9vHKBq1HRhCU8VWa0DvHblKg
8lEVD4Cz0BOS+aEtcvn0vVxKAGw9X49ieKEvAkQtkXpd4Udfdm4gDcrAmlFvMPEF
zwRPzytJWCBFawDhllbT7fsUoHYnOl1E1BqQ/tBld2IA1YaahqbEQh6BqjjTvZLv
3Hg2qKO64Ln6ojB5MMi2rXlEXh+pgpqilL7OdPjZCfNCi3jFl3a+G4rXoJu8R/jU
9b6mezwNP5JMI59U+jK8yPTNJP1/mNZUocju7IfytjfSIzS0KB9AD0WypDB28O38
MVM75siRiT8cNStVwZbx+Cbe/emKQmE86yVAB93JwUPN3Kp4GcFIxjTnaDqV8mr1
Y7/axwKCTTcY3U5GfqQ11ZOMTN64b80Ku6rWpiiVzBMx0JcgADPZGReeJ32CirAm
Mj6Ll9G64U+MDEuWnjRhJ8O9foB6tw3ATsC+I+cDk+lfVLwf5i6UXoX5RQmnP7MT
3MCd9yLyyUWKgwDldBW5DIxkmEl9dfB7MbzEA9vplbDQ8rCj3y/0uvadxWZLPAs/
zjQYkcM9a0llpm/KSAf5MlsK
=mcKA
-----END PGP SIGNATURE-----

--nextParttNiNcatGTRe0X_MNundQow--



