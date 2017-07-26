From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] pinctrl: bcm2835: Remove unneeded irq_group field
Date: Wed, 26 Jul 2017 12:49:37 -0700
Message-ID: <871sp3yo4u.fsf@eliezer.anholt.net>
References: <20170720165912.14360-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:59962 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750955AbdGZTtk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jul 2017 15:49:40 -0400
In-Reply-To: <20170720165912.14360-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org

--=-=-=
Content-Type: text/plain

Thierry Reding <thierry.reding@gmail.com> writes:

> From: Thierry Reding <treding@nvidia.com>
>
> The irq_group field stores a 1:1 mapping. Use the loop variable to
> derive the values instead of storing them in an extra array.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAll48lEACgkQtdYpNtH8
nuikMA/9FMLm/mMi8QK4pbApIG8XlmsEZDcE+8QEibxAXqTTQLhrfSMvrbabz8nl
oDzxCoP1dv7xDZk6aAdNyNWGbvXZuyxwdYmoT/EEzJk2TJ+r4B6GbmdcUgUfqo6G
ax91oJ+PNn87kckoo1Ey7Ovn6PAjxxuVSQLf9jHrwg/BkF8/M/DBrhbJAVBnNM7J
jjKjDjpvSzhr1LC00ZSM+Mn+LsgcJIyhfQOeYyDp1be+dKrV40LZ+MTaSR9Zrd+l
3FaSToDAXVJnR6ywD9xIG+5uPJfXGbaVBl02kk4qL0WvNb2FZKZK3sKKRNgOEJcs
WMSE4RDcItlHsj3smeeuktKwGdo4dg0i0FAxcw3nA1J++ORbOGJalhs5L+PS0nT5
kNbvexeW/mFqz+YqRHQjeamiZ/axzYhxom9rR1cFrOLhFAYenxrUEg5sAVmP1VVI
kGaliFSK5AyXcktQjEOQb48Hvq8Mm2HRUbjGxaIwyuzapVZLr6LLQpJNND/bveAB
gZ/yCrGOKpra/GkRdVKZkmXlXfkgMxcwFlS0JlYpJATVYXs65BrIwZ4n2qXMqwtI
YIlQWto54QfTupPyIKzwkxJcoVrzj4yuj5KgLcx13Vmkdz4h2aWlIjzUUeqlwHIT
TuRVOagXcGns37niKImJerZy0yeuIkrKLg+bWr5sNsbROO5h2GQ=
=gU5W
-----END PGP SIGNATURE-----
--=-=-=--
