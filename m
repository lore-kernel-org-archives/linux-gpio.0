Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58043D75B8;
	Mon,  8 Jun 2026 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939053; cv=none; b=oaz9fu5h2684Yg9ztA/XnW7uh+KKExgUxQBrt6j1BWLdWdg5JOffVFf1gc+GGCFPj1V9pOi+Qtc7KtiffOIEkODcAXV0arklxlDkKpV//eawHPzvrD9mBkBuFYQ9S41U4HC0fsjfbDkjzIxolGs2hCyKuNwvv3JKbYutrbxmC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939053; c=relaxed/simple;
	bh=2GV3kIG7ez9x7067Qd314GRQpkVqCj6sYTPLpFhTmtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcg3ZIfiM0He3tlNKG5AvearplYEy6D/6fOOtcTe7CRHx0AkWS5E/p3uIF6wq/1nDxvqtbbaDBSvM2V6USp0jKGDyBXoGZvlV81Eb19Qd/2DU+X94klCeFahvX4i/nbeYLlQcrAT0m3FX0893jyFuryCH47DFQJ/KEp+MVqP0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj5NRR0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj5NRR0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C791F00893;
	Mon,  8 Jun 2026 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939052;
	bh=EoaWF98+HaMgAawBmWGsXjwwYofJLUBTv5PDgbkDQ4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oj5NRR0gDa20WcVVeTjIy5kdD5AaSD5RahX38g2RKp/BEWI2y7q2FpAGG5oWzg1d3
	 Xrt09e8IX6tTlGOyovep8X04T5R7D6N+rm/Nt3y6Yj3vWozGqJ15ilmQMapEVPP9na
	 +DM8wEnZkhV6NOWwuNWj4hYUa+9v/JkKWWaVUxqS3d3gCVlOv4bW89ZtlTYuNCPcXe
	 3NwDLxTVIMPvYhHTlL4wm3J6F3CceKZn9Sh+wbd6euJGFVqOpexUo3EI7OtpG09Rd+
	 L240DlTu65VClpcB6jLn/2EKYVwuiXQt2JEA9eMTyCLc5IUJPzSfyNbx2kmPqiipR5
	 iyZV7OXE+WdjA==
Date: Mon, 8 Jun 2026 18:17:28 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000
 pinctrl controller
Message-ID: <20260608-cheer-diabetes-02de68030e0a@spud>
References: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com>
 <20260608-ultrarisc-pinctrl-v3-1-30a09ed74275@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zgFbGVv/gi3V2NS6"
Content-Disposition: inline
In-Reply-To: <20260608-ultrarisc-pinctrl-v3-1-30a09ed74275@ultrarisc.com>


--zgFbGVv/gi3V2NS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 03:50:48PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
>=20
> Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 131 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   6 +
>  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  63 ++++++++++

The driver never uses this file, so just stick it as a header in
arch/riscv/boot/dts/ultrarisc instead of making it a binding.

Otherwise, I think this is okay. With the file moved,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

Cheers,
Conor.

--zgFbGVv/gi3V2NS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib5KAAKCRB4tDGHoIJi
0jgdAQDT9rlpF9DCZFIGc3k8IKgevTqkPCUrWhmOU2q+uNPRgAEAmg0PMLFD6ZmV
53yv5uzqe5/WxDRcV5tZ4i/w7JsZ4gk=
=P8Xr
-----END PGP SIGNATURE-----

--zgFbGVv/gi3V2NS6--
