Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA41368D7B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839041; cv=none; b=Iby+opco/qXS/0XOwDhlTtKbhQj4CCl7JKZ8HLDAPuIk7bhSNR4LsH2VknOLLDIbJZx26N/FUiWinXj8GXrjSCpm38F/1ymsYXv4nCAk+ZIoHo6k000u8eq8s+FMjDp/lG9Jp8m8bv5dmIeC2tcMdSoHou0B9pTGySVvWL5YoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839041; c=relaxed/simple;
	bh=exAdBV0CJ+CJeBlSrm5PqRJYAmfehJXDlvdKnhel55I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n370tkqb4NrfPw+JoUXIiMDASfcyhEhEvzQKSADr+kzOYq+41f1I9OFlxzUWLGhzAil0Npcc4zOUI9aIa4V87hodnZyOt0HQdSRnSZggs1dABHSZpNPu6v1r+gZU5GEitrwtf18DK5TeAxtJcIpTUWlY+ohuim37UtMRRmbRp0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vYFm/js1; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vYFm/js1"
Date: Tue, 4 Aug 2026 13:23:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785839037; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=SXMXVNRm47vOfWAkW4rHlr8AwAXLWbH+VP3NwGklR/0=;
	b=vYFm/js1hj1LxN4Rg04Y4K5GJgKsoyFxY3A4H+yyigdx/9TT6WQtjwuVSbmsy+rMUVlhPC
	T4eMY/88PWD11elIAFRwQ9iZDT/OhZRVMBW2rVSSn4QdebFQBPcr+xBmBKe70JfNKN5h0n
	zZy0BkE1+Dqa2opvujjmr6WuW74nKkE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 10/10] MAINTAINERS: Add ROHM BD73800 PMIC files
Message-ID: <c686747834b8e711368e351048df064044fab3fc.1785838585.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1785838584.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QG1jGP8leERTpwax"
Content-Disposition: inline
In-Reply-To: <cover.1785838584.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT

--QG1jGP8leERTpwax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the undersigned as a maintainer for the ROHM BD73800 PMIC related
files.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 v1 =3D> :
  - No changes
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 716acfc3d7c1..0f1e2c2e1046 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23545,6 +23545,7 @@ F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/gpio/gpio-bd72720.c
+F:	drivers/gpio/gpio-bd73800.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
@@ -23562,6 +23563,7 @@ F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
 F:	include/linux/mfd/rohm-bd72720.h
+F:	include/linux/mfd/rohm-bd73800.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-bd96802.h
--=20
2.55.0


--QG1jGP8leERTpwax
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpxvbUACgkQeFA3/03a
ocUlmAf7BSIN42TCqMLtx2F7n37tD7fQoEA/fmyORBytU/ctCw1KP+jvTuaedL6m
JAs39DalVlvfTpQUBacqBZqGRrbFFIVz6RBgW1FG1MNpldgGa4TarBu0tBNU7PNu
BWI57gSwYDh6VLakEo3SVElubJb5vBD9CNqfPn8jzZ6v0OmyBk2DcUUn3qsUtgrk
Re7ISxx70EUkfY0SVst5pguOsnlE+NRfqxjvIL3oVxOcpXt+ZBREMfPlPq9NaC35
SyvD3uVRggIYI0hoN5stDJNzAaCxJU4qlQz0F2DuiqtvbJngKmPYZmAB7XvrvW8r
TduvXiQz02iNadFLeRO/r/pIFldalg==
=Osfq
-----END PGP SIGNATURE-----

--QG1jGP8leERTpwax--
