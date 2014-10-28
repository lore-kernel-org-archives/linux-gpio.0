From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] GPIO: MIPS: ralink: add gpio driver for ralink MT762x SoC
Date: Tue, 28 Oct 2014 10:44:19 +0100
Message-ID: <CACRpkdbm9mNz1=Xe+=q==AGmeSmWeAsAW4XS1gPwjjzBVWk_eQ@mail.gmail.com>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
	<1412972930-16777-4-git-send-email-blogic@openwrt.org>
	<CAAVeFu+kC0RFxVfuhukFPdDLxMd3v7Eo+=7BYJ4sUh1cGSkJzw@mail.gmail.com>
	<54449E43.40304@openwrt.org>
	<CAAVeFuKgbsrZr88qXVf9DCJEmEjLx4ZMbwjZ=szQKMSihW7=-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:48012 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752544AbaJ1JoT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 05:44:19 -0400
Received: by mail-ie0-f174.google.com with SMTP id x19so243581ier.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 02:44:19 -0700 (PDT)
In-Reply-To: <CAAVeFuKgbsrZr88qXVf9DCJEmEjLx4ZMbwjZ=szQKMSihW7=-Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: John Crispin <blogic@openwrt.org>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 20, 2014 at 8:27 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Mon, Oct 20, 2014 at 2:31 PM, John Crispin <blogic@openwrt.org> wrote:

>> i am not sure i have seen another instance of dts using a count index
>> for the following properties array/table/... do you have an example of
>> a driver doing so ?
>
> gpio-bcm-kona does something close: the number of interrupts specified
> indicate how many banks the chip has. I would not rely too much on
> existing bindings to decide what a "good" practice is.

Overall honestly I think too much responsibility of DT bindings
(and now also ACPI!) is pushed to the subsystem maintainers,
we are Linux GPIO experts, not really hardware description experts.

We do a best effort but the current practice of letting the subsystem
maintainers have the final word on all device tree bindings is
not optimal, I would like to have a DT/OF persons Reviewed-by tag
on any substantially new binding that is not just a copy of what
every other GPIO driver is doing.

Yours,
Linus Walleij
