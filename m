From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: always include all subdirectories in build
Date: Mon, 12 Oct 2015 12:26:29 -0700
Message-ID: <871tczzy56.fsf@eliezer.anholt.net>
References: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gabe.freedesktop.org ([131.252.210.177]:43853 "EHLO
	gabe.freedesktop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067AbbJLT0d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2015 15:26:33 -0400
In-Reply-To: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Viresh Kumar <vireshk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tony Prisk <linux@prisktech.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

--=-=-=
Content-Type: text/plain

Jonas Gorski <jogo@openwrt.org> writes:

> All pinctrl drivers in subdirectories are properly guarded by individual
> configuration symbols, so there is no need to limit the directories to
> the belonging machines.
>
> This allows wider COMPILE_TEST coverage on "foreign" targets.

Thanks!  Unrelatedly, I actually ended up being surprised by clk-bcm2835
being gated on CONFIG_ARCH_BCM today.  For bcm2835:

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWHAllAAoJELXWKTbR/J7os2AP/2gPmVgy2lsnULtq+Q4vcHDM
26q2qE63kjRJOY8pmjx1qkPnps2XL3jm5c1KjI5FumvdwO8sjtMt6a3NU6yelmPR
G5vCIx74YU5prQLIPVcTecgkPHwTcd6c/hFi45wDS6E3vcxM203mULwvbt/N44OT
Nf8D2ieg5s5bNuehcCFaQ74+pCjhKGrQ8tf6xBWHGCcKBKOZjRecg5IwxigwKj4w
aj+XAoGBI5q1EEB/Pdjmw136qlRibLb9ODt0uyOs0b1sVKoup2pg3yvhR9JQWcZS
m6zi8KqtWJ3ZwCT/5IQX6N4tQ/aU3DYpsZ7kxT2Z35wquPLsiQf/s1TJMEP2BOBf
GJeAk83Oz8clOnEauDzezQ5yYZrFyz766oE/JJyN6vtI8u+vXAO7jxouLWYMC68p
Fn5LZ2kGJQhgP3zhnvryoqJNU4XzQUoQravwrpB2SUUgkM7q4x6QpAI+RCjmJTIJ
zXGZ2ux75e3O7UI7ASGkfUIb7uB4WHbE0WsM9Il94zhDrYHQ7T0V30+uMjX/rHVz
8e1MlmHzyraQuxTZQ+qHPFL1rWgRic3+sCQ4LcTk/XahRBRCxwgk66MgfRhqDNAH
ip8aoeXyWxv5KvT2QnNFmug6C2ArlkYI5HZGqmc5FzzA2HO0FKoTInsfcli/7DXM
3WPKCnQRyW1bQGhtwSF5
=qW3+
-----END PGP SIGNATURE-----
--=-=-=--
