Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BD16132A;
	Thu,  7 May 2026 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174780; cv=none; b=l1T9aOj+NnRn/AtS/Vp7IT6C56fnDYBUA0guzuEH8e5OzLqhjtTv924VgjIC6/wlTpj1Trnp6jkZlHp1HJ1Zns3+9RzKLwuYaU/3Bzy/E0SJoH0ZdQUTZhyJqnWZJAz9rMwyplzk25E24wodhKFvebMFHqUyyQmeR9hp6yAdJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174780; c=relaxed/simple;
	bh=CxvcpXiBTI6/kR/4dGt5iKAcJgtLGpTZNAw6IIDOULc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnKLjfIrR3epzNfVgeWDx0sXW3n25PJ/6uNaxZpAG/kB5kBzGH5s+1+hhXDSMkDhpUbYHy//kO5DeUngPmEih6gJwR6sumaNGJdGuV6XUQNW86mlkakLv1bV+2T9HdIUQyV1u65yLG/xek3pwDMwXH2zANHVrJ+rS06G3c+UQGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnVTMWfu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnVTMWfu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEB6C2BCB2;
	Thu,  7 May 2026 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174780;
	bh=CxvcpXiBTI6/kR/4dGt5iKAcJgtLGpTZNAw6IIDOULc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnVTMWfu3FPehm3F1/CX0IgK4P0BjumaGCE3NVe8In1lyxz22/zos6fAqhl4BAJM0
	 jHlmt5whs4S1P4IWTALrAgMn1rBrXGgtHY+rU6BQMcy9un0imsTYecrzf9dAnjPo29
	 wwFW2SG/NsF1cJY5gsye1rVOLYcrg27JTmLsHRyZ4AIVDXcs2+k93e15eGEqQFGxiE
	 Aq/7BkB9sKzOv9svHe4NAg27LAt8748GqNYEVinIRxhQi+NFat3WWGpDu3kQqRWqDP
	 ChnY/0mdOVmsMMWt3QkCWP4CJfEvQDpgw5H9GhkYLgd5gV+Bm6ivwkQv123NuUg3wh
	 lzlqM5M7ZmKRw==
Date: Thu, 7 May 2026 18:26:12 +0100
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
Subject: Re: [PATCH 04/12] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Message-ID: <20260507-that-creation-b6e7d297f924@spud>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-5-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zJEybQaft2oIsmIm"
Content-Disposition: inline
In-Reply-To: <20260507081710.4090814-5-zhengxingda@iscas.ac.cn>


--zJEybQaft2oIsmIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 04:17:02PM +0800, Icenowy Zheng wrote:
> The TH1520 SoC features a Synopsys USB 3.0 FemtoPHY with some custom
> glue logic configuring PHY parameters.
>=20
> Add a binding for it.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--zJEybQaft2oIsmIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzLNAAKCRB4tDGHoIJi
0pFNAP4piyDsMp91OML/qoSMafgNp3vZmLDMs4hb57FWbv+ARwD7BwJiTYBqEgwL
O4OyVRx7Y7tC6EIkADbPYmok4xSUOgQ=
=Nper
-----END PGP SIGNATURE-----

--zJEybQaft2oIsmIm--
