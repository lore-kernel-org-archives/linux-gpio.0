From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add voltage switch operations
 for SDHI
Date: Fri, 9 Sep 2016 14:29:12 +0200
Message-ID: <20160909122912.GB1318@katana>
References: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:52586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751332AbcIIM3S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Sep 2016 08:29:18 -0400
Content-Disposition: inline
In-Reply-To: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 01:57:33PM +0200, Simon Horman wrote:
> This patch supports the {get,set}_io_voltage operations of SDHI.
>=20
> This operates the POCCTRL0 register on R8A7796 SoC and makes 1.8v/3.3v
> voltage switch.
>=20
> Based on work by Takeshi Kihara and Wolfram Sang.
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0qsXAAoJEBQN5MwUoCm2b4YQAJ2wwDF19nxYkNvRXOBlVDDc
LvJPSXSBTrU0KcxHo2GqxZVve9v1E0KYM4X26/kuM4mBuQu9Z9m9kBoboDRyhJKM
CqwhIcWjAv0JEkKqWtAhPZ8bQ1uCUPmWYFILoQWWYyZhvh41L87Dn6bIq/6Kt6PB
5/9RMXvMVtY9FbuBtYh4gt9NNiqcqCuhBgCHrjEr+1DTUAEonEgnEvrbdz9Y+e0C
2GP7B8abTIRWdU/MumWlYmh6Roe3zze6xYmRYr9aJgNnhGSfTBAVA17DjTksiP4d
aQiS4fM/ferau8PME3Yn+DZ1UwbxlDzcgfWsL1AdnEQy7Xp77AyAHFlV5SPMvrW1
KXiNAJlGP8n1LTMAoSGXEX8HOghoWgQvxo2jUnwwyxGrsDFiBZ89XaAxBgzmNv1D
wHD+EP4Q+dhNu7hZeZ/wSjUJ1bnKYvYHZuHb1sBvy3eHpVq4+7stJo/sb90TfWzH
3biF+qph8pxG9BVQzE0vBuuwf5jrH9iUuu59wpnffSxkdvESf6vclGGGHkVairuL
JJHWJ5e5gVMmacpYjq5HAkZenpUciAo3r1anBJldtQ8+Cr5UuiiFJPMVO8rfiTuW
qPpqRXjqSXYs8mbhcwebm1rGPCDcvTjqiwAegmMRRydfWrTH652+9M4MoCN0bT1a
a67Wh/yV/0zFkkZqeZgU
=Oyu7
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
