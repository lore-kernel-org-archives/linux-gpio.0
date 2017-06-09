From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: gpio: mvebu: switch to regmap for register access
Date: Fri, 09 Jun 2017 12:04:39 +0200
Message-ID: <874lvppjd4.fsf@free-electrons.com>
References: <0fb1464cf9eb44deaf7397ef8b0477ff@svr-chch-ex1.atlnz.lc>
        <e36744644a6c4b2a9a0c73c5f4a9d1b3@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:35015 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751601AbdFIKEl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 06:04:41 -0400
In-Reply-To: <e36744644a6c4b2a9a0c73c5f4a9d1b3@svr-chch-ex1.atlnz.lc> (Chris
        Packham's message of "Fri, 9 Jun 2017 04:09:38 +0000")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

Hi Chris,
 
 On ven., juin 09 2017, Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On 09/06/17 15:36, Chris Packham wrote:
>> Hi Thomas,
>> 
>> Doing some more testing against linux-next and I've found that this
>> patch causes a flood of bad interrupts on my armada-xp-98dx3236 based
>> board (kernel startup output below). If I revert this patch I can boot
>> as normal.
>> 
>> This doesn't happen on the 98dx3236 DB or another Armada-385 based board
>> I have so it's probably related something specific to this board
>> (probably one of the i2c gpios based on the log messages).
>> 
>> Any thoughts on where I should start looking?
>
> Sure enough I think the problem is related to a pca9555 connected to one 
> of the CPU gpios.
>
> 	gpio@27 {
> 		#address-cells = <2>;
> 		#size-cells = <0>;
> 		compatible = "nxp,pca9555";
> 		reg = <0x27>;
> 		gpio-controller;
> 		#gpio-cells = <2>;
> 		interrupt-parent = <&gpio0>;
> 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> 	};
>
> If I remove the interrupt properties I don't see the problem.

I found the bug and I've just sent a fix for it.

Thanks for the report,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
