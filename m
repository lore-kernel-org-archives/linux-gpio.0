From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC] pinctrl: sh-pfc: only use dummy states for non-DT platforms
Date: Mon, 7 Mar 2016 23:21:31 +0100
Message-ID: <20160307222131.GA1391@katana>
References: <1457376072-755-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdXPH0+YE=cRk7pjvoVEYtEGNcb_83-z5taXSLHRhtgMQA@mail.gmail.com>
 <56DDDE6E.6090908@cogentembedded.com>
 <CAMuHMdWis_knSv0Lgw+8O3LXp9thEX3SdGX6qo_4UyFrxFVuHA@mail.gmail.com>
 <56DDE5CB.60204@cogentembedded.com>
 <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVFk47u+LPdfh+fq8vvPQAULyM8X_DrizCtrgf-1YwaA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Perhaps the of_have_populated_dt() check should be moved inside
> pinctrl_provide_dummies()?

Hmm, the kernel-doc for pinctrl_provide_dummies() says "Usually this
function is called by platforms without pinctrl driver support...".
Is "without pintctrl" == "no DT"? Linus?


--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBAgAGBQJW3f7rAAoJEBQN5MwUoCm2Uq4P+OhaqRWA8KUvZbYScCV9gfx6
K9KhpODAEZa0hvqH83z+YQZRYZs2/kSOsLmPv4Q99qtGJZMi5tBiXRq58qIgClZ5
YCXvUp7BmZAnfEioSWDqojUw1yhLv8HZq5qKbP1MhYsgkSzClB0PSdqbfTUK6vOr
tSh1ucxedx7H0PwNpn4p4N+UBJ7Ey0DBvtFombvZ/YZSguNyEfqEWPiHaQhnaeT6
yiSMrQCJts0o+JJtWC712MfFEB9E9iXobu6K5NkFXk6SKNrUDBgr5R/DC06CUg7z
uFKV7yUZto3sFFtmtICt4n8JctvAWnFegUKZwaBa3SlYPnsu+ybEmL7/n+izcYUb
X02x/LOorxC+vPJO1W0YVR6Q2OuqC94Zh76bQnrccYfqBK92xYDiqw4tpjY0aw3Y
llYPRpNiLRc7UF+xCE2bCqrj6im6MRIIqVqu1gxZ9eqik5DPDfE6BZyvAAsJ8Xmv
wx7ux/KTmIw5sZLCNmop7EFxsWgrwnbPYJaArkd++4I+yNuQ9wEAVToVoFXQ6FmN
N2MaMKi+pnELmPSuGS5WpyasJw0UAoycn4q87iS1FRWXS0MK9hlqen64fVTEgD6c
DQiIrKseutnmr2GyyFVvLSjWQgbsockFpCI5G3yH3BWzOuXrzo3A1x9ex/dXw83z
NCP09XyB0Sr0fXJylnI=
=sUGV
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
