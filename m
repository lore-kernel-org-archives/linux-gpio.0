From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Strange message from Kirkwood pinctrl driver
Date: Wed, 25 Nov 2015 15:55:16 +0100
Message-ID: <CACRpkdbi=iCV1B=u60mNqRWhcgAcs33J-DeB-C=r+2v1eLPbpQ@mail.gmail.com>
References: <CACRpkdah4w-=qHS+q_=Ab-RiJyvbCKY-Rp5Ya0x+F=3DL2iuBA@mail.gmail.com>
	<20151125144645.GE11384@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33234 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752303AbbKYOzR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2015 09:55:17 -0500
Received: by obbww6 with SMTP id ww6so40449767obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2015 06:55:17 -0800 (PST)
In-Reply-To: <20151125144645.GE11384@lunn.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Simon Guinot <simon.guinot@sequanux.org>, Jason Cooper <jason@lakedaemon.net>

On Wed, Nov 25, 2015 at 3:46 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, Nov 25, 2015 at 11:27:46AM +0100, Linus Walleij wrote:
>> Hi Sebastian,
>>
>> trying to use the Kirkwood pinctrl driver with compatible =
>> "marvell,88f6192-pinctrl";
>> on a Pogoplug series 4 yields the following message when instantiating
>> the driver:
>>
>> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 36
>> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 37
>> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 38
>> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 39
>> kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 40
>
> Hi Linus
>
> Humm, interesting. I don't remember it doing that before. I will look
> into this in the next couple of days.

There are only few devices using it: it is declared in
kirkwood-6192.dtsi and that is just used by:

kirkwood-blackarmor-nas220.dts
kirkwood-laplug.dts
kirkwood-rd88f6192.dts
... and my new device tree

Interestingly, kirkwood-ns2[lite|mini].dts specifies it's compatible
with "marvell,kirkwood-88f6192" but instead includes
kirkwood-ns2-common.dtsi which includes
kirkwood-6281.dtsi. I haven't wrapped my head around that
one, I suspect it's a bug.

Yours,
Linus Walleij
