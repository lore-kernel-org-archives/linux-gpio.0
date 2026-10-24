Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792862667;
	b=UYl9dNlqZYC9HRuH/tHwZgUR0koCe7vpkz18NyGOpLYpZj3jovTwPg3jY+nM394XgVoo
	 f+OnGvk7n+BL6qu14Ip4dezrFH90BvBUeh1KG5rxDJLlhiz06l8NrRa7ZPl8UctwKAaDc
	 ueTE1sHSx/1yGt29vYsseRkoQ+7OjzTtP8QnxlPsSXrCTyghWnNeZTiNmguvLnvbKlr7j
	 VgOJ3tP6F1vbppEIjBKFnxSTxYLs2knJ3+Jn+r798WDuEZLERjexoYeQa3QMg+BPDHj5S
	 5IXTKb9hMRxcDmbaAudd/loIDFgVYKitjrLq1A+xijbWq6XkjKrgzEkgK4nnMYACvDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862667;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=NyHZ1WoLFJCbwQ2arInuj/P7au0hCeBBoItzKYMGoJc=;
	b=IigrCUDopebSbquHB9zRUxK/qu9paNDG4/ZO5H0j5nm9VEpwDcMAaAa8tKkMROBdTQk4
	 DuvY53LY5psLwvEmvt/1fRlf5rvXQv9oErbnl+pkgsf1hJkGtdkIXITMtKNtqEG+ON4gz
	 wzPXgfbUm5cYBiQ59wJd/QuMkBLYdl8fTGndzafN3P/ts4Nm5uTlbyugTUpzlSmfkBlYE
	 XxUkciWtkB53ZB9G0SoUtSS1+Hk/nMoAoCBdNl3SOetYA3uHPUNqgxoGeSbgP/pwUhf67
	 9ciMq9pC1NcClibKEmR7+YP+k3FVdrnv09fJ9XFf44IsmpxLUJvZaG25j+Q4nPZlexg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i9TSvpbd;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=SPOQVknT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.168
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149D606A325;
	Sat, 24 Oct 2026 17:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D149D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i9TSvpbd;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=SPOQVknT
