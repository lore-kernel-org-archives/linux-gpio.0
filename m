From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Tue, 23 Jan 2018 15:53:02 +0200
Message-ID: <87lggolm0x.fsf@linux.intel.com>
References: <20171130092655.25965-1-linus.walleij@linaro.org> <3058528.dbeyJzq7DI@ws-stein> <CACRpkdZ1PMOC0WuS4O=B1ieJyBCwLDzQ=UHri43yEYJmuNtwNQ@mail.gmail.com> <87r2qglpif.fsf@linux.intel.com> <CACRpkdY2U1N+xHAKjxjAEzD-hMuDCveYuxOLNzyy=x8N+CiiLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:51961 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751531AbeAWNxK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jan 2018 08:53:10 -0500
In-Reply-To: <CACRpkdY2U1N+xHAKjxjAEzD-hMuDCveYuxOLNzyy=x8N+CiiLQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Linus Walleij <linus.walleij@linaro.org> writes:
> On Tue, Jan 23, 2018 at 1:37 PM, Felipe Balbi
> <felipe.balbi@linux.intel.com> wrote:
>> Linus Walleij <linus.walleij@linaro.org> writes:
>>> On Thu, Nov 30, 2017 at 10:46 AM, Alexander Stein
>>> <alexander.stein@systec-electronic.com> wrote:
>>>> On Thursday, November 30, 2017, 10:26:55 AM CET Linus Walleij wrote:
>>>
>>>>> +     s64 timestamp;
>>>>     ^^^
>>>> u64? ktime_get_real_ns() returns u64 and struct gpioevent_data
>>>> has __u64 for timestamp.
>>>
>>> OK sorry, fixing it. Thanks for noticing!
>>
>> This is not on next. Will it miss this merge window?
>
> I realized yesterday when doing a security fix that it was missing.
>
> Because I didn't get the merge conflict I expected :D
>
> So I merged it. Don't worry. Sorry for the fuzz!

No problem, I'll refetch linux-next tomorrow or the day after and start
testing it.

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlpnPj4ACgkQzL64meEa
mQZTYA//Ts2aGZhFB9fdiYA3EiBMXN89uUm33c8houswUoLdSoHSEt3nyiHuDQWH
s03ZdbyHOWBWxI3gnwvu3Sh5C3tJOcCWZp+13j+6i/rXwZvjNxUqJxKxSe9ClAtL
H07pn4fHtjqBE3WYy73M1+mAVpPRFx31aZ4fNNkYub+o4PspJubS0PLYi0BoJinn
XDGg1T6s5rG9zxyZ01ppg0prhgBffZeRebXLhvHQl67ZKZ8oSKf99beD5wNKoT15
kvr6DQU89LehyTcPWN8NvkxQhuRXbqrMPwWBisSYu7tGplNKNA7k+av3JWn6NHAH
+fYKoTfgrbiJMUesFMoSPlgaNxrwT4euzwgH35jMvJH5jov85MMwKdoQhxW+xmIi
Hz3dG4MSQTwAyGJh/SJsD+LwWnwSDV3/2mWl1Y74bJ9RozNj7FIJmSLnR7D7mmT1
t99XBedDH8rtEE6m1tHgj0F1j6BAQ0Urh3iwHv8GG7S3btcVCoyynJP5jJ9W8WeG
Glbqqld52z26iWFy/LUVQWy56PqiBxB6jhn/Ku1CHGewRVnJvlXtd+UPEwgCRWLU
hnRdc7DLLH5ReCcC37/Fx1zSWIOMBB/48+AsDngIaz+GMk4cxc+DoDEkdVblL+dH
s6wRxNR2kAUZgS4SV+Ex1VUPrHnu2PVijSejft6cMzG0xkm3czk=
=C4Q7
-----END PGP SIGNATURE-----
--=-=-=--
