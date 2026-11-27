Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769995;
	b=tdlMpZKRZ2v6osJtJloHaLUMmBg/We+4h0S02RY1y0ON1cp6VCyr7XPc9ZiqVOehCuMY
	 EoCdDcM18Ful1nJNn8JJ9NECTfYlBSqtMJ1u5Hv+SyDJQHJv58vKfEbGUeep2ycY1Uel+
	 SLM0iF9lvw2woS5fh6DJNiF/QcoBZj9GyhMcYYxSaICRImIPbROjQy74ORs6NIBT4sD8c
	 UsiVouGLrWHGQchv/ZdFTXyq1EHLulK5hqFx3/lnBWR37xJCk7Obqfjg9V7tkxIK9/sUi
	 KyBn2y3P3KelK/S7/+xX4de8hthFsV5tXQCpi2gjuLgntRm0WazgZ32xgUFZyU5UwDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769995;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=YB7PRwG4EacmEB2KHGqos+U4iE7VPEEu+UnlhOUCZ/0=;
	b=bY9YnmpHP5NdglvfZzu2iE/gH9bTeFtRv/Qw0i7U7+Tgr9A/Wwdv6I+95nZuqFzXueBs
	 CbKSkM+7pRwi5bmqzOLuGCLE93CLRCCr1GRBmzsL/rcdz9Nxigbl6RKbwqBfW02VG9kmG
	 2cs5Ozpxw5mUy301KOQFYKb14ruVz13L5gdXjjtmM1bV7y4tHAmkgQB3rpE5ew/fpyYcI
	 geLBRwFzp0hSgoPABWMITUiMZVfFiZ6+FPmYIZH8Ma6UWTSMg04Ue8klxqdpXlJsvAHQK
	 39GdKO9ZujT1RiLthjiO+hUruf5zjaie9noPVimzOjPL6U97zedhVE+NMNwaJCOKqvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlSfbZ73;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9EF35606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlSfbZ73
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 797871F00897;
	Fri, 27 Nov 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769995;
	bh=YB7PRwG4EacmEB2KHGqos+U4iE7VPEEu+UnlhOUCZ/0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=QlSfbZ73mHrcZnGAXOOtmbXyjdlg+s/D23EhkCPIZVuIijxGjIEseUFG75lZQR6rg
	 BfTTFJzEw4hxsh7z0ZknJ/O2pSyoIBJllA+WDkNwWwTCa/s67acIRoqM/Z6A60CrsU
	 cnFDbIyqDuk6deUFz5mnIDbhWzYpSXwuLCcqL1h8I2am5QQgRDdQ477trixB1jIepW
	 qe2I6vtlNWrAFffssHKSkeQPcYPnFxa6WVqUjEkvT7mBEBe7ikxpEO9+VaBeQY+Nr0
	 nynBOVol5c0lZVtbvUcQMMl6DXbWDfNr2UopIxyd7hGrFv6TzVSrtMnHaB54Kkhg3e
	 U3NKMBG7EJsag==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 09:59:45 +0100
Message-Id: <DN5VBYNBOJ72.1AB3PNDNJZF2M@kernel.org>
Subject: Re: [RFT PATCH 06/13] gpio: max7360: create the regmap-irq chip
 from the gpio-regmap callback
Cc: "William Breathitt Gray" <wbg@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Petar
 Stepanovic" <pstepanovic@axiado.com>, "SriNavmani A"
 <srinavmani@axiado.com>, "Prasad Bolisetty" <pbolisetty@axiado.com>,
 "Tzu-Hao Wei" <twei@axiado.com>, "Karthikeyan Mitran" <kmitran@axiado.com>,
 "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Lee Jones"
 <lee@kernel.org>, "Long Zhao" <longzhao@ambarella.com>, "Joseph Telaak"
 <joseph@telaak.dev>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Mailer: aerc 0.20.0
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-7-mwalle@kernel.org>
 <awiaDVcNkqjaRL6S@ashevche-desk.local>
In-Reply-To: <awiaDVcNkqjaRL6S@ashevche-desk.local>

--27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 26, 2026 at 9:43 PM CET, Andy Shevchenko wrote:
> On Thu, Nov 26, 2026 at 04:35:17PM +0100, Michael Walle wrote:
>> Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
>> domain.
>
> ...
>
>> +struct max7360_gpio {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +};
>
> Why do we need both? Is regmap created with difference 'dev'?

Because the regmap is fetched from the parent, i.e the MFD. But the
callback still needs the GPIO device for allocations.

I wanted to keep the change as simple as possible and just moved the
whole init section over. But it's even simpler to just set up
everything in probe and then just call gpio_regmap_add_irq_chip() in
the callback, though that brings more fields to struct max7360. But
it makes the code a nicer example.

-michael

--27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawlGghIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g0JgGAlQ5/oEFh4r65CmLFDVD3n2y7Vrta3g4H
ZJVaywz5Lz3ZoprK1sbbKtnIars4TwI5AYDG7i38BOgAOxidvuuLd1mL1TH0ztdT
wmUR5Sd89BivOMGXvrzhQdo42CAWS3duaj8=
=F/oP
-----END PGP SIGNATURE-----

--27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41--
