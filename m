Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453687;
	b=xb2qf32+R7aaSWZJnpbPQlF0CufTCTpVcNRbSODYaOCOdcfGBW4GFHJuBzw7IAfMBaYO
	 1MhfPDHDPJsFDS8n+Q090NXDsRDjdm+ZLjYTGUDda4jsx1Yv2O6osxb3qaRTDkDzgkh0M
	 oEHwnuAzGi/BYF/ACacf2Ba0bhmEEuVSEUHdk4DGBQXRlOrh5SKgnhG/PmyHv9hxBz+d4
	 FKKDsqSb1lbaFAwLClnKhiVZ6UJB3z+XJ6CQcsJZ1eQY9HOPFynknfgYdIJsXDHrMJnq2
	 AGu62H5PktRJfcd1QHLWJoZks5kR+P9N3o7TQO4ie64QlPnyt23UUSWC+zVr3cM1yAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453687;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2zkp9cMv4e8NHpUDT1W+gSGvLR4lxUOYrpHFgT5nEig=;
	b=LvUQ8HGWukL30wTGO5yuiKy/Tu1Eu/8uJuehNSAMqCONAu6cv2nKquObxc1UdlWseyWm
	 qpuaoA/eqzUpmtdIpqshH0h57l8tWMuni2jhWpud60GD9FoC6LqWm9ndo7ezSN0Ie2IkH
	 rm5TsgekdxVINepQh2f+xVTwUsnEq75m2k6eW3Vq4loH98TCcbJK6Pn99JeFYq0jYd4O8
	 iY1g9xCi7NJSZDmEcEDcZrgSVXUMQbel3xASK4lGugBFlLYF9B9CUG0J5fWsqc1HyI9wG
	 JGJegu/rEitYrzLuYbpqvp1pErvuNS7sOBzR122e80A8dAZTS2mIzHVjr49ES9j9ZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QApyWru8;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B3C606A333
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 17:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B3C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QApyWru8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2zkp
	9cMv4e8NHpUDT1W+gSGvLR4lxUOYrpHFgT5nEig=; b=QApyWru8pfisxurBedbY
	ErEyiLS7sFG9rdTwlgOWit/R8ykWMOAQudIkwimIaunVrFjAFkmv4fDJQVrpeb0l
	YpPcPN7bun+96PlLu40ARAPb3qGm1J4Q8TZ4UN6L4Nrxen1FaYdKe5MKNc2bMJIY
	bCDEsmbssguGuRIRkjgBKKCqEGh1OMnt0TAqx3nvikxox/rcffC7V9GZkfM6eJJ1
	0CqxL5UgJTFbUMP7bwxI881YQcWwrMxI59W2Zcuag5Plbtg+dOwRvHj/1M9nQ368
	faCmN0v3OKfKKOAbr4yVAsU+B5Tf9T9cS5aAcywNQf6lEfEvkmYJlzqnq4zLWxvZ
	tA==
Received: (qmail 2845069 invoked from network); 23 Nov 2026 18:08:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 18:08:02 +0100
X-UD-Smtp-Session: l3s3148p1@RST4ovRgtugujnsu
Date: Mon, 23 Nov 2026 18:08:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Linus Walleij <linusw@kernel.org>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Message-ID: <awRy7paUt9gCwKVE@ninjato>
References: <02632c0d-110f-4d42-82f8-30091468aa91@web.de>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jR6Tu5F0eho3hBgh"
Content-Disposition: inline
In-Reply-To: <02632c0d-110f-4d42-82f8-30091468aa91@web.de>

--jR6Tu5F0eho3hBgh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 03:21:57PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 23 Nov 2026 15:00:10 +0100
>=20
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
>=20
> * Delete a clk_disable_unprepare() call on an error handling path
>   and the implementation of the function =E2=80=9Crzn1_pinctrl_remove=E2=
=80=9D.
>=20
> * Convert the data structure member =E2=80=9Cclk=E2=80=9D to a local vari=
able.
>=20
> * Omit the label =E2=80=9Cerr_clk=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

No regressions observed on my N1D board and nice diffstat!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--jR6Tu5F0eho3hBgh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEcu4ACgkQFA3kzBSg
KbbehQ/+LtDdFMxdSyOVoAU86E6pIOud05/a2Oc+HYUMXv6ZfS22yQAiCsh7qVG4
V1r0NDPB4a6L43pY76W6qqFP9yBqTFA1NiJcspJtAFhIRHVFBZf+TmPet7jQ0leT
U5LCyNNgrgRczsYOPvv/1g6/0wI8ikjz+MCu/iv+czmTIQqhTHEhPTbOi5YNsf5K
Nq0x4wEInZIZpnZl00t1vodg2eRwd0T7T+2U1Bgp2Hto+ot2CfLnTJ3uoWPBAPfR
HYpeAE6GOBxAQAlngxT48I7q2hQr6K1EwGNmY49EisdLcup3DWA9iThHJOU/bqOL
xqfrEaRyhq85JA8tnPetUAfSgq7A+cZIhPN1rQP9b4gVdljnGdeWNHabl4VZQRV2
jdJlBdgC3UCvAugTVb4PtIb9yRslLTF4zUwGguHzCMREoc75LCrtJyj5mtWwFLAy
axObeGO0pigghQ5txSBZ/Q12/oZJdobE5doK/jYOdBUH4hZCuBvCItBK14tdQq4C
9eE3A1rtblOROl8PzMM/IstnJVND8qicvaDTWQjMWlXYXk99NZfIjrG9Nh3esruw
SdhIZWuTIy/PQ/ksr7RkoWbXYSf4F1Xn9LYNIU/wGQmM9DAnj8Ur3vJJvBC7yTMc
IQzImRT9QFViSp42D0sCB1eFIFvAEfIKEjuMKa3E5yy5kKUKQlg=
=l8xz
-----END PGP SIGNATURE-----

--jR6Tu5F0eho3hBgh--
