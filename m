From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Fri, 4 Sep 2015 09:39:38 +0200
Message-ID: <20150904073938.GX30993@kw.sim.vm.gnt>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
 <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
 <20150821175216.GE1729@kw.sim.vm.gnt>
 <20150821224824.3406caa0@x2>
 <20150903200540.399a96b8@x2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hy4a9G0dOYssRJVI"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:44939 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752810AbbIDHef (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 4 Sep 2015 03:34:35 -0400
Content-Disposition: inline
In-Reply-To: <20150903200540.399a96b8@x2>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-gpio@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>


--Hy4a9G0dOYssRJVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 08:05:40PM +0200, Vincent Pelletier wrote:
> Hi,
>=20
> On Fri, 21 Aug 2015 22:48:24 +0200, Vincent Pelletier
> <plr.vincent@gmail.com> wrote:
> > On Fri, 21 Aug 2015 19:52:16 +0200, Simon Guinot
> > <simon.guinot@sequanux.org> wrote:
> > > Please, could you describe a setup (as simple as possible) allowing to
> > > reproduce the issue ? I'll try it on my side.
> > [...]
> > > Please try to make the module list needed to reproduce the issue as
> > > short as possible. Ideally only gpio_f7188x would be needed.
> >=20
> > The simplest I could find so far needs gpio-input-polled with 20ms
> > polling period (I didn't try to change polling period), and a shell loop
> > writing to gpioXX/value.
>=20
> Have you had a chance to reproduce this issue ?
> Can I do something to help ?

Still not but it is on my todo list.

Regards,

Simon

--Hy4a9G0dOYssRJVI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlXpSroACgkQgtp0PDeOcDps2wCffr8Hdo+mx6UIrM8i64SfO8qv
qUcAnib74sIxivGKbPu+qyGtzxMbH4T/
=Wy7Q
-----END PGP SIGNATURE-----

--Hy4a9G0dOYssRJVI--
