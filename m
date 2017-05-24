From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC] pinctrl: sh-pfc: propagate errors on group config
Date: Wed, 24 May 2017 14:21:39 +0200
Message-ID: <20170524122139.GB1463@katana>
References: <1466404822-2540-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXWwZaCoLz8TTLBVg8qmKpiw0wKGUawd6ti0wg3X5e6xA@mail.gmail.com>
 <CAMuHMdWghZYQ+Mx-AMsu3yERNwChz4xXHKs3D5fshnG5trLMbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWghZYQ+Mx-AMsu3yERNwChz4xXHKs3D5fshnG5trLMbg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> This is caused by the "output-high" property for the GPIO hog.
> Due to both lcd0 pinmux and GPIO hog being part of the same device node,
> "output-high" is also applied to the lcd0 pins, which fails.
>=20
> RFC fix in "[PATCH/RFC] ARM: dts: armadillo800eva: Split LCD mux and gpio"
> (https://patchwork.kernel.org/patch/9745831/)/

Cool, thanks! So, if this issue could get resolved, there are chances to
revive the original patch?

Regards,

   Wolfram


--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlkletMACgkQFA3kzBSg
Kbb9/w/+PrTBxjRHSo8558U/bGcCXpMLmZtwgLEtZoIN4M5kJQHfgF1Xk15k4fhC
7HPCfnDOw7jXqlgbWKeo0g4SnE7NE7SD8gKl0fFjEbZZRGWbUTUiSLBxxtHu/7qB
C2Sjt8fYt8bnbFfBRpc0jgCAcU3Ib9IzdrMV4AYEe+gjz3DN4u9XfkGZR7AfPPE6
xi2/Qeo+GGWqPyZOsrHAn2fGHJg7gChbiEFAEjJUKtdSg7eBnL4IVhAHl+E70mSA
4TKSVVDqdVHzNN7US5xZrN8So0cmJgknJqXuH/RGxbGVZE4bRgNoISxwgaCcCYHF
kVL98vip51os6vt7+x8ZpV1lygAdL5KiPRjEqSRHzfaKYgQjUAy5WR9qeQVyOeIE
HJ9q6qCWEb5v8ETXm6LnJ7M5pH1tDQW1oLP2kENIANGW8bxWapx9K9Ne5Z0Azme0
AiLkeLKOWs+Vdoa5MskDPSh+YXO/szMMVdpfYlvuSc337ZE8ncn4dIH5TgkGOc+3
9vX7zXtoKvgDK+FjFkaiHltFwJkdWK4ULd1lPsuXc8uw54XpPAWY70hoUo4Yc9mP
HQcKqyi9HuXNji/aUFwrLOeabsS06M1uA7CnMz/PcpOvQmHlz3Cm+zywHVIsJ9zq
S1dHHM5cZR53/Hqt22zFIRfnCSNaGxOX+09eY3H4C7kxNCWqCJQ=
=2FJP
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
