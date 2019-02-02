From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20190201 build: 2 failures 19 warnings (next-20190201)
Date: Sat, 2 Feb 2019 15:39:54 +0000
Message-ID: <20190202153954.GK20797@sirena.org.uk>
References: <E1gpgTf-0002ZN-NF@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2372484514746747843=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gpgTf-0002ZN-NF@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Masney <masneyb@onstation.org>, Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--===============2372484514746747843==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+HmK7y6O+lKZIGkr"
Content-Disposition: inline


--+HmK7y6O+lKZIGkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 09:35:59PM +0000, Build bot for Mark Brown wrote:

Friday's -next fails to build an arm64 allmodconfig due to (among other
things):

> 	arm64-allmodconfig
> ERROR: "irq_chip_set_wake_parent" [drivers/pinctrl/qcom/pinctrl-spmi-gpio=
=2Eko] undefined!

due to ca69e2d165eb3d060cc9 (qcom: spmi-gpio: add support for
hierarchical IRQ chip) as the driver can be built as a module but the
above symbol is not exported. =20

--+HmK7y6O+lKZIGkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxVucYACgkQJNaLcl1U
h9Ap4Qf/Z35JMYW6BS61H0kHt826Qfnh7yMwv8szJtscn2QX/dM31wESH3VYpTNw
kn7lax8Vh+8I/A+1paCYhFen1M6nMHLdSBG0SRsNyjmTOg8T7tczrfvmONl5QBZ8
LgDbhA0xnTxAP9m6lAoSS8mrm2JJf1o3HnI4iS8FHW7ZlCQSKmZlR4GxdbTCAX+3
11BDRz3G+mQ3yv2haAfBPlXH5eXnQSOphqOD1ZHlRaOPppRMXigYAVIeNVN3axsP
9c3qbOOvM85OpO6o/OE7Kog5HVSqTK9+mYbdp9KVlIbnUByQlC81TVSSfyWZWYcY
bIHaYHfXVUdogmchPweF14hyuPFnvw==
=3yvP
-----END PGP SIGNATURE-----

--+HmK7y6O+lKZIGkr--


--===============2372484514746747843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2372484514746747843==--
