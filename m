From: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: RE: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Fri, 26 May 2017 09:33:10 +0000
Message-ID: <BLUPR12MB0721B0824892B985DC807471A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
References: <alpine.DEB.2.20.1705232307330.2409@nanos>
 <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
 <alpine.DEB.2.20.1705260841250.1902@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-sn1nam02on0068.outbound.protection.outlook.com ([104.47.36.68]:9472
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S971052AbdEZJdO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 May 2017 05:33:14 -0400
In-Reply-To: <alpine.DEB.2.20.1705260841250.1902@nanos>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "Xue, Ken" <Ken.Xue@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>

Hi Thomas,

Thanks  for the prompt reply. Agree on points.

we will validate at our end and shall provide the update.


Nehal
-----Original Message-----
From: Thomas Gleixner [mailto:tglx@linutronix.de]=20
Sent: Friday, May 26, 2017 12:19 PM
To: Shah, Nehal-bakulchandra <Nehal-bakulchandra.Shah@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>; Linus Walleij <linus.walleij@linar=
o.org>; linux-gpio@vger.kernel.org; Borislav Petkov <bp@alien8.de>; Xue, Ke=
n <Ken.Xue@amd.com>; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; stable@v=
ger.kernel.org
Subject: RE: [PATCH] pinctrl/amd: Use regular interrupt instead of chained

Nehal,

On Fri, 26 May 2017, Shah, Nehal-bakulchandra wrote:
> Thanks for the patch. However, we have received this issue from=20
> multiple people and different disro but it occurs only on Gigabyte=20
> hardware. With reference AM4 ryzen board we are not facing this issue. =20
> We are in discussion with gigabyte to check the BIOS part. Once we=20
> have clarity on that, we can consider driver part. Also, this code is=20
> running on multiple platform of different customers so changing=20
> directly at this point of time may be risky in my point of view.=20
> Requesting you to hold this patch till we get clarity on bios end.

It does not matter at all whether this is a problem only on GB hardware. Fa=
ct is, that this happened and it will happen again.

The patch does not change any functionality of the driver, it merily makes =
it more robust and spares users the bloody annoying experience of a non boo=
ting machine and the tedious task of figuring out why.

The main objective of the kernel is robustness and not pleasing the ego of =
silicon vendors. We can't prevent the stupidity of BIOS people, we merily c=
an deal with it.

That patch should go into mainline ASAP and backported to stable in order t=
o help those people who bought wreckaged hardware.

Thanks,

	tglx
