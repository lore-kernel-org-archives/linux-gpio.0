From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: bcm2835: Implement get_direction callback
Date: Mon, 28 Mar 2016 11:42:28 -0700
Message-ID: <87y492jvfv.fsf@eliezer.anholt.net>
References: <1459177104-24353-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:58370 "EHLO anholt.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754705AbcC1Smd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 28 Mar 2016 14:42:33 -0400
In-Reply-To: <1459177104-24353-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Implement gpio_chip's get_direction() callback, that lets other
> drivers get particular GPIOs direction using gpiod_get_direction().

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW+XsVAAoJELXWKTbR/J7o/g8P/3RtscmYXHWyYMSQOL81e4vQ
zMWTf+dk+zr1Aqg6nYvzWIHdriyx6EG6k4LBHsUFbDKNV3xEZV/yYlgzkuumt/RP
Mqyzk0kV71IkvlhYUJM5uIQzs/WzBnx1PEQ+hgD1v5CCiGzlRftLFJ2GBrKm0pND
R0meHgwKjoKJwKEM3M2wr9agy1+oP/mnLEZNXOVCPV4DB+33qQukbhrNmMZhm7HE
s4fM01WmyjvfDYtUrqmgRb4vODMBWtFk4eNEJPuyHLW/yiGJXMUvpEVNrDNeba7a
Bp6Q0xyr3zV1OFsxbqxVG8Q4u2sR/yymUumZkBZJDbZ5FxsyuIKNkv9Y33QkEErb
ijuBXCHdy+yt25lHSEHNNJZ28//2ZcZcb+bYZtQDkkZijGIiepfJ3lYDEmWTzx2b
ozaaPnVaKTuw223Q3ZJgjNAeDIZKG1nGt6bwTnVDN8w50pvfH/0EMY7WfzucwQpg
oM2iCCOavWOjJvgt0J6HTgFLEZknNQl80z6JkYbgohkYjUbs3mNXoPfu7lsUCWDw
JDntM4SPQVVNijp6qEZwD9Dw4PGCfaM5KdN4mWJO3wObqenP3rRr2cIPxO3+Wd2i
RshyvuvYhO85x0QA6bkGlrfH/4P/57qtGRpdCUW+iktg7hEwpi/rqNsjTkym6EpY
9p+LU9h4PICAdeBw0uYo
=mexz
-----END PGP SIGNATURE-----
--=-=-=--
