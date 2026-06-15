Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A4940E8E6;
	Mon, 15 Jun 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542330; cv=none; b=UD0+0jMzTzNg2j5p2H4SciqLhidCelRHWs8MQr7pnCHFYyFmjdBx1Bxx4zRUhjbkX/pFUgIzKNwmLXIZ7xPt0VQ6hCr/O0Wx4W1tC/Z3n0DKghidmXVfSI/MORVskOze+8/M5z6VcesZH0Fdt8DRTlx4gMzbJs0nKfYRKZ9OG5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542330; c=relaxed/simple;
	bh=0oPS+Y1pYLh2LoThtzAEMH5rc8g5VXbsmKl4ASL/bE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRmwoGdYtfkfC58qU+mDakuGa8loNn+Q9T17TG8Ezk6foAhf/5ej7H0YYYdFV5xD04k+cNNy9t3qzcPut/ktnyS385ZjuJlFNp/+PgBtGbWCV8QwemiC3999ako09AOWwp5ZbAtgd0r/dPgV+C3F+jiRqsd60ALZZ+3HkAZyUKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKZ5Tb43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKZ5Tb43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04DC1F000E9;
	Mon, 15 Jun 2026 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542329;
	bh=0oPS+Y1pYLh2LoThtzAEMH5rc8g5VXbsmKl4ASL/bE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BKZ5Tb43YYrUg1ln3/B3cJ9bwglkhABMmJRVElKe62Jz9oCIljLckqtwlCHuV36cb
	 gaKNzgMuQVRwSJKVEqkqTlX0GSp4lKyFxGxurLqgC3o1PZq4NKRu6RQ8tSaq0ZVBkp
	 CFX+gmhcYc/ps8dqk8AxGpRvc2bwWxz/GqhDqgBhVYmdxxMl+CGSRG4xIX3JabxiB6
	 sElsBfK3Zj8uXhf77PRzFIKNnva7m1vLuWjTvUNgj2CcIiCl7T1U3ggApt/vun6mHf
	 TEXE7PX5Zk11K1mUsBF5rDPEU/k3Gdfcn1Tl4zL3DvSXTOdRp6/YvnEe1z12T94ePk
	 aM84bdmQqhTTQ==
Date: Mon, 15 Jun 2026 17:52:04 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
Message-ID: <20260615-ultra-pagan-84de490070e1@spud>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NjemHPfGrfprJAyg"
Content-Disposition: inline
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>


--NjemHPfGrfprJAyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Given Linus' comments on the cover letter,
pw-bot: changes-requested

Thanks,
Conor.

--NjemHPfGrfprJAyg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAttAAKCRB4tDGHoIJi
0od8APwK8rXpQw86pv1NXaMpKqdBFRw9Bu135w/2LvMhUYg16QEAofCtWZ2oW1Wc
CZPw5TNiFlXIuEJtG7Dt3Lvo6SMYqwA=
=LwtE
-----END PGP SIGNATURE-----

--NjemHPfGrfprJAyg--
