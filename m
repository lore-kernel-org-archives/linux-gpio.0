From: Thierry Reding <treding@nvidia.com>
Subject: Re: [pinctrl:devel 152/153] drivers/gpio/gpiolib.c:1943:19: warning:
 'struct lock_dep_class' declared inside parameter list
Date: Wed, 8 Nov 2017 16:07:16 +0100
Message-ID: <20171108150716.GB827@ulmo>
References: <201711082209.w9VtmkEu%fengguang.wu@intel.com>
 <CAMuHMdVVTuCem3-P70ZvNBGw7g-_2Q+h2Ed_76cJEpfWrYnkQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17416 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751566AbdKHPHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2017 10:07:21 -0500
In-Reply-To: <CAMuHMdVVTuCem3-P70ZvNBGw7g-_2Q+h2Ed_76cJEpfWrYnkQg@mail.gmail.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kbuild test robot <fengguang.wu@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2017 at 04:04:05PM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 8, 2017 at 3:38 PM, kbuild test robot
> <fengguang.wu@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pi=
nctrl.git devel
> > head:   bfcadc85ef134881fce5f8635648e36de1ab4c9d
> > commit: 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40 [152/153] gpio: Automa=
tically add lockdep keys
> > config: m68k-m5475evb_defconfig (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 4.9.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 959bc7b22bd25a3a907fbb9b26a1d0cbdf98ef40
> >         # save the attached .config to linux build tree
> >         make.cross ARCH=3Dm68k
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/gpio/gpiolib.c:1943:19: warning: 'struct lock_dep_class' decl=
ared inside parameter list
> >                struct lock_dep_class *lock_key)
> >                       ^
>=20
> s/lock_dep_class/lock_class_key/

Yeah, I just sent Linus a fixup patch for that. Sorry for not noticing
earlier. I was focussing my build tests on covering as many GPIO drivers
as possible but never actually thought of building this for
!GPIOLIB_IRQCHIP.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloDHaQACgkQ3SOs138+
s6FqBA/4t3H0gkJEp7ZCMf9GA0fut0ZidiiHLAxjFf5nLWNiWQRU9y88ciANn4ev
jsySKEypa0R6f7SH9vs2CtnOMkUg2n7rc0iifUGWND8MEPZAaLCnTniIU2VvBvzs
SUxGFnvDO1nEH4rHx1yKeX8g74+azZjEziez4JCqvjyvGheEt3siCFDs1ZwNH9SK
P46PkccJPSUP4Zm1ZPAux0EpJ6Guug49Rh2RAdZslJ1A7rlD69/x7lHkZVFC5oWp
QV2tJfaZpesaG4IA6EsUexxbhavh0nFe8FTrTAykFCz4hYWZsxH63Da6lORaNrPr
FpJPeOS5PVR7h3XlZIZx0d181W7YlqDHIf0Q85TDLTUC8O01f+lmRbwvBf+9rf5u
V3RxCD9kOYf+phUjtxZ09rc1UmK9BY4WJQalOzbRWdGH+YUyT8oH9mWFTT+eUsiI
4aFx/3WEGrjwPWU6LwRIV11OXcpvr29J7RxLfVzWRQqOEfJoC9p2UD4NVuLEECt5
9LLsa/UoM+U7xVTns+ERe+h1+vLvwiPuAi+pB2fUxwXt4kwS1tXcitio/TBMfHOv
ZuuB//BcHaDCl3q+0T7T4f78CdTxP4+AsBlgEuVjayalMgxRWTLWmSzLo3RpDLhc
2ongY7G9s+xjLTZkPlqo4XTyOi93cPm9JnnilD5+fr09sO/hpQ==
=Aqu3
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
