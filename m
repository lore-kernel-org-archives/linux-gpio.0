Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734B2E8B9B;
	Thu,  7 May 2026 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174814; cv=none; b=Xp74OcJBM9R1CrNSA6mfOm0ew5FS2o2nuMe0W6G03OYRmQuKxgimHUZg95LifiLh2XYtClVIfUg2sQeOH3rkZG1u9v+mkL8y67Vd13gfXWFCg5s+rfzJfRfTCf21RkXlW5/wt/WRtASfzgr3vDsi7Zp0EbYa7Tf0YqVmrOJOvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174814; c=relaxed/simple;
	bh=er7IZqsDXotzcGfPcmmIPyaQW0ADB5ziNRRJ1mEtFyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcNCRvjzon/FeE+DjUzfikPDduCXIT81IoRzbzp0f6uWGnY+m2SJ4bbVhm+QEmHPY5SC5WbF8ybEA3kUg6fm2mQBdGQyQsXPEszaYIrFnIdiy1RvJNpGwrikhz6bB5ZVnbpLjGhkiizt40cijLAlU5Mb8dTzsUrUcCz6Glfqskw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaOiXUwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaOiXUwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED508C2BCB2;
	Thu,  7 May 2026 17:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174813;
	bh=er7IZqsDXotzcGfPcmmIPyaQW0ADB5ziNRRJ1mEtFyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaOiXUwh/uomCsNrabYzY/9Tq0byHXu9pF8ugjLJqHjNOF+I+niGuRNL7oMtl+H+X
	 PJhklC0fAa8htxNJqPoqHxGT2R58vgMl6ftLCxMhNG822Cpv8ZEQ2OW9pc/FmWMUvZ
	 DYoS+Ags6/GkuS4PvCkr013ZrrLl7PGmzLRySdK1mSDosNqHOK58WFR+NPNuIoKk4y
	 PQRFS3tJT5QaKXyMuU1zhtSwiMmWBqelQOw29EydqHxSxD5j3KAipWCNausWbTLDbX
	 iE+GTSdx3gPqw+BiEklEumN9kg3SjBGEYarC04LPAW2e5GSWvp4bje6GOQcz1Uy5SJ
	 Mw/RX0jVz5GrA==
Date: Thu, 7 May 2026 18:26:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 01/12] dt-bindings: clock: thead: add TH1520 MISC subsys
 clock controller
Message-ID: <20260507-conjoined-ripeness-6d612060a74a@spud>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWSihzaVh/hoYZ1P"
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-2-zhengxingda@iscas.ac.cn>


--HWSihzaVh/hoYZ1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 04:16:59PM +0800, Icenowy Zheng wrote:
> TH1520 has a subsystem clock controller called MISC_SUBSYS in its
> manual, mainly controlling clocks for USB and MMC/SD in non-TEE
> environment.
>=20
> Add device tree binding for it.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HWSihzaVh/hoYZ1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzLVgAKCRB4tDGHoIJi
0vQOAQCs40DUjyqB6qe07Jwhs9TJUGp6ouBgTU9mEJbvp7W2gwD+NqsikfW+txt4
ZCBAgwG2gnWsVXZAJsmrxWYgEXgJgwM=
=Harj
-----END PGP SIGNATURE-----

--HWSihzaVh/hoYZ1P--
