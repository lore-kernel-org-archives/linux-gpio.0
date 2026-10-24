Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792862346;
	b=mc+UYlwe1SgINsN2nfeUV2Cm4sKhqf/w5FIxm78ujlidK7XNCy1xt3O0TWxt0ftlGuMh
	 74GeVNqb6K7VJDTqILSH0o7YkFB9MAYdY0wcGlv55Cb+ov0tLmZseVkgKLN42InThnLsK
	 jYkWoduVGD+v7cTmq05zTVpnZwccgXVTDxNhSuXEDzZxD9jHXIT5jEcUI6h8Ljfgq1xrw
	 oDHd8BskSOkFteFmNapWUiMCaA16ngRsbAOClu1aDPtSd6XXKqjYxMoEk7RnToAWKHadn
	 5DlBdhy4W23OrriuGdyoZjzJOffYq97qdLzAFC1lMEzgTxcAHTKAw+gyevOa13aOrHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862346;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=GKo9T9OwQ84leb4q/bd9aODGcaIrdjoihosbnMEgJgg=;
	b=zrr0GfLj+5bq/rmdqfO0p/I82o7UMaAkXUMgnMEa3N33rD3ERaZ0/uYJ22AFgefpgBN+
	 6m+5ZNWNrbfdjGxDWt0GAYFucfi6D+drMzhrq8ZSW/+H7UQbMsjICqR23KU2ScAtH4bq2
	 dvcVNts4cbdNMA5csWdhdkeraoLhHMCYWUbCB+65mJxO9ExbpXYmTIyjge9gauPCLx32r
	 V2VV1gRvgfNM+PBQk7tjNXH/iwxoZBXGkfxtpqD72hkdgducFpAGfsK+TJMfaOJ5A/zBr
	 JlqA3UG2Q4QcswvfLBMwyi1XM1LSuY2oHgOHpj2q9cG9fIRzNnuOkjPJhWWdcdQ2IXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b="b/yw20jh";
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cUqmgugE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.54
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B7606A31B;
	Sat, 24 Oct 2026 17:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=b/yw20jh;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cUqmgugE
ARC-Seal: i=1; a=rsa-sha256; t=1792862336; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VwVEghs5CpOIYwMyuhR+iT2wuSamVVIZY3gOCp+5mbpAkp4XBE0/mO/qk0v552TRYe
    0Ay98BgUHZSj2cqLmsnJCmoCJ5lPaCyLZr+6P5GcNYE1p2al8vgVc6LkE1gnOpckf41L
    2WsxqUXd45hFxSq4GTEz2RHd9u9ISAnJxbM+iAm2Zg+QgxFasQj8B/6OFN1+mpC1zMHl
    xrSd7JR30vVcDeSfc8/tfIX6wHAYZPtiEfQHxeJc0YEJs7LDJKJK2ELvNMhzEki3QLr2
    1t1IOk4oR0tyLXv74m0oplfqCCzEb79qvuevmpXov+kUk13c8chnsG3NrEZzGxRu7ELs
    LRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862336;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=GKo9T9OwQ84leb4q/bd9aODGcaIrdjoihosbnMEgJgg=;
    b=Hig4j0kfpCQmu5POQEjQ3ISxOBe//2BATQ5UzxSMufPctkWqC75rdeRAj8nqdJ3gGi
    0VgLRknLHXJssq6zch+bEjqIo/J0Uiba9PHWccwDRWUdbFPhSOcEOfEn7sYJqH3gUaHa
    oj7nFj/F0zc2CQFF6LoBpI6iV3fzHKfjX5Lf+VlfZrMq9O5O8Hb76NtMqLros3MYEVXT
    sk+UOqfJOizmMElK5jUiFxBCPuEfT6GleEWLsHo9BGJYCFv/QdaXR1mole1SAtiwF9I5
    suIS7IVXqCo0f1v5UN6HLKikz2dGteVBq/99mVHm/kfw6DVZJ6jq9jGsDOnS6Ep6uwo+
    AoAg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862336;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=GKo9T9OwQ84leb4q/bd9aODGcaIrdjoihosbnMEgJgg=;
    b=b/yw20jhe7smdwIxJyanrG4NulJQYCmVhRdcaT8D+kNOKqH0mM9/1awhycxt4+6aPh
    uPlnXHSmaEifIjPyPWIP5HAdyZSNugZWADzy99/FfMXzBSzf9ODYcd3MkKWuZ8eclMwS
    4b12meVUtZX8V6V6KFUG7dpocW+FLOIhSiNl44Y3g43p7th6zXrQdFYrN2orsPk1S8ue
    CAzbCrHqYvs4c5HuCY0aDj57ylnQ+uqJsrglu3wC4ltD3qqqRhvrWTHSJDazUkJTC35c
    s4kQ2rtvPD4dqEsElgIAq4tcXskQHr7w8/veZEE1fBnUfKbKc8SIGXhh3PAKP4D8pYfs
    ns6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792862336;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=GKo9T9OwQ84leb4q/bd9aODGcaIrdjoihosbnMEgJgg=;
    b=cUqmgugElN3TIAyT1U1gl6OCQrU6j/rjpDJoX0bW6fQAMyrdftDDijcMGfn+ePf1TK
    TaHOiLnXZyggXAotXjBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKzsiNzptYNlV1C1yk7253raiyx+O3Hxli"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229OHIuwq1
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 24 Oct 2026 19:18:56 +0200 (CEST)
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
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Add an X1600 group for 18-bit RGB
 on the top lines
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261023204207.48277-2-olivier@mgcrea.io>
Date: Sat, 24 Oct 2026 19:18:26 +0200
Cc: Linus Walleij <linusw@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <311BC431-1F73-4C07-B3FE-A908E3BD9263@goldelico.com>
References: <20261023204207.48277-1-olivier@mgcrea.io>
 <20261023204207.48277-2-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 23.10.2026 um 22:42 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> Boards that wire an 18-bit panel to the six most significant lines of
