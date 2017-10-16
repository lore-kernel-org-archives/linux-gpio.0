From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [gpio:devel 12/12]
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct
 gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Mon, 16 Oct 2017 10:05:02 +0200
Message-ID: <20171016080502.GB17369@ulmo>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
 <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:55163 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbdJPIFF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 04:05:05 -0400
Received: by mail-qk0-f195.google.com with SMTP id n5so11773790qke.11
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 01:05:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2017 at 04:21:14PM +0200, Linus Walleij wrote:
> Grygorii, can you look at this?
>=20
> Linus
>=20
> On Sun, Oct 15, 2017 at 3:52 AM, kbuild test robot
> <fengguang.wu@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git devel
> > head:   be58c675d634e0b91edc0f721c77303ac2afa809
> > commit: be58c675d634e0b91edc0f721c77303ac2afa809 [12/12] gpiolib: drop =
irq_base field from gpio_chip struct
> > config: arm64-defconfig (attached as .config)
> > compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout be58c675d634e0b91edc0f721c77303ac2afa809
> >         # save the attached .config to linux build tree
> >         make.cross ARCH=3Darm64
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/pinctrl/mvebu/pinctrl-armada-37xx.c: In function 'armada_37x=
x_irq_startup':
> >>> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct gp=
io_chip' has no member named 'irq_base'; did you mean 'base'?
> >      int irq =3D d->hwirq - chip->irq_base;

This looks like something you'd get if you merge my struct
gpio_irq_chip patches. However, the patch in my series will do the
conversion of the pinctrl-armada-37xx driver:

--- >8 ---
$ git log -p -- drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
commit 96e359456c942969fc3f0faa277fb27d1a830692
Author: Thierry Reding <treding@nvidia.com>
Date:   Mon Apr 3 11:40:03 2017 +0200

    gpio: Move irq_base to struct gpio_irq_chip

    In order to consolidate the multiple ways to associate an IRQ chip with
    a GPIO chip, move more fields into the new struct gpio_irq_chip.

    Signed-off-by: Thierry Reding <treding@nvidia.com>

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/=
mvebu/pinctrl-armada-37xx.c
index c9851bd120b4..500238d898ea 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -627,7 +627,7 @@ static void armada_37xx_irq_handler(struct irq_desc *de=
sc)
 static unsigned int armada_37xx_irq_startup(struct irq_data *d)
 {
        struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
-       int irq =3D d->hwirq - chip->irq_base;
+       int irq =3D d->hwirq - chip->irq.first;
        /*
         * The mask field is a "precomputed bitmask for accessing the
         * chip registers" which was introduced for the generic

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnkaC4ACgkQ3SOs138+
s6F5mxAAmyADZw0SX9WmM5rhugFP8T4DJ6MeQWDhwgcg11aYgAP2w8n4lmWcrgSy
VNvBDv52lkRDvJhzBFMmrDOeOpClCYI7pMbIgDBB9NQ66QlUb1Ws7+2Blz+RoapR
VnXBDMuoxEd4AU1JQjRA7lF/G01r+W/ByFWG3pEl/sOfqbsIGOfdJ89UxHA/yORQ
kvx9HJcwy8sVIvfT2i4Q50ttv8oecfBTqJloMsTrrgiPEGk1+OwXXq3mF8m+Es6Q
zf7iZBQO04Mjr8QfBf4Ow7v3ThKdzQ7Bhv1O3hx/XwgyxjWwB6O+Y5wAgMZ5EtAU
946r3GEutKp9E1N7DPch00dppWIb5HMOaWzsJP404Dw6tl4c4kbhdY5eZEDv0Vew
TiYdaRcEEmE4eTv7A98KwKk2D+hssgb2L02C+qRjE3bZVNH3rRopRL+IJ9r5+CcK
hwu4NTFEpjUKC5bZ3dYUZabh1Q0P4TZE+xc1Z4vi8Bmt1hNc1xNMLDbf2/RodxE0
AmQzTR76tqeYhXMv6JHHFKEWh0J9w7rhuix5KrUt56MhwoSZwUpvq3JiBoep5jcg
TExD+t/2NWebuh8g3F5D8tITDgwhFFyxWgNmz3hdXe1oRvtN4gnCanjwgN73Jm8v
rIfsrk5C4Uu3NdtIC/BKFJ9zZvHbNz61MZr8Ue5kX/uDurQVlvE=
=YVbU
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
