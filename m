Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792862463;
	b=OH4pUrypxg2zisr6B7HKp7DLfvm+TqNlGDc5mRL7Iqbdg8Mq2qyCR+MsivjKQEZZow4y
	 Y4yuJDzKmY07J10BtywuBwp9DweSv+ocI1KgKT8Fs4hyJETZ+C5mM9pmeDYXiA9+sSrz1
	 gE7kgtOFOgxrF+m26b4KhjcfQri7kXc4q4cPeqOxTDEViRtGOxioScoMM+eFnNjlz9r5C
	 cSnjfvblEsgRAodlEJ+65ioLjOq+4AyBieRgr97UtOO/nTrrWIgGWsHXzFjMXHf6Sa9Oa
	 XRYhzoXxmm3P3uMs25lENfYauZUNOUC/xVIL71tBVe/BjXdoOMf0ba2QlbFWusDSSCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862463;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=yWTYQe4+vsul0a+jPNLTYJLGDVUj/49CjjZ6yX9Uw/E=;
	b=zbvUCLPNJCKR0aruvzabcanbRFucpg3/VMu7NGxg2jGLywb2Z/QnLzGAxYuUk4fmWUNf
	 EJ8/7ADfO+9T8xuPYl+EibP41cbz/b3227aYs3m+CdPtL1WGpiScMlM1Gov42J1CdNjyP
	 o30/m6cW/UU2+2fHdacivQqrCqBHHMKiuDqf1bwt+FmQd6oaOfp/i5BX9/TU1e3y/T0GO
	 I3psBqnVHfdAMjZU+0MK043CEGoxNVOLvRI4F9peUg/PhYdVadgwkWaNSrz01wu4nn7Wq
	 gjG97HxeYqJbc5GPNrAWISyWt47q5ORacYnSgIJpXDYds3CXfoVyUv1oNx28sCvqXzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Xuu3iS8z;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=iVKY82fS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A0606A31A;
	Sat, 24 Oct 2026 17:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Xuu3iS8z;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=iVKY82fS
ARC-Seal: i=1; a=rsa-sha256; t=1792862452; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ttBq2p1mPBNCtoltzIsgyBXKIMWzs6o/VsQynm3hQc89lQrzdWCeUeebopjhOwPEE6
    hXnv1KiBmmLJR90RoFkQo0EnVKWVXWyAo7guSnUyqvtbybK/GOqxBIoyyMWnrHMlWX5W
    QYyJVu3EzkTGSkIcKWHeylvERh96L4n55wjC28SJW8osy9+sC0zIhRrUws2AeEhTGC9g
    JeOsaNZgpxzBRBCe7ABcVZrZnttVlZRQG8Qk6Xrc0MWhkX9e3Q9AKyy5hE8n+ebbAbnm
    wztwL1AOfRcLlNLAVAnR+aubKntRpeue5Njoa9VzLbrjvGCRcm8TASVbmg1km8F7NIEK
    568g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862452;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=yWTYQe4+vsul0a+jPNLTYJLGDVUj/49CjjZ6yX9Uw/E=;
    b=rGfPqdNVmOkxy4Vlj4GFZM2niJ7qF5dnXV3PqJQdHtIGZofPEpgj3Dv1fHsN6KiTEe
    6hSFBHheqUDQ1XhYsK6J4Dt3jHs1LYlO+EdqrrUaZZcPYsm50HWRHHB9K87Cj1nOU4io
    M9lKnATLF7KwXD899ca3YyZQqrsqkXJU71yMOBr+4s6u5vFloJsqJSipUCkLw+hLEmDz
    fYsGzTxvkEl+SYozN+3GjDjQXczgea7p9E6zzdLQ+4D/j5nHXqS63A0BodMSiwlxJF9j
    UoI36C/Wx33ZnnCTnmmMVLh3xOgnrsp29UNtO/hS2v7wvoSNUDRyVas6IBIQuGERiydW
    eaPw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862452;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=yWTYQe4+vsul0a+jPNLTYJLGDVUj/49CjjZ6yX9Uw/E=;
    b=Xuu3iS8zOF2c8Sv/wIsqjKiTZ4v8tcA825VDkkEPop/WT4FCM5G8+7b2zy9zt/Rp7W
    /trfD/FNXz3IppU2ytxG+oJu9DmUaDvpq2CnfqttkKg2J44ZPz9JKmz0uEHIxhZGhXzj
    VzReNdIcIO27apMb/21Syr6/TAxbQpWbGznGjYI7ZpZBQBO6jkWS5yGtIgJ6SbmUv4r8
    nuETy3AXzPuGDDPabTupr4KLf7vUHN9Ujnnxrk2hWVtXFJARZM6z1JHoWT0DN7wH06rx
    wuaIpl9Mw39+xiNOEy2cNRHurFvD1ugAa8Cfhr0QlJbFpLdBcBqabhM9A2Rs8N7zoTI0
    Vkcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792862452;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=yWTYQe4+vsul0a+jPNLTYJLGDVUj/49CjjZ6yX9Uw/E=;
    b=iVKY82fSOtU1ebPoColEhqmWz0zHqy32Ku9ft0FV9eWptZ5cdZhxQE8kP4g3+l9Rq1
    kgZD2rg9vCQlYQ+KPKDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKzsiNzptYNlV1C1yk7253raiyx+O3Hxli"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229OHKqwqD
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 24 Oct 2026 19:20:52 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 1/2] pinctrl: ingenic: Add X1600 groups for each I2S
 system clock
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261023204207.48277-1-olivier@mgcrea.io>
Date: Sat, 24 Oct 2026 19:20:21 +0200
Cc: Linus Walleij <linusw@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <60DEBDEF-AA9A-46D3-8B14-8731AAA1B9CC@goldelico.com>
References: <20261023204207.48277-1-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 23.10.2026 um 22:42 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> The X1600 has a system clock (MCLK) pin for each direction: PB22 for
> receive, PB26 for transmit. "i2s-sysclk" takes both, which a board =
that
> only plays cannot use when PB22 has another job. Add "i2s-sysclk-rx" =
and
> "i2s-sysclk-tx" for one each.

