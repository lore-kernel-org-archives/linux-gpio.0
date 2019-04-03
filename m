From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/6] gpio: Set proper argument value to set_config
Date: Wed, 3 Apr 2019 20:36:44 +0200
Message-ID: <20190403183644.b25rlkxgquw2aqny@flea>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
 <b9ed544722175ea00b1f6ecb29ca5c3e1322239f.1552591798.git-series.maxime.ripard@bootlin.com>
 <CACRpkdaRofnaN5RMqRyyAakngyCWBKQX8+y32SESiwvVxbFyOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1946750626100144879=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaRofnaN5RMqRyyAakngyCWBKQX8+y32SESiwvVxbFyOA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org


--===============1946750626100144879==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xzcfhjrw3mhb4ztv"
Content-Disposition: inline


--xzcfhjrw3mhb4ztv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

On Wed, Apr 03, 2019 at 11:41:02PM +0700, Linus Walleij wrote:
> On Fri, Mar 15, 2019 at 2:33 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> > The gpio_set_config function creates a pinconf configuration for a given
> > pinc_config_param.
> >
> > However, it always uses an arg of 0, which might not be a valid argument
> > for a given param. A good example of that would be the bias parameters,
> > where 0 means that the pull up or down resistor is null, and the pin is
> > directly connected to VCC/GND.
> >
> > The framework uses in some other places the value 1 as a default argument
> > to enable the pull resistor, so let's use the same one here.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Patch applied to the GPIO tree, I suppose I can merge it there
> orthogonally to the other patches (the result will be fine).

Yeah, the only drawback I can see is that the configuration will be
rejected, but since it's going to be merged in fixes, the case where
we have the driver patches but not that one seems pretty unlikely.

We have a lot going through our tree for the next release though, so
ideally we should merge the DT patches through arm-soc.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--xzcfhjrw3mhb4ztv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKT9PAAKCRDj7w1vZxhR
xcHFAP4vu4p3UO+zfOA/jHxHN1yFkMq7Uf6RazHs6Qfs4/l3zQD8CnB/TVXMhTeT
TTwxfNIF/T2X3kNrEhz0kKViBz6fEAs=
=m/Gq
-----END PGP SIGNATURE-----

--xzcfhjrw3mhb4ztv--


--===============1946750626100144879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1946750626100144879==--
