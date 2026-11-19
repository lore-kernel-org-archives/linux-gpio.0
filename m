Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124439;
	b=44TJuoOcICOJyrNi6L2wGOLokvt1/CFsmSZd01y0xQhmort2ovFnvGVkYTY5X83QK+Yw
	 s6t6P/YuZ9Nd4A+DEP7W9JaaPLWxNfeXOJgdjyjUy74Wa7uaAikYWNFXglseQB4nE/llo
	 t2uaWeEnHsWj7VeKfFitKTywun/UEIu+lrrxkbEnomEoNCJ3kYxrCbaPrWva2StkIMmJf
	 UIqsTXPgDdBAUBitOBRzrNfOotQNoZJeH4eBIO55R20h9oWQVDN8sR1BOv/JxUyiz4HW5
	 /PoZ6XZL9fuy38qgHFbYJT5APT37gqMQpCtH/ecW3BeYRFTljEmTOzqEhT2yZG43Utg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124439;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=2rk+9h91UF2ccmiOZHWNjHja5T1YkUMf6w6s0Yio7b0=;
	b=Wmhp6EFtwFwLHQ62Ja1QAM0AuERRj02A0kWOfL0+S24xkrcenZ3u3PSGC8TzNQInl2fH
	 hMsc77BSD6eoIO/e0slZW8K+n+PwCNiU0WZEF5P7M/Ejczln50M4gWXqZMJuJd3CFk+YR
	 CJTAwNDbf6v4iI3VrNeRtOKBdswwaq+zIyIdwrDalYV3jH3retBU81Komgq5lcLUehJVt
	 qVbITaGbjSrBtsbiDxjBPs+MxAaL9a40tzPwC0ldWlspLtwjvoaufdqHjXVOBK48zaYKY
	 /B3SrNY+rNhDfldDOtguMLy2TRmI0CON5U7kamy7v67/uFirdNqqbctayTsTuz7tocg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=cIZk8F7y;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1571D606A330
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 21:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1571D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=cIZk8F7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2rk+9h91UF2ccmiOZHWNjHja5T1YkUMf6w6s0Yio7b0=; b=cIZk8F7yhAFCNkrt6xE1Y+BH0v
	nyS733Z7MQ12xmYp4/P1CojN6TCgQBabqGw7NqzjcRoJWAf5mLCJA1KC5quBtfD73fHgeHJlxMGpo
	mMlbVftarWrNbpBNM6R2rsKwi1F4bXkvjVWiZvdzugb3218cxGNnce7ZNhfYD+xOyqWr7D2tcyrZJ
	LZgOv8Nh3URQ54loXMQxqq0tEL93UMM6mxK9DX/xu2H0izBE3NQ0OSoaa34tEkbUEh2Rj2hGyCoTK
	5crHzHwGpRM8GlOsDGUgmuCRXAeIhCPJQzqdPXR1PVlTxOPTMnzW4TDkPYss8u7e61o/I4V2BhF2R
	HyRZHyuw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Ye Zhang <ye.zhang@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: rockchip: Fix RK3506 pinctrl support
Date: Thu, 19 Nov 2026 22:40:28 +0100
Message-ID: <R9Lr9e5PRAa-_53xglqBFw@sntech.de>
In-Reply-To: <20261119211739.566874-1-jonas@kwiboo.se>
References: <20261119211739.566874-1-jonas@kwiboo.se>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 19. November 2026, 22:17:39 Mitteleurop=C3=A4ische Normalzei=
t schrieb Jonas Karlman:
> The pinctrl driver added in commit dbd2317d7b9f ("pinctrl: rockchip:
> Add rk3506 pinctrl support") depends on a rockchip,ioc1 property not
> documented in dt-bindings to work, i.e. it expects the pinctrl node to
> look something like following:
>=20
>   pinctrl {
> 	rockchip,pmu =3D <&gpio0_ioc>;
> 	rockchip,ioc1 =3D <&gpio1_ioc>;
> 	rockchip,grf =3D <&gpio234_ioc>;
>=20
> 	gpio0 { };
> 	gpio1 { };
> 	gpio2 { };
>   };
>=20
> With the commit 63113d4fce6c ("pinctrl: rockchip: Add RV1106 pinctrl
> support") the driver gained support for using GPIO bank referenced IO
> control register blocks using the rockchip,grf phandle of the bank node.
>=20
> Change the driver to work with dt-bindings documented nodes and
> properties, i.e. something like:
>=20
>   pinctrl {
> 	rockchip,grf =3D <&gpio234_ioc>;
>=20
> 	gpio0 {
> 		rockchip,grf =3D <&gpio0_ioc>;
> 	};
> 	gpio1 {
> 		rockchip,grf =3D <&gpio1_ioc>;
> 	};
> 	gpio2 { };
>   };
>=20
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

thanks for working on this, also as the rk3506 devicetree has so far
_not_ made it mainline at all, this change cannot break any backwards
compatiblity - as there's nothing to break.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


