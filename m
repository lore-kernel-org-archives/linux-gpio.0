From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2] gpio: mvebu: fix regmap_update_bits usage
Date: Sun, 11 Jun 2017 21:54:14 +0000
Message-ID: <192e8364fed24e91a12b5dec78fa06f0@svr-chch-ex1.atlnz.lc>
References: <20170609100917.26660-1-gregory.clement@free-electrons.com>
 <20170609142144.5f6c916b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:59305 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751911AbdFKVyT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2017 17:54:19 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 10/06/17 00:22, Ralph Sennhauser wrote:=0A=
> On Fri,  9 Jun 2017 12:09:17 +0200=0A=
> Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:=0A=
> =0A=
>> In some place in the driver regmap_update_bits was misused. Indeed the=
=0A=
>> last argument is not the value of the bit (or group of bits) itself=0A=
>> but the mask value inside the register.=0A=
>>=0A=
>> So when setting the bit N, then the value must be BIT(N) and not 1.=0A=
>>=0A=
>> CC: Chris Packham <Chris.Packham@alliedtelesis.co.nz>=0A=
>> CC: Ralph Sennhauser <ralph.sennhauser@gmail.com>=0A=
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>=0A=
>> ---=0A=
> =0A=
> Hi Gregory,=0A=
> =0A=
> Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>=0A=
> =0A=
> Thanks for the prompt fix=0A=
> Ralph=0A=
=0A=
Also works for me=0A=
=0A=
Tested-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>=0A=