> each colour leave PA0, PA1, PA8, PA9, PA16 and PA17 free for other =
uses,
> which the cumulative lcd-16bit and lcd-18bit groups would take. Add
> "lcd-18bit-msb" for that wiring.
>=20
> Used on a HiBy R1, which drives its panel this way and uses PA0, PA1,
> PA16 and PA17 as GPIOs.
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> drivers/pinctrl/pinctrl-ingenic.c | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-ingenic.c
> index 28e7f1852054..8c424db27fd5 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2442,6 +2442,17 @@ static int x1600_lcd_24bit_pins[] =3D {
> 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
> };
>=20
> +/*
> + * 18-bit RGB on the six most significant lines of each colour of the =
24-bit
> + * bus, with the clock, data enable and syncs.
> + */
> +static int x1600_lcd_18bit_msb_pins[] =3D {
> + 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> + 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
> + 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
> + 0x18, 0x19, 0x1a, 0x1b,
> +};

I just wonder if you can't get this by combining some existing partial =
pinctrl,
e.g something with lcd-16bit and lcd-18bit?

But there is no good overlap with existing settings to achieve this.

> +
> static int x1600_pwm_pwm0_pins[] =3D { 0x40, };
> static int x1600_pwm_pwm1_pins[] =3D { 0x41, };
> static int x1600_pwm_pwm2_pins[] =3D { 0x42, };
> @@ -2503,6 +2514,7 @@ static const struct group_desc x1600_groups[] =3D =
{
> INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
> INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
> INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
> + INGENIC_PIN_GROUP("lcd-18bit-msb", x1600_lcd_18bit_msb, 0),
> INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
> INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
> INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
> @@ -2549,7 +2561,7 @@ static const char * const x1600_i2s_groups[] =3D =
{
> static const char * const x1600_cim_groups[] =3D { "cim-data", };
>=20
> static const char * const x1600_lcd_groups[] =3D { "slcd-8bit", =
"slcd-16bit",
> - "lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
> + "lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-18bit-msb", =
"lcd-no-pins",
> };
>=20
> static const char * const x1600_pwm0_groups[] =3D { "pwm0", };
> --=20
> 2.39.5
>=20
>=20

Reviewed-By: H. Nikolaus Schaller <hns@goldelico.com>

