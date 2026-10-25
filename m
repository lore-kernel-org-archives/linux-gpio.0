Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792968006;
	b=eg9JhcPuVv21phBUQQPzKid3sXmgjyM3+TGm4ULeUNQbBzFh5z8nxykrZmYk0cVqqNqc
	 awjTzDWseubhUnrKotEDAxL/XE2fn4KtfqeprdMG5l0HwdFb2sagjJYO6Pk1EOSeiRCQ5
	 nwOqmdB6AnmMFOVMR7beIdw8Lr3ufDxgeSs60iJ1VI0HNsVzH/1aPbrIPJ91bzEsSiVNr
	 Y3YtqqhqezGHNT1CrxVvXbymd+iLF14lbRmdOQpiaXse5q5ghvFzrzrjM484RDcIOlbnM
	 sYQ6OjaiGnTx6QOmafHwX0rUrKjKam8FKFzNE0BrL1gMD0A3v0isG1wUBMS7tRo7A0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792968006;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=BJFlHkjzZQkuZb2sYnE2Rmc5JG9Cgv9xdtkzLLy01dM=;
	b=Bb7sSQDgXflGC4tBBxADBSJWNEvSz0Xm+YdNGA4DuVPdnkriezjPtZR+Xm3E/Cr27o7F
	 r/yTOQXP//Qtc6fYWk+Am/7/eb9qNYkpc09jAjbBHwx8Dw8veKw7zF1KB0CZzIrgPMESB
	 tz4TpA+1TxB5tMP8P1x6cBsPf0a35UiynICqLX1XgDF9EVTeJLwJzKIXmWOryCOrQHJ6i
	 M4JPA1d7SEw0Bt5XCh56/khUKvyCi0Qjl81NNhoBuYgLnJOPuuSXSmp7OYbEBy0y9Bq3i
	 LKEUqUt2WUti9sTLTxzm8ZnfsofU49fx634KoXwXqIHcivAh58UfFiT/zQ5C5iTvpkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F09F606A31A;
	Sun, 25 Oct 2026 22:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F09F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <d14f055275701e9ff4cb024a9d2389de4a0014ef.camel@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Add the X1600's 32 kHz clock output
From: Paul Cercueil <paul@crapouillou.net>
To: Olivier Louvignes <olivier@mgcrea.io>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 25 Oct 2026 23:39:59 +0100
In-Reply-To: <20261024051639.67806-1-olivier@mgcrea.io>
References: <20261024051639.67806-1-olivier@mgcrea.io>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Olivier,

Le samedi 24 octobre 2026 =C3=A0 07:16 +0200, Olivier Louvignes a =C3=A9cri=
t=C2=A0:
> PC26's function 0 puts out the RTC's 32 kHz clock. The vendor device
> tree calls that pin setting "rtc32k-enable" (function 5 is its
> "rtc32k-disable"). Add an "rtc32k" group and function for it.
>=20
> Used on a HiBy R1, whose Bluetooth chip takes it as its sleep clock:
> on
> a cold boot without it the chip does not answer its reset, with it
> the
> chip comes up. The clock on the pin was not measured.
>=20
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

You're making two patch series in parallel to the same driver, that
both add pin groups for the JZ4760? Next time consider grouping them
into the same series.

Anyway, this patch looks OK.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 1aa6a6dc1209..ac6e2a152bdd 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -2452,6 +2452,7 @@ static int x1600_pwm_pwm6_b20_pins[] =3D { 0x34,
> };
> =C2=A0static int x1600_pwm_pwm7_b10_pins[] =3D { 0x2a, };
> =C2=A0static int x1600_pwm_pwm7_b21_pins[] =3D { 0x35, };
> =C2=A0
> +static int x1600_rtc32k_pins[] =3D { 0x5a, };
> =C2=A0static int x1600_mac_pins[] =3D {
> =C2=A0	0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
> =C2=A0};
> @@ -2511,6 +2512,7 @@ static const struct group_desc x1600_groups[] =3D
> {
> =C2=A0	INGENIC_PIN_GROUP("pwm7-b10", x1600_pwm_pwm7_b10, 1),
> =C2=A0	INGENIC_PIN_GROUP("pwm7-b21", x1600_pwm_pwm7_b21, 2),
> =C2=A0	INGENIC_PIN_GROUP("mac", x1600_mac, 1),
> +	INGENIC_PIN_GROUP("rtc32k", x1600_rtc32k, 0),
> =C2=A0};
> =C2=A0
> =C2=A0static const char * const x1600_uart0_groups[] =3D { "uart0-data",
> "uart0-hwflow", };
> @@ -2557,6 +2559,7 @@ static const char * const x1600_pwm6_groups[] =3D
> { "pwm6-b9", "pwm6-b20", };
> =C2=A0static const char * const x1600_pwm7_groups[] =3D { "pwm7-b10", "pw=
m7-
> b21", };
> =C2=A0
> =C2=A0static const char * const x1600_mac_groups[] =3D { "mac", };
> +static const char * const x1600_rtc32k_groups[] =3D { "rtc32k", };
> =C2=A0
> =C2=A0static const struct pinfunction x1600_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
> @@ -2581,6 +2584,7 @@ static const struct pinfunction
> x1600_functions[] =3D {
> =C2=A0	INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
> =C2=A0	INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
> =C2=A0	INGENIC_PIN_FUNCTION("mac", x1600_mac),
> +	INGENIC_PIN_FUNCTION("rtc32k", x1600_rtc32k),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ingenic_chip_info x1600_chip_info =3D {
>=20
> base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
