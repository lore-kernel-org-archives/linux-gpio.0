From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [1/4] gpio: gpio-f7188x: Use mutex for access serialisation.
Date: Thu, 10 Sep 2015 00:01:40 +0200
Message-ID: <20150909220140.GD9892@kw.sim.vm.gnt>
References: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
 <7d1a2156ddabe0b72964e88734adba307a472067.1440093298.git.plr.vincent@gmail.com>
 <20150821175216.GE1729@kw.sim.vm.gnt>
 <20150821224824.3406caa0@x2>
 <20150903200540.399a96b8@x2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:41793 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751829AbbIIVzU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Sep 2015 17:55:20 -0400
Content-Disposition: inline
In-Reply-To: <20150903200540.399a96b8@x2>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>


--sXc4Kmr5FA7axrvy
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

Hi Vincent,

Vincent (Donnefort) finally succeeds to reproduce the issue. The setup
is quite simple. You only have to flood the gpio-f7188x driver via the
sysfs GPIO interface. Nothing more is needed.

After some debugging we discovered that the problem comes from the
__request_region function which don't handle very well concurrent
requests on a muxed region.

I will send a patch as a reply to this email. Please, can you test it ?

Thanks,

Simon

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlXwrEQACgkQgtp0PDeOcDql1ACeMW5HqcNP/LVkczwb8ZO3xZcA
Hh8AnAt+Y/QXGSakdqycNB6ENggJf90m
=yWVS
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
