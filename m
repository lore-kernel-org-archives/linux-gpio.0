From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [gpio:devel 12/12]
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct
 gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Mon, 16 Oct 2017 10:08:21 +0200
Message-ID: <20171016080821.GC17369@ulmo>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
 <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
 <20171016080502.GB17369@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:44689 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdJPIIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 04:08:25 -0400
Received: by mail-qk0-f195.google.com with SMTP id r64so11795488qkc.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 01:08:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171016080502.GB17369@ulmo>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 10:05:02AM +0200, Thierry Reding wrote:
> On Sun, Oct 15, 2017 at 04:21:14PM +0200, Linus Walleij wrote:
> > Grygorii, can you look at this?
> >=20
> > Linus
> >=20
> > On Sun, Oct 15, 2017 at 3:52 AM, kbuild test robot
> > <fengguang.wu@intel.com> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-=
gpio.git devel
> > > head:   be58c675d634e0b91edc0f721c77303ac2afa809
> > > commit: be58c675d634e0b91edc0f721c77303ac2afa809 [12/12] gpiolib: dro=
p irq_base field from gpio_chip struct
> > > config: arm64-defconfig (attached as .config)
> > > compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         git checkout be58c675d634e0b91edc0f721c77303ac2afa809
> > >         # save the attached .config to linux build tree
> > >         make.cross ARCH=3Darm64
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    drivers/pinctrl/mvebu/pinctrl-armada-37xx.c: In function 'armada_3=
7xx_irq_startup':
> > >>> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct =
gpio_chip' has no member named 'irq_base'; did you mean 'base'?
> > >      int irq =3D d->hwirq - chip->irq_base;
>=20
> This looks like something you'd get if you merge my struct
> gpio_irq_chip patches. However, the patch in my series will do the
> conversion of the pinctrl-armada-37xx driver:
>=20
> --- >8 ---
> $ git log -p -- drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> commit 96e359456c942969fc3f0faa277fb27d1a830692
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Mon Apr 3 11:40:03 2017 +0200
>=20
>     gpio: Move irq_base to struct gpio_irq_chip
>=20
>     In order to consolidate the multiple ways to associate an IRQ chip wi=
th
>     a GPIO chip, move more fields into the new struct gpio_irq_chip.
>=20
>     Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctr=
l/mvebu/pinctrl-armada-37xx.c
> index c9851bd120b4..500238d898ea 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -627,7 +627,7 @@ static void armada_37xx_irq_handler(struct irq_desc *=
desc)
>  static unsigned int armada_37xx_irq_startup(struct irq_data *d)
>  {
>         struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
> -       int irq =3D d->hwirq - chip->irq_base;
> +       int irq =3D d->hwirq - chip->irq.first;
>         /*
>          * The mask field is a "precomputed bitmask for accessing the
>          * chip registers" which was introduced for the generic

Nevermind, I see there is now yet another conflict that would require
yet another rebase of that series.

Thierry

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnkaPUACgkQ3SOs138+
s6E+DBAAkh5W7W33NIUnDjTi2pVzPHttHUnwV/86mgW8xGrpKLQ7zIO6tCjgauMH
SluPZUqPLEq+kNfpUxw80pCQIpP0ORroQ2oYg7sfHujxNpfwvTcntT85i4GVw3o8
EVTsbVrWSkA9rFZ01SQ+6HNnBKwpIgLuSa0xwuTeqT679Hu8wPIjGlcMJiE7ZEYw
kBucnBhMIISvvdDUStJka5paSE0vkpBB5HVWIOP1DIiEY0m1FyoB9XjFSGkrAcEc
lzEzHvlBP0ltTmR+GnfTjmwjJxPTFOYSJd30h95lgEClFkBGoSp+3jJLyKO3/d87
jyMBWeUGmZIyHg6zO0ICVbynewwbgHv55/pYV8vIwmeZNmB+edJyDgKPNGUNMPu6
7Z5YYhtuajGG/Zgga0ns/wKZAtBpYju5i/gpDEHPhom23Rf3dSgPfBs6nr6cHk6R
iMXANEf4vDz4PtQZCQgoafRF2ViUU+mfAtw+ftAFJy7jQ99tNoZKj06SXxGV/5lx
Pv+hAeWmMDGJNCYZ7dnKgOSlhMjBxv7EeNDsKmbhlTob97IbWyfdopAhl6RO6IGZ
NSPVttQXF6Yt1qQ6bV2/+Wvza88xAsRMp1+GZTYfzkalqpDqu35T9Z3gq2Je0Gop
5Hq2+RElIg/7YBQJ8hEbxhtv+S5hNGy3la6EiPR2qm2AsYdXrhU=
=2cHQ
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
