From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/6] pinctrl: sunxi: Allow to configure pull-up /
 pull-down from GPIO flags
Date: Tue, 2 Apr 2019 15:22:16 +0200
Message-ID: <20190402132216.fvgb7vbqltmwazow@flea>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4524896782894925797=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org


--===============4524896782894925797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="btodf4w36fv3p43l"
Content-Disposition: inline


--btodf4w36fv3p43l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 14, 2019 at 08:32:49PM +0100, Maxime Ripard wrote:
> Hi,
>
> Here is a series that addresses one of the issues we've had for some time
> with our pinctrl driver, which is that while we should have had the strict
> mode enabled, we didn't and now we have to deal with all the DT having GPIO
> and pinctrl nodes for the same pins.
>
> This was partially due to cargo cult (which has been addressed since), but
> also due to technical limitations of the GPIO DT bindings at the time which
> didn't allow to specify the pull-up and pull-down resistors, and the drive
> strength of the pins.
>
> Now that the former are supported, we can remove those users, and we will
> deal with the latter eventually.

Ping?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--btodf4w36fv3p43l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKNiCAAKCRDj7w1vZxhR
xU3PAQDKCPfgGlC+stzKmrggWBKUWXsyQAFYTri3pggvuN82fQEA1l16THV3915T
GJleCja6AsKEXg+4Pf9VYH/3hYSwQA8=
=V18p
-----END PGP SIGNATURE-----

--btodf4w36fv3p43l--


--===============4524896782894925797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4524896782894925797==--
