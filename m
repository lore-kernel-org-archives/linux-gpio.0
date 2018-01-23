From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Tue, 23 Jan 2018 14:37:44 +0200
Message-ID: <87r2qglpif.fsf@linux.intel.com>
References: <20171130092655.25965-1-linus.walleij@linaro.org> <3058528.dbeyJzq7DI@ws-stein> <CACRpkdZ1PMOC0WuS4O=B1ieJyBCwLDzQ=UHri43yEYJmuNtwNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:56501 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751056AbeAWMhw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jan 2018 07:37:52 -0500
In-Reply-To: <CACRpkdZ1PMOC0WuS4O=B1ieJyBCwLDzQ=UHri43yEYJmuNtwNQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Linus Walleij <linus.walleij@linaro.org> writes:
> On Thu, Nov 30, 2017 at 10:46 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
>> On Thursday, November 30, 2017, 10:26:55 AM CET Linus Walleij wrote:
>
>>> +     s64 timestamp;
>>     ^^^
>> u64? ktime_get_real_ns() returns u64 and struct gpioevent_data
>> has __u64 for timestamp.
>
> OK sorry, fixing it. Thanks for noticing!

This is not on next. Will it miss this merge window?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlpnLJgACgkQzL64meEa
mQbq5A//Wwz8gIiBw7xqcJKxx4Fesvokq0Q+LtVzUA/fVNtcySOu3e4bTc1mw9se
Drq1hd0GzwvMoOCsx8RH3Ba2tZmpMSItFLMaR+0nRzQ8RQXioKcIyuOGVHa+AK/F
3PohRLFvKK1azrc6NwlQgj+HHnwgkdoCnImzSi4irjRTs5e3HJvJiXoJ/RNmFQH2
PtT1XobNjjqZ2cLQvdfZbKL6zCn7jUe6UF/vLV/a9LW/8WzS/E2QV//l08sxJ1yy
zi8zo9n6HWfdt4ZFyKWZObExfOl0kXOpTBw+PAIRWCZLJWnxF/LjUx0RbKzPPmzZ
6BmOifMAQ1NaZwb7o9219wQhIesWjSG2C5HmwsbSoNdnbhPQc19EoIMxDpcLhPRY
j8Z3fckEWHOB07E4Ovu60aQFAdosWVt/vJSeN5MFBG/RsheZj/g/saZRGaDO+ujd
tRPwg+jXw3YtPiHxnDoQ4ZkLMp30DW0TXhD+b0vDgL8hm+lu/VOtwBah4qv/mpO5
D90S+016tWDQ55dnsGo65Ek+tpXyB0drbVC3j5hy3q4z1ejq5uBmzBzW5xucOWwf
a14A7k7BUXLJWzDDnYqjepCTYYXJYpAjMB7zk6q9bnCfIx7yi5fHjMnD/I5J9R4F
m0OQ8Uh+c6E8qiXHVPnTw48gY0ItOvocdV/9SIK8TlbQn/OKl1Q=
=+Wl5
-----END PGP SIGNATURE-----
--=-=-=--
