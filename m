Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB64968F1;
	Thu,  4 Jun 2026 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593207; cv=none; b=LI3N3CK0RHP54onuPTx2VOa/V56iXA0JNXKnDzMLQLf71vWewakaiZ7blCi2VPcvOD0koSYWcOVIu55cBaXeKZNScKJK3mdggAamy3dFEAm7WMjQ+i1hgrOApnLEPoaVhJ8NgM+3CJPjmRgBu10unpKieXpfQGhNgrl+jR2UkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593207; c=relaxed/simple;
	bh=M9HqPMUgUTrZJq/Oda3TrjUQxjZBJ4y86DavhVAAMKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReWA4/jEsw5YrOHx0vHlFbjfGhxbz/RJg8P+eY5Jke76ILwTaZI8bEi8OFq1G5AmZr+FjzEenKNnGvC7aWJqAaoE8xDDDJXge7Na+riLnlm8wEgfu+iNQjr1yyNKc6Vjh4kHgukpGWxEMTLOLvhiE2E7B9XcjVNmX2uPJKXrm+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVJyKJwi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVJyKJwi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231EA1F00893;
	Thu,  4 Jun 2026 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780593204;
	bh=3mNke4DPpjdjtMGcSKZlm7XTAekMgE3bOVU/KndyzOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PVJyKJwiKn4E+C2SFTGIzj7eZ0Pfz8EP9cwAr4kKCEOszyGFgTbErgFQUsdUm56hr
	 j4MFUxmPCMVR7CuieAhrJEFRlowxFkZK21I/gA2ohkxEJq5SLxSpEMVUWu4/NmhmVF
	 cB6zsftZUDCZyqbsRSepsPxbeYMHsKriG96aznk/2a8vNPE1V59Y+W81M40xOmjqkT
	 u/Oc5IwDzDJ6UG5bt2ih+hx4v87eP8j7JimkOqJDMi2fyiPZBEVJ/nVCWMUB7YhSmK
	 sKZxiO2rUIqnz6hdvX+x9kjlD+sZpM0ykNqMkj2qqDERYLCUGKRzBNmdxJG3nUiXEK
	 qo5+YOx6oJ5hQ==
Date: Thu, 4 Jun 2026 18:13:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 09/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Message-ID: <20260604-veggie-constrain-16a72066e82f@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-10-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7KP5dV2MCZU0dpPN"
Content-Disposition: inline
In-Reply-To: <20260603055347.66845-10-changhuang.liang@starfivetech.com>


--7KP5dV2MCZU0dpPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 10:53:35PM -0700, Changhuang Liang wrote:
> +          power-source:
> +            enum: [ 0, 2 ]
> +            description: |
> +                0: power supply of 3.3V
> +                2: power supply of 1.8V

I'd rather these were given in e.g. microvolts, rather than what look
like register values, that have no meaning when looking at the dts.

--7KP5dV2MCZU0dpPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGyLwAKCRB4tDGHoIJi
0qJ/AQCQ/vPUMhGA0s99RrlfmIhY43MmG9ypad6INnfVMc+/ogD/XOOCyrLph3nG
xf3MOhu5OXndhUYDq+Zw0JVREEKimwI=
=gfH/
-----END PGP SIGNATURE-----

--7KP5dV2MCZU0dpPN--
