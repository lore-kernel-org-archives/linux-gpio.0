From: Alban <albeu@free.fr>
Subject: Re: [PATCH 06/19] gpio: ath79: make use of raw_spinlock variants
Date: Mon, 13 Mar 2017 20:51:30 +0100
Message-ID: <20170313205130.2b5c5272@tock>
References: <cover.1489015238.git.julia@ni.com>
        <1774d7bad8bbc672372480f540dfc8f3d1592533.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/89nzvpisAAI+SXd+IB_tHQb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1774d7bad8bbc672372480f540dfc8f3d1592533.1489015238.git.julia@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Aban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

--Sig_/89nzvpisAAI+SXd+IB_tHQb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Mar 2017 10:21:53 -0600
Julia Cartwright <julia@ni.com> wrote:

> The ath79 gpio driver currently implements an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>=20
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.
>=20
> Signed-off-by: Julia Cartwright <julia@ni.com>

Acked-by: Aban Bedel <albeu@free.fr>

--Sig_/89nzvpisAAI+SXd+IB_tHQb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYxvhCAAoJEHSUmkuduC28YjMP/1GOR4GP/z4OckebWQHLNG0G
I1FxHkfo2kX426If5Hkyy3VdaBRVDHvFj8j8bUygxcp/nnH2xZLPBDmdaQzV6X5l
QNvuUz762aqPRdnT+tnZ2Va+J+kuvkLcmi63RBi2puzQM173K636gtbXl2WTv2XP
JCmRz4tMFduvlowbEe3R7az3HW+6bBMeg9w+7bPBbZG/JL1Q6JmmXGfi/kw6J41h
YjcDRfg5PJXrIgrwaxPh/+BbWZ5to1UZFOCRyqy9vqZ/zZV++9YDimw0LanPbPwD
3TvW2QcdVy69ky7bxs+JX4taZWN1Xhelr+jReSGXf8sTDgPye6HOw6yaza/sKCLn
3hcYAKBb9RRXlEDeiJh+mH1XDv59M5CUxy/1fyM1Upjl3cniCcYNiIEjkgDY9L7b
xhT/8/D8IFJ+WLu/nIFqnww1nrYTem6vSsmTPyY0ilnnGVZ+Q4C0iEGRG4KZ3njv
rbrHmQhS+aSqjHhwQCakHVb7GsIYtzwOUmqDI30w5A8892SO6avQyEqYQ0GtjJj+
D3BY+L5+pEWDXlJrcsxZF+ekPoAP8LUIaZGfoIYp5G4GSsq1Fum28iTKZDu3lgX+
+npCHAuCPc6M3XkDVYSnjEVvo+KbjT1pPTK8RuZENimStpoINDKGVP7SVcbMCe6h
rZhRk20OJ/aUCepWn6AX
=h5w/
-----END PGP SIGNATURE-----

--Sig_/89nzvpisAAI+SXd+IB_tHQb--
