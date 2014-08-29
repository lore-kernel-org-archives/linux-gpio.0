From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 2/2] gpio: zynq: Take bank offset into account when
 reporting a IRQ
Date: Fri, 29 Aug 2014 11:33:31 +0200
Message-ID: <540048EB.7000801@monstr.eu>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>	<1408355696-9998-2-git-send-email-lars@metafoo.de>	<CACRpkdbWt-ns3xDFYR1P7i40J57x0z51MmPoZ36WOq2j0638Yw@mail.gmail.com>	<53F5F461.8060104@metafoo.de> <CACRpkdYXSj5suu+-mosReFKKJVf_ibaD2R4QG=BWdpBc9nzF4A@mail.gmail.com> <54002D0B.8080509@metafoo.de>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="f4sIKLw19X7pcLXAeJSt9TcS9fQPgNLLJ"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:50992 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752531AbaH2Jdf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 05:33:35 -0400
Received: by mail-wi0-f169.google.com with SMTP id n3so540161wiv.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2014 02:33:33 -0700 (PDT)
In-Reply-To: <54002D0B.8080509@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWE=?= =?UTF-8?B?bm4=?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f4sIKLw19X7pcLXAeJSt9TcS9fQPgNLLJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Lars and Linus,

On 08/29/2014 09:34 AM, Lars-Peter Clausen wrote:
> On 08/29/2014 09:20 AM, Linus Walleij wrote:
>> On Thu, Aug 21, 2014 at 3:30 PM, Lars-Peter Clausen <lars@metafoo.de> =
wrote:
>>> On 08/21/2014 02:40 PM, Linus Walleij wrote:
>>>>
>>>> On Mon, Aug 18, 2014 at 4:54 AM, Lars-Peter Clausen <lars@metafoo.de=
>
>>>> wrote:
>>>>
>>>>> When looking up the IRQ the bank offset needs to be taken into acco=
unt.
>>>>> Otherwise interrupts for banks other than bank 0 get incorrectly re=
ported
>>>>> as
>>>>> interrupts for bank 0.
>>>>>
>>>>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>>>> ---
>>>>> Changes since v1:
>>>>>           * Use lookup table instead of switch-case.
>>>>
>>>>
>>>> I tried to apply this, but it doesn't apply on top of the other patc=
h
>>>> "gpio: zynq: Fix IRQ handlers" that I have queued for fixes.
>>>
>>>
>>> Works fine for me. Did you try to apply both patch 1 and 2 of this se=
ries or
>>> just patch 2?
>>
>> Yes, and on my fixes branch, as well as on Torvald's master (which now=

>> has patch 1/2) this happens:
>>
>> ]$ git am --signoff zynq2.patch
>> Applying: gpio: zynq: Take bank offset into account when reporting a I=
RQ
>> error: patch failed: drivers/gpio/gpio-zynq.c:461
>> error: drivers/gpio/gpio-zynq.c: patch does not apply
>> Patch failed at 0001 gpio: zynq: Take bank offset into account when
>> reporting a IRQ
>>
>> Can you please test applying this patch only on upstream this and figu=
re
>> out what is wrong?
>=20
> I think there is some confusion here, maybe two different series got mi=
xed up. Patch 1 of this series is "gpio: zynq: Reduce level of indention =
in zynq_gpio_irqhandler()", which you just applied, but which is not in L=
inus' tree or the public gpio tree yet.

I have no problem to apply that patches on the top of Linus tree.
Here is the branch with that two patches.
http://git.monstr.eu/?p=3Dlinux-2.6-microblaze.git;a=3Dshortlog;h=3Drefs/=
heads/xnext/zynq-gpio

Feel free to cherry pick them from this branch.

Thanks,
Michal




--f4sIKLw19X7pcLXAeJSt9TcS9fQPgNLLJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQASOsACgkQykllyylKDCH3wwCfa8wYCyTXyo5ImBWea6+Cgakb
590An26B9CBxdFFLHP4p2TR46jnaEapo
=YOq6
-----END PGP SIGNATURE-----

--f4sIKLw19X7pcLXAeJSt9TcS9fQPgNLLJ--
