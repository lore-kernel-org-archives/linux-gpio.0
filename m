From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] pinctrl: mvebu: use correct MPP sel value for dev pins
Date: Wed, 16 May 2018 20:58:35 +0000
Message-ID: <1ebc15b559d74ace9a1171548f79f978@svr-chch-ex1.atlnz.lc>
References: <20180507022555.31645-1-chris.packham@alliedtelesis.co.nz>
 <CACRpkdbAaMrHJ8TjJTtNyVtoOSRAEf2Z8gRthFH0ze4RyybBag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 17/05/18 00:55, Linus Walleij wrote:=0A=
> On Mon, May 7, 2018 at 4:25 AM, Chris Packham=0A=
> <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> The "dev" function is selected with the value 0x4 not 0x01.=0A=
>>=0A=
>> Fixes: commit d7ae8f8dee7f ("pinctrl: mvebu: pinctrl driver for 98DX3236=
 SoC")=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> =0A=
> Patch applied.=0A=
> =0A=
> Does it need to go into fixes? Stable?=0A=
=0A=
By "fixes" do you mean into 4.17? Yes please.=0A=
=0A=
Stable would be good. Although all the boards I'm aware of rely on the =0A=
pin configuration being done by the bootloader so I've not heard of =0A=
anyone experiencing problems.=0A=
=0A=
