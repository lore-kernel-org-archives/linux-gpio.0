From: Thierry Reding <treding@nvidia.com>
Subject: Re: [pinctrl:devel 152/153] drivers/gpio/gpiolib.c:1942:19: error:
 conflicting types for 'gpiochip_add_irqchip'
Date: Wed, 8 Nov 2017 16:04:16 +0100
Message-ID: <20171108150416.GA827@ulmo>
References: <201711082210.wr6yyeS7%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14633 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751370AbdKHPEW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2017 10:04:22 -0500
In-Reply-To: <201711082210.wr6yyeS7%fengguang.wu@intel.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 10:43:12PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinc=
trl.git devel
> head:   bfcadc85ef134881fce5f8635648e36de1ab4c9d
> commit: 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40 [152/153] gpio: Automati=
cally add lockdep keys
> config: x86_64-acpi-redef (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         git checkout 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64=20
>=20
> All error/warnings (new ones prefixed by >>):
>=20
> >> drivers/gpio/gpiolib.c:1943:19: warning: 'struct lock_dep_class' decla=
red inside parameter list will not be visible outside of this definition or=
 declaration
>                struct lock_dep_class *lock_key)
>                       ^~~~~~~~~~~~~~
> >> drivers/gpio/gpiolib.c:1942:19: error: conflicting types for 'gpiochip=
_add_irqchip'
>     static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
>                       ^~~~~~~~~~~~~~~~~~~~
>    drivers/gpio/gpiolib.c:75:12: note: previous declaration of 'gpiochip_=
add_irqchip' was here
>     static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
>                ^~~~~~~~~~~~~~~~~~~~
> >> drivers/gpio/gpiolib.c:75:12: warning: 'gpiochip_add_irqchip' used but=
 never defined
>=20
> vim +/gpiochip_add_irqchip +1942 drivers/gpio/gpiolib.c
>=20
>   1941=09
> > 1942	static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
> > 1943					       struct lock_dep_class *lock_key)
>   1944	{
>   1945		return 0;
>   1946	}
>   1947=09

Hi Linus,

this should be fixed with the following patch. It can just be squashed
into the lockdep keys patch.

Thierry
--- >8 ---
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2b37f1e2ca76..6d9f225ed861 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1940,7 +1940,7 @@ EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
 #else /* CONFIG_GPIOLIB_IRQCHIP */

 static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
-                                      struct lock_dep_class *lock_key)
+                                      struct lock_class_key *lock_key)
 {
        return 0;
 }

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloDHO0ACgkQ3SOs138+
s6EOrw/+I0FV0J/0FGzkZqdQsgnrB61AOjOHKsZ/qqwZ6WXL8ml9o6SyS+CrMfqz
wYLD/qaZ8a5Ex+m5FmdzDSF4YzfmUjZaEDUvFkduE32LudDaHvvdkcknv7kCywsN
3UJI3uQRSV+iUtBEms2dVOVGWiBVQLkSTJpMCb+biEEhgxJ5H36+oW21h01gedGt
pcQ99rtBv/mlzju/SfIp80H+VO7qSK/MvOYh4JDZX3GfRT0FjIoOGC6cg6wVF2LD
DMsAhHpEJ9GRwWZfx8XdxEHeqprXZvBu19FK/Fr2f+3VUw804QKWkVSQyjLYuqqh
NYFOLTrI3fb31xCMjLhsjAkRCXWOW+oeD8Tv1of0FMzZJxHrWaJsFaum7BIYUkiA
t/f5DZwSFPcV3cVJUQGKxrWiOU4lML3zaUbehCWUyec/1GAQwi4ZkE8xQh3Tfasc
XuGSGA6jSH0j6Qep6FSPLWpKWrMhxR1/Q+NqhwXdjiQ32/LWZGVfHbcy0JDX7RGL
xQLiuqqKgVROZUeOwIvS7klBeZbYApmVHgr4oZ+3b7qB+f184OvP1hjOiZZ0kOD4
kZyhxrXwElA6xUHGMi3sQ6+B7O7q4gqz94Kofy3zVfc+kN5Ig6Y5pWCqqjtnFjO+
m5XqkJTl/9CJ4Uylu7uaZgo8KQquDI935+qIe4fQcR/3LkaZq/k=
=n9le
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
