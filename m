Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99790487CD9
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392805; cv=none; b=dNHCwLTxbA9EomLNCgbOms3+qrZCHtckSEm+pijKhIAfZ+WSADm2qomKhPXShan9uuXANp1gMsvMB0qbN+b2CwQuw7EzY5maYTZr4pGxDFiBBw6ZshzUV8Q1fri08RISiMr1XuQfAapMASKY4Qp3mZL4FNzorvSHmRfNyK9vyrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392805; c=relaxed/simple;
	bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5SFQ68x3ifCSF5TfoTQBmQh3m7tZhslL60gbM6XrgTBPSUslLNcn7R/hr8AqcjZcmhp7SAgvK94Hhk5AowgUEWwCk4D6BLH3+ULfgLgfGhawpdAWBWkY22AC8e4DnZx1+r2P3y8C6qZ0Ldbdjemm1ME0U7whdBspZYD6BKC5Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pPNJIzvk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pPNJIzvk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so12403415e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 23:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792392802; x=1792997602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
        b=pPNJIzvkh1mQRVSumMfJ8/l6IZifaWdKY0HJnv6PlrvQY82XR6BfCYfV2NQh3xuOI9
         G98ISJqjg6uC8JQ//pWcgrQjCJiT4sC1JHZnqRzXOufvJ0k8mn/02POkebCqWQ+SqMRA
         qE+Sy6omxmeUZTGz0Zz3YTOO9qsTwhtnjYTxfQ/58TP//ASaKEReMyAc1lVmMyj62uTw
         eRZQpaSR+YCnBzKVZLeIC/8zmepMCAXm5K1WCHLEqEH5JIRu55fq5t7vTVBe74idtwh+
         xQOcXxhabYMEV5LadQtQLiYs5ziO3cdl6cM/up9co9kyyGslBlbXyJ1Jyhg63NF7B2e1
         TLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392802; x=1792997602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
        b=Dsk8u+XL+iB6+lhdCFNSIDXfirv25qjp5t7fY6MfsvydP+fSM1+4mdiU85+KP3etO6
         xandm6nADmvzQpG4sG0fFtMGt308Z/TLOZ5eCVGxd5dV4EvIVbssF/OtKZyzSBATrYvi
         8tnNMP78qt7CGhM3E/r707s6aM+wPq0cxuhURFvZVAvxYCIjtYWALwUL3DwgKvBv+qha
         zE059k8U/MFmNoUDftXvBTgQyueNRKnYGGY6P4jf2lGZUMY409rTiScVC8LMkhuVE3DV
         TSnmqoZGLUwzkgP/OrNee+ZmVdFz1aPtTDhcxblTl+OSYY2oo0ndYo3LyuXSb6L5Qzh9
         S9yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkblzGak/s+Gn251Bm2S+w5pRQJBeT/oiVO5DRVwQR0ur3nDktssm8iAeogcWFhVANr53Z3Ir6cS+k@vger.kernel.org
X-Gm-Message-State: AFq9FYInZRtuEBNi4YLybcRjvvuCsRb1N3xQrZhi2Zquu3sTtUYkWTRb
	lOh2TTnhhbFpYDYH0cvfbyCIve8RoBQM14RKQWQJz/flocMGbQH/wdaRxgmdmZE7+/g=
X-Gm-Gg: AYBFou2l7qGlM8hpd/gLpTd2Au5QUAc0lTXtQULXg88iwu/0mNLEYZNGSh+weFW02LS
	aLlIzxWa2Uo8pyGEPufIcxds5fye8TtkDL4YipxVLy2D6/nUXimbAImVyAZFH0EUHieb5OKEPXl
	tWUK7VbBC7XGrO6elS0HnE5ai5l0uJlxIg4mWUnzDRINXHT9W9DRUSwSeW7cScH0jCbg7nGBMT1
	xZ8RJmmH1J5brcI2tncolCZdrmEJpz0QsG0vXFdexaMOP/AEGp3Pyn4RbeO1sqkBMJsnXPwGCP7
	LXC6daDUaIaFTDIFMFHHlltTUe/y/fLk2jpnY8rOSnL2TT//xnVqCjEE3eazpou0TbR8KORUUwr
	nB7Kib+HFlVYN+5HTmzFKtSmfrStC5+GuvAXeHOlpXliGZpDMmFaKRjDFHbdxp6fYYQtijtJ6Er
	gBu8aErKlxR5PdwuqU/uS0ee3LKxQnyhCPYaHqQ7qhSmdO42i/OQOq7dIkX4i8m9VExHCON5lyl
	ko2kpAFlXQJs1i0IkcOPgx9bv5jqXOkfqTwPZEYGTpeuc9wse0dOGxTyd6IhB4L1s1CDWCa
X-Received: by 2002:a05:600c:c0c7:b0:4a1:d743:77f1 with SMTP id 5b1f17b1804b1-4a1d7bc2e33mr89073635e9.24.1792392800952;
        Sun, 18 Oct 2026 23:53:20 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1c8de7230sm246009675e9.14.2026.10.18.23.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:53:19 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:53:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, mfd@lists.linux.dev, lee@kernel.org, 
	Frank.Li@nxp.com, lgirdwood@gmail.com, linux-gpio@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
Message-ID: <atW-DIGEbPMW4vY_@monoceros>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
 <20261016164625.3166779-8-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rb2hybyhnj2upzg7"
Content-Disposition: inline
In-Reply-To: <20261016164625.3166779-8-lakshay.piplani@nxp.com>


--rb2hybyhnj2upzg7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 10:16:25PM +0530, Lakshay Piplani wrote:
> +#include <linux/mod_devicetable.h>

Please drop this header, <linux/platform_device.h> is enough to provide
platform_device_id without pulling in a plethora of unneeded
dependencies.

Best regards
Uwe

--rb2hybyhnj2upzg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVvlsACgkQj4D7WH0S
/k7KdAf/Ymzfd5nUPGqul10/xb4Cdg8JZlVZwryGIATK15e0B7YEMqJyc+hQaVMu
eVcZr42PEqPgIQlp1aDk2O+1SmuueV/EGkusU0B9jbFL4MYGYDMMX3UXgF93KsHG
L5AztXgy413yo0IWCUZnXqXMjtPSAAOAoJu+9N7VxfWfo4fHLGbZ3AlVffRgev+8
xFFzFPpPNgKNtO2wVYNE3H6K4gKwRMAU3asXySiV/XcnJWZxXoUndsDMpTVn79Wi
kj+JHMF5D/GsSqgsCzVzMNmX4GaziZzgo8BjgIwrbg9TqDEp3zH6reKg55CGXpeD
b49quyvlvKA2UBjz28ZWXDZ7/kEYSA==
=X5cp
-----END PGP SIGNATURE-----

--rb2hybyhnj2upzg7--
