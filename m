From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: gpio: mvebu: switch to regmap for register access
Date: Fri, 9 Jun 2017 04:09:38 +0000
Message-ID: <e36744644a6c4b2a9a0c73c5f4a9d1b3@svr-chch-ex1.atlnz.lc>
References: <0fb1464cf9eb44deaf7397ef8b0477ff@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57442 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750829AbdFIEJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 00:09:45 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E5F3F83660
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2017 16:09:41 +1200 (NZST)
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Gregory Clement <gregory.clement@free-electrons.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

On 09/06/17 15:36, Chris Packham wrote:=0A=
> Hi Thomas,=0A=
> =0A=
> Doing some more testing against linux-next and I've found that this=0A=
> patch causes a flood of bad interrupts on my armada-xp-98dx3236 based=0A=
> board (kernel startup output below). If I revert this patch I can boot=0A=
> as normal.=0A=
> =0A=
> This doesn't happen on the 98dx3236 DB or another Armada-385 based board=
=0A=
> I have so it's probably related something specific to this board=0A=
> (probably one of the i2c gpios based on the log messages).=0A=
> =0A=
> Any thoughts on where I should start looking?=0A=
=0A=
Sure enough I think the problem is related to a pca9555 connected to one =
=0A=
of the CPU gpios.=0A=
=0A=
	gpio@27 {=0A=
		#address-cells =3D <2>;=0A=
		#size-cells =3D <0>;=0A=
		compatible =3D "nxp,pca9555";=0A=
		reg =3D <0x27>;=0A=
		gpio-controller;=0A=
		#gpio-cells =3D <2>;=0A=
		interrupt-parent =3D <&gpio0>;=0A=
		interrupts =3D <10 IRQ_TYPE_LEVEL_LOW>;=0A=
	};=0A=
=0A=
If I remove the interrupt properties I don't see the problem.=0A=
