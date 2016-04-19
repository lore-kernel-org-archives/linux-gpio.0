From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/8] STMPE fixes/rework and add STMPE1600 support
Date: Tue, 19 Apr 2016 14:41:26 +0200
Message-ID: <20160419124126.GF8284@ulmo.ba.sec>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:36098 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753398AbcDSMlb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2016 08:41:31 -0400
Content-Disposition: inline
In-Reply-To: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patrice.chotard@st.com
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com, amelie.delaunay@st.com, shawnguo@kernel.org, kernel@pengutronix.de, dinguyen@opensource.altera.com, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, swarren@wwwdotorg.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 02:18:29PM +0200, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
>=20
> This series cleans and fixes some bugs in MFD/GPIO STMPE drivers and prep=
are
>  the ground to add new STMPE1600 support.
>=20
> STMPE1600 datasheet is available here :=20
> http://www2.st.com/content/st_com/en/products/interfaces-and-transceivers/
> i-o-expanders-and-level-translators/i-o-expanders/stmpe1600.html
>=20
> Only STMPE1600 has been tested on STM32 platform. As i have no board with
> others STMPE variant(STMPE610/STMPE801/STMPE811/STMPE1601/STMPE1801/STMPE=
2401
> and STMPE2403), i put in CC boards's maintainers which are using others S=
TMPE variant.
>=20
> If they can kindly check that no regression has been introduce by this se=
ries
> :
>=20
> For ARM/FREESCALE IMX / MXC ARM ARCHITECTURE:
> 	_ Shawn Guo <shawnguo@kernel.org>
> 	_ Sascha Hauer <kernel@pengutronix.de>
>=20
> For ARM/SOCFPGA ARCHITECTURE
> 	_ Dinh Nguyen <dinguyen@opensource.altera.com>
>=20
> For SPEAR PLATFORM SUPPORT
> 	_ Viresh Kumar <vireshk@kernel.org>
> 	_ Shiraz Hashim <shiraz.linux.kernel@gmail.com>
>=20
> For TEGRA ARCHITECTURE SUPPORT
> 	_ Stephen Warren <swarren@wwwdotorg.org>
> 	_ Thierry Reding <thierry.reding@gmail.com>
> 	_ Alexandre Courbot <gnurou@gmail.com>=20

Adding Marcel Ziswiler, who's better suited at judging whether or not
this has any impact on Apalis/Colibri.

Marcel, in case you don't have these in your inbox you can find them on
linux-gpio's patchwork:

	https://patchwork.ozlabs.org/project/linux-gpio/list/

Thierry

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFid2AAoJEN0jrNd/PrOhBioP/0wxo9pAALFPj1rF/UiPmTeD
gGdXaxTdzlv2/fm86OyxhFsZsfBJU72Eg1oGfciNF3ai23hv6e9WWW68q2ZKPnuH
akW0/s9/VfZRWtnk2YQq/33wohpU2rFRW7gfbKxOrL0dHZxZDlQ9OVupINuCLQy6
NAloiAb3W2RVHk5hyJKgohhKP62jh1iBh6PkX7Gpf3k/VmvgQQKh3Exe1Vjc7s1t
dQiEeWHGtG7DKMpASb7AdodZW6RidE2DjCt3b9S2wqfjqiuxullEhkNOZ9VIHzR3
QHQ04QDagQ/GakJpybuhyzybZqvhlvlhATvubddIEcOXcoIWdflLaKWHi+9HLFhg
cIOtH/xJ73Pmt3s8f6I6lieDhYv1n8Vz8dxB6XwhHck/g1CIGGP7u/jZjxRy1aqC
64dULdFlPLpmgxiDQudKPsihuayLR2DtL16UCT5/LyYLMd0edOoEMqMaofnJwYLD
EhQg5x6O+yog/fi4GJLmmDOD/jzq3ISKAIIv04OTIm7hDaY7xn6aR4H7C8T7lB9i
xZyVkLPalPqWTIndNKNPGSrm1QxgSA/4XU/jSk4jFbwJBPw0VFjWhl0qjnetDK2n
3xkjXw76VbooeSjodvD2zL3JPPcUmcPIlFgx4Z3q68kAWbJAdG3LokQrNdArf6ll
gnX7pdDwPyIxx/QhQpx2
=p/ez
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--