ARC-Seal: i=1; a=rsa-sha256; t=1792862649; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jWrDuyazXjEy4vkpfI7W4/MDGM7AShl+mzr/jFNHg10kTrf3CE51oBMLp2hoXusWcZ
    VAI+ZNw/HLCs5gBMXS3q1D+0IGNdcJhDd1VIQjMGSXs2gyMK3s4pNxQ5i/pyyzL+Y/mb
    MNs+qOldJdnsuwRfl7spt93x3GQuxu0YxqpwKmea9jo+n8dYDv15p8ZBtJqKnfw1q050
    r4IaER/JhYz5izunecNTHgJwCIZKDpauWNQxOw/kGRPOei6DIL8TnhQ6C0B3a71A5U9v
    pHIRzy5QoI8TUQGP9S/WW4BgKKVHq1M3n8YgOFGZWoR9eYOcduSfGtSu5pGGUOnH10wr
    tfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862649;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NyHZ1WoLFJCbwQ2arInuj/P7au0hCeBBoItzKYMGoJc=;
    b=Q+v2/y48Y3avZwrJBRPVcOFdHMCJ4vCjgFYZfoXfhCPRtEDJmUT3HZetjT4k+ZRcbs
    8CCEkIagJepUJed9dCRnjgrr3ZdynI8tpaOAoiENlQE8PrUPVWIm6/87CnWR3KEFb8W4
    3UJA56o2DjroCzAVDMNXT4L7NZrzRG4t0AseRyBmrPD3NpEDLYPT5EMHuks07p+ACsxX
    YWug/O0t9Ne4CkwYHAms/QB92Z3gCPJQWCPZ7JWCa3eJKYps0zqzWburvSaZAT4gbZ3D
    NM7wNKfic/nS0wFRaBdpa2+2C5AH6wfagS/kbMvFVANft1/1aoUwNQGxVn6jwGw5XKph
    v4nA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792862649;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NyHZ1WoLFJCbwQ2arInuj/P7au0hCeBBoItzKYMGoJc=;
    b=i9TSvpbd37gE6jfegnD3Z3erHiN4OvPF6zipTyh3t0onAFd2DBlYLbxirUZuZXB8HK
    GGSlTbP18AoUJ1sxrvUovIeyDORgYMOIDGYXDF+GvbjUWMoPrXPp3C/gQz5aX66jBi6x
    223wBrhSYhkL1W312PIIiYF/hDakgfXpjhC/zIImxobagaZw9QciRrvjxMjWB6Yjg2K2
    HU+/r1jth9RCxBPhQ71y2NIabF404jRQwLTvSIeK2NYscY8CQh3INCrl193arnbhN5JC
    +muAhJIBkoMEZSFQhh8pfNfCxLywZA6QKbYA9ihpwOPDnYlZFCe7avCFRhTxIzgy93c5
    mbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792862649;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=NyHZ1WoLFJCbwQ2arInuj/P7au0hCeBBoItzKYMGoJc=;
    b=SPOQVknTUWL1nHVOqPBECoNFNFh1C/+eyHbPha2FX1ExbuVj8eLHIwnsCfupEHDvpZ
    qillqK50DC8jlW09F8Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV2poKzsiNzptYNlV1C1yk7253raiyx+O3Hxli"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229OHO8wqQ
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 24 Oct 2026 19:24:08 +0200 (CEST)
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
Subject: Re: [PATCH] pinctrl: ingenic: Add the X1600's 32 kHz clock output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261024051639.67806-1-olivier@mgcrea.io>
Date: Sat, 24 Oct 2026 19:23:38 +0200
Cc: Linus Walleij <linusw@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Andreas Kemnade <akemnade@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <51688C86-1907-4B89-8A65-2A90D4B59261@goldelico.com>
References: <20261024051639.67806-1-olivier@mgcrea.io>
To: Olivier Louvignes <olivier@mgcrea.io>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 24.10.2026 um 07:16 schrieb Olivier Louvignes <olivier@mgcrea.io>:
>=20
> PC26's function 0 puts out the RTC's 32 kHz clock. The vendor device
> tree calls that pin setting "rtc32k-enable" (function 5 is its
> "rtc32k-disable"). Add an "rtc32k" group and function for it.
>=20
> Used on a HiBy R1, whose Bluetooth chip takes it as its sleep clock: =
on
> a cold boot without it the chip does not answer its reset, with it the
> chip comes up. The clock on the pin was not measured.
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> drivers/pinctrl/pinctrl-ingenic.c | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c =
b/drivers/pinctrl/pinctrl-ingenic.c
> index 1aa6a6dc1209..ac6e2a152bdd 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2452,6 +2452,7 @@ static int x1600_pwm_pwm6_b20_pins[] =3D { 0x34, =
};
> static int x1600_pwm_pwm7_b10_pins[] =3D { 0x2a, };
> static int x1600_pwm_pwm7_b21_pins[] =3D { 0x35, };
>=20
> +static int x1600_rtc32k_pins[] =3D { 0x5a, };

Yes, is PC26.

> static int x1600_mac_pins[] =3D {
> 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
> };
> @@ -2511,6 +2512,7 @@ static const struct group_desc x1600_groups[] =3D =
{
> INGENIC_PIN_GROUP("pwm7-b10", x1600_pwm_pwm7_b10, 1),
> INGENIC_PIN_GROUP("pwm7-b21", x1600_pwm_pwm7_b21, 2),
> INGENIC_PIN_GROUP("mac", x1600_mac, 1),
> + INGENIC_PIN_GROUP("rtc32k", x1600_rtc32k, 0),

Yes, it is on Function 0.

> };
>=20
> static const char * const x1600_uart0_groups[] =3D { "uart0-data", =
"uart0-hwflow", };
> @@ -2557,6 +2559,7 @@ static const char * const x1600_pwm6_groups[] =3D =
{ "pwm6-b9", "pwm6-b20", };
> static const char * const x1600_pwm7_groups[] =3D { "pwm7-b10", =
"pwm7-b21", };
>=20
> static const char * const x1600_mac_groups[] =3D { "mac", };
> +static const char * const x1600_rtc32k_groups[] =3D { "rtc32k", };
>=20
> static const struct pinfunction x1600_functions[] =3D {
> INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
> @@ -2581,6 +2584,7 @@ static const struct pinfunction =
x1600_functions[] =3D {
> INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
> INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
> INGENIC_PIN_FUNCTION("mac", x1600_mac),
> + INGENIC_PIN_FUNCTION("rtc32k", x1600_rtc32k),
> };
>=20
> static const struct ingenic_chip_info x1600_chip_info =3D {
>=20
> base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
> --=20
> 2.39.5
>=20
>=20

Reviewed-By: H. Nikolaus Schaller <hns@goldelico.com>


