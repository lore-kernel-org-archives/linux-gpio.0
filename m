From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 0/3] pinctrl: sh-pfc: add r8a7795 support for voltage
 switching
Date: Fri, 10 Jun 2016 13:12:00 +0200
Message-ID: <20160610111200.GB1626@katana>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
 <CAMuHMdWyt2e9f=8r+q9U=BLFW2R9OSh5GCnpvsMniXWahQ_qzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWyt2e9f=8r+q9U=BLFW2R9OSh5GCnpvsMniXWahQ_qzg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> BTW, are these a hard dependency for patch 3, or will the missing power
> source control just be ignored?

Long answer short: It is a hard dependency.

It shouldn't be, but fixing this might need patches to pfc, mmc-core,
and sdhi driver. Need to think about it. (and even then, patch 3 will be
depending on these yet-to-come fixes).


--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWqCAAAoJEBQN5MwUoCm2HcwQAJYqYzf8zCx5brUXHooneq0f
r6U0aXouZRiSSDI8D79J2gNyTHounQ/hq288Dr958s0fIxTYcF8vGpPL7RA7uFRN
MGpkpl2L/iv/CkoYG3CtafUmdXywVCu52I0PT0LSV5Yx7ZkJYPn3B2lSUGQj9LhK
tknOEfntxWrowRXm/tGZR3zKaGnfErgQO+0ksMyuPbVeY5xyNSWBO3vpjo4UCo2B
JrGt05Pj6i7ndXNIJ1b0gGICshJBEjUvZvqPPU+JgC1BXzjA4Ud8kyphAk3b4eUr
7T9xYU9B1it7MSF5aZ5Dqu3oTPBzyV15lCKpzjxGqS0J3QH1fx7XXQWEprpEdfRG
6pXggf5eEdckvY6nRQG5zPwZK9w1Qm4gsYmI0RdS+/YdJ45VqM6SxmuT2apnm0nz
KoHhElEITSXPzEwfe+9Bbmr31rGWbaFrhqrawLMUVzOsD0/o793kXWbnFMOUgO5F
WjPDUyCkIhri3wzOvcVl9owSwJG/j9W5dccZZw15s3ofAYo/c+F6k2sdrg+qRUZU
sFJHG8v974IfDb+6Elaa/o7h+80ENsk8+zVc3XipwQl5/MlaSFtES15Ss0awequU
M+hFZz4A5hFbTGyKiotrsvlJwA8qvj5XykJyG4UpFcEnQOWd25oAOX9ykZ2Ptyrq
fM2doNF/p5Xl9V/yitlm
=6l97
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