That is very reasonable.

>=20
> Used on a HiBy R1, which only plays and has an interrupt input on =
PB22:
> its DAC takes MCLK from "i2s-sysclk-tx".
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> drivers/pinctrl/pinctrl-ingenic.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-ingenic.c
> index 1aa6a6dc1209..28e7f1852054 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2411,6 +2411,8 @@ static int x1600_i2s_data_rx_pins[] =3D { 0x35, =
};
> static int x1600_i2s_clk_rx_pins[] =3D { 0x37, 0x38, };
> static int x1600_i2s_clk_tx_pins[] =3D { 0x3b, 0x3c, };
> static int x1600_i2s_sysclk_pins[] =3D { 0x36, 0x3a, };
> +static int x1600_i2s_sysclk_rx_pins[] =3D { 0x36, };
> +static int x1600_i2s_sysclk_tx_pins[] =3D { 0x3a, };

Verified to match data sheet/programming manual (PB22 and PB26) in =
correct
mapping.

>=20
> static int x1600_cim_pins[] =3D {
> 0x14, 0x16, 0x15, 0x18, 0x13,
> @@ -2493,6 +2495,8 @@ static const struct group_desc x1600_groups[] =3D =
{
> INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
> INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
> INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
> + INGENIC_PIN_GROUP("i2s-sysclk-rx", x1600_i2s_sysclk_rx, 0),
> + INGENIC_PIN_GROUP("i2s-sysclk-tx", x1600_i2s_sysclk_tx, 0),
> INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
> INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
> INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
> @@ -2539,6 +2543,7 @@ static const char * const x1600_i2c1_groups[] =3D =
{ "i2c1-data-b-15", "i2c1-data-b
>=20
> static const char * const x1600_i2s_groups[] =3D {
> "i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx", =
"i2s-sysclk",
> + "i2s-sysclk-rx", "i2s-sysclk-tx",
> };
>=20
> static const char * const x1600_cim_groups[] =3D { "cim-data", };
>=20
> base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
> --=20
> 2.39.5
>=20
>=20

Reviewed-By: H. Nikolaus Schaller <hns@goldelico.com>

