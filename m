From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] gpio: Added zynq specific check for special pins on bank
 zero
Date: Wed, 21 Sep 2016 09:22:09 +0200
Message-ID: <d4d36022-aa3a-d49c-e008-626e20e35b9e@monstr.eu>
References: <1474360324-8168-1-git-send-email-navam@xilinx.com>
 <20160920140633.GD16583@xsjsorenbubuntu>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="c84igKHJIvnNRFP4gQ6oSQwBk93asB204"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36753 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbcIUHWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 03:22:16 -0400
Received: by mail-wm0-f68.google.com with SMTP id b184so6984157wma.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2016 00:22:15 -0700 (PDT)
In-Reply-To: <20160920140633.GD16583@xsjsorenbubuntu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Nava kishore Manne <nava.manne@xilinx.com>
Cc: gnurou@gmail.com, Nava kishore Manne <navam@xilinx.com>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c84igKHJIvnNRFP4gQ6oSQwBk93asB204
Content-Type: multipart/mixed; boundary="5XgQoci8cCOLLtEahOu026GmapGCOmwqS";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
 Nava kishore Manne <nava.manne@xilinx.com>
Cc: gnurou@gmail.com, Nava kishore Manne <navam@xilinx.com>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <d4d36022-aa3a-d49c-e008-626e20e35b9e@monstr.eu>
Subject: Re: [PATCH] gpio: Added zynq specific check for special pins on bank
 zero
References: <1474360324-8168-1-git-send-email-navam@xilinx.com>
 <20160920140633.GD16583@xsjsorenbubuntu>
In-Reply-To: <20160920140633.GD16583@xsjsorenbubuntu>

--5XgQoci8cCOLLtEahOu026GmapGCOmwqS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20.9.2016 16:06, S=C3=B6ren Brinkmann wrote:
> On Tue, 2016-09-20 at 14:02:04 +0530, Nava kishore Manne wrote:
>> From: Nava kishore Manne <nava.manne@xilinx.com>
>>
>> This patch adds zynq specific check for bank 0 pins 7 and 8
>> are special and cannot be used as inputs
>>
>> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
>> ---
>>  drivers/gpio/gpio-zynq.c | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
>> index e72794e..eae9d24 100644
>> --- a/drivers/gpio/gpio-zynq.c
>> +++ b/drivers/gpio/gpio-zynq.c
>> @@ -96,6 +96,10 @@
>>  /* GPIO upper 16 bit mask */
>>  #define ZYNQ_GPIO_UPPER_MASK 0xFFFF0000
>> =20
>> +/* For GPIO quirks */
>> +#define ZYNQ_GPIO	BIT(0)
>> +#define ZYNQMP_GPIO	BIT(1)
>=20
> I'd make sure all quirks are easily identifiable and call them somethin=
g
> like 'ZYNQ_GPIO_QUIRK_FOO'
>=20
> Apart from that:
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>=20

This issue was:
Reported-by: Jonas Karlsson <Jonas.d.karlsson@gmail.com>

And here is also my:
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--5XgQoci8cCOLLtEahOu026GmapGCOmwqS--

--c84igKHJIvnNRFP4gQ6oSQwBk93asB204
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlfiNSQACgkQykllyylKDCFEygCfXzHj5MRezBtrEf9WS/Dn1Bxr
gwoAoIqBc2GLdK+PNl7yzixt4nmX03Yi
=8Uko
-----END PGP SIGNATURE-----

--c84igKHJIvnNRFP4gQ6oSQwBk93asB204--
