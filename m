Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795277379;
	b=w/JT7LDdK1l7wol75+dcUj0QtEx+SZNVR3iUrBAHhifqaD+D4ijgiYFy7AnESRiTWGTp
	 cazoc2zalqt4IS76s8xCP2G65/G015JUVcFdhs0mmlOW3zeS1xmYhFHCIgOYWWqwojN3J
	 tF8WXAtnRqYgyln1jaEROD8ee4sxymH1q9+bddc/RCWA9845Ud5N1a5DYVkK3SQ7bx9e+
	 Egaa/JZ+M1KU62G+OdhhihsXVyRIv4v53c+gMc5eLRSphT9Bc8tYNcZBsWfknsdxyt8ne
	 68Y6IX/xWGd6vWigY6BEwEJ6o1/wAMKMOgTQck0SAAuiI3V28TzM5Q1aW16Zv8n65Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795277379;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=7BfZ4ezOsyJWlaZx8zGrRFH+Xob1HMqX/m78J/0L5dE=;
	b=NnWJtQpVmQ1V7pYUk6vU+COe7bly2F/Efey+Bss5EM7URN5Qm4+2sJ0mMXVjE4hfMerB
	 hNL+99odZEUSuXwAfryFssqgz1p9SmUutS/Ci4tlh5nhyHD7plxWJRca1vDhnV4h/1MMS
	 hreyr2m1QzVvL9WG6SKmYmlOHPcHIjYxMr6dTO2xuFkGq4gpJhb77c+6Zf0kxXBWhSuFa
	 e3XAAL+UwVgg6iXUSQjzrr7mAGWVhaCvs8iEtdmlN3idn8acRNmUKzSa/S7flGRuebR6j
	 PDtw1GKj/JUKpopM/wAYERbKmflBXCQkisYipWPFQkQifvqPnlEbyG68jbOqvQ/U7rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vWMuBhEL;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1E606A32A
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 16:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C1E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vWMuBhEL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7BfZ4ezOsyJWlaZx8zGrRFH+Xob1HMqX/m78J/0L5dE=; b=vWMuBhELKZhkOE50k9naugms6x
	aBRzDyWiCU32WUfxiJ9CmkKxi7DPiXk2TpKQZ1ylTKhksqU2LE1aB0AP1uOW31p/5S1rP1WfPeDCc
	6lQedV8M2Gfrx2hcQJvXhzDLqBjJRMZH/2s9cdDfWagzp7G/3zK6M1AANXQPNtvcR54nIzvTmp2t2
	pMDEHSMc3MCXEXprx7KNgu1CXRENMIGtwqmaryI0beUU6HNGUou+mX10bNYSanKiTzSTZRBq1t7/X
	KC+rjqRr+TtrZu2iNircQNWLAR+j7dXqzFq90eeLaHxSR4lAqMO3bYCV9n3bc6D1V3zmtd3Iz8jFz
	neZ4o/5Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Ye Zhang <ye.zhang@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH] pinctrl: rockchip: Fix pull configuration readback on RK3506
Date: Sat, 21 Nov 2026 17:09:29 +0100
Message-ID: <-Gre4owXTw2C51e--4u2UA@sntech.de>
In-Reply-To: <20261121155810.706866-1-jonas@kwiboo.se>
References: <20261121155810.706866-1-jonas@kwiboo.se>
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

Am Samstag, 21. November 2026, 16:58:09 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Jonas Karlman:
> rockchip_get_pull() is missing a RK3506 case and instead returns -EINVAL
> for all pins. As a result, the pinconf-pins debugfs file omits the pull
> configuration for all pins on RK3506:
>=20
>   pin 0 (gpio0-0): ..., pin output (1 level)
>   pin 1 (gpio0-1): ..., pin output (1 level)
>   pin 2 (gpio0-2): ..., pin output (1 level)
>   pin 3 (gpio0-3): ..., pin output (0 level)
>=20
> Add RK3506 to the case that decodes the pull configuration from the
> register value to fix pull configuration readback on RK3506.
>=20
> After this the pinconf-pins debugfs file includes pull configuration:
>=20
>   pin 0 (gpio0-0): input bias pull up (1 ohms), ..., pin output (1 level)
>   pin 1 (gpio0-1): input bias pull down (1 ohms), ..., pin output (1 leve=
l)
>   pin 2 (gpio0-2): input bias pull up (1 ohms), ..., pin output (1 level)
>   pin 3 (gpio0-3): input bias pull down (1 ohms), ..., pin output (0 leve=
l)
>=20
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

rockchip_set_pull has that case statenment, rockchip_get_pull is
missing it.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



