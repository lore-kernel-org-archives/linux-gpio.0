From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/6] pinctrl: sunxi: Allow to configure pull-up /
 pull-down from GPIO flags
Date: Thu, 4 Apr 2019 09:26:24 +0200
Message-ID: <20190404072624.4r3ulls7urph3ocr@flea>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6917365538230700662=="
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


--===============6917365538230700662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nbo3vi5ibs7y7xfk"
Content-Disposition: inline


--nbo3vi5ibs7y7xfk
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
>
> Let me know what you think,
> Maxime

Applied 5 and 6, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nbo3vi5ibs7y7xfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKWxoAAKCRDj7w1vZxhR
xVCJAPwKGhRn8DHEK4zV3So6Eoc1nQ1veL33/Gd8MH2yrP9OEAD+LCEUet9UoeTO
RmfOcuLIMNpHeHmiFAM5ixxU4kz6BQU=
=Le8s
-----END PGP SIGNATURE-----

--nbo3vi5ibs7y7xfk--


--===============6917365538230700662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6917365538230700662==--
