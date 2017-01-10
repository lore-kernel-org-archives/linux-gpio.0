From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Tue, 10 Jan 2017 03:12:29 +0000
Message-ID: <SG2PR06MB11656927D20C8FF6409556488A670@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1923903.Gi7z59W6W3@avalon>
 <SG2PR06MB1165EBCB06C5D473CBAC2F218A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <2671694.94z5NEauGX@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:31461 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1035319AbdAJDRj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 22:17:39 -0500
In-Reply-To: <2671694.94z5NEauGX@avalon>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Laurent,

On Monday, January 09, 2017, Laurent Pinchart wrote:
> From a user point of view, option A looks better to me. However, it has
> two
> drawbacks:
>=20
> - Through deciding what pin groups we make available we create a DT ABI
> that will make it difficult to fix mistakes in case the groups are not
> fine-grained enough.
>=20
> - The data tables in C code are large, and we end up compiling many of
> them in multi-platform kernel, significantly increasing the kernel size.
>=20
> I would thus favour option B.

I'm going to have a good read through the pinctrl documentation in the kern=
el
and have a look at the pinctrl-single driver and see if I can come up with
something that looks like option B.

Also, there are lots of drivers in the pinctrl directory, so I'll have a lo=
ok
at what other SoCs vendors are doing to see if there are any good ideas the=
re.

I can tell you that some of the other Renesas SoCs in pinctrl/sh-pfc like s=
h7757
and sh7724 are also per pin function type parts and might have worked bette=
r
with an option B type driver.
NOTE: I'm not saying we update those old crusty parts, but rather the R-Car
      PFC might be more non-standard.

Regards,
Chris

