From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Allow to disable pinctrl drivers
Date: Tue, 2 Apr 2019 15:22:31 +0200
Message-ID: <20190402132231.nhussn4xb75ytkdk@flea>
References: <20190319144203.23467-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8650219643713351825=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319144203.23467-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--===============8650219643713351825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t7jxdvh7dptk2ocw"
Content-Disposition: inline


--t7jxdvh7dptk2ocw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2019 at 03:42:03PM +0100, Maxime Ripard wrote:
> Our pinctrl drivers are consisting of some common code, and big pin tables
> that are SoC-specific. This is fine in most cases, but when you want to
> reduce the size of the particular kernel image, those big tables are, well,
> quite big.
>
> We haven't had the option to disable them in the past since they were
> hidden Kconfig options based on the SoC support. However, that granularity
> isn't great since we don't have one Kconfig option per-SoC, but rather one
> by family.
>
> Make those options selectable by the user so that they can disable it if
> needed, while keeping the current default to not change the standard case.
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Ping?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--t7jxdvh7dptk2ocw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKNiFwAKCRDj7w1vZxhR
xSMoAP4gb3urGa92GMQFoOrwMv6Ky/w59f3mlb8pumM1FTeRJwD9FE7wNSJc/xuo
ivhZ0fbI+lWGDN+yhqJz6RLZYO4qTww=
=0j4x
-----END PGP SIGNATURE-----

--t7jxdvh7dptk2ocw--


--===============8650219643713351825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8650219643713351825==--
