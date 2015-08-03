From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] arm/dts/ls1021a: Add GPIO controller nodes
Date: Mon, 3 Aug 2015 10:12:06 +0200
Message-ID: <CACRpkdbW4G-JOUVNVnXBV=ee0xB3EgWvXagm0o3gayz=Toy0jw@mail.gmail.com>
References: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
	<1438241239-15178-3-git-send-email-shaveta@freescale.com>
	<CACRpkdaSTOisTP-EdBe8qAFetOx1uehVP6qD9V-pXXmbCmKDLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35492 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063AbbHCIMH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 04:12:07 -0400
Received: by obbop1 with SMTP id op1so93831890obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2015 01:12:06 -0700 (PDT)
In-Reply-To: <CACRpkdaSTOisTP-EdBe8qAFetOx1uehVP6qD9V-pXXmbCmKDLA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shaveta Leekha <shaveta@freescale.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, r64188@freescale.com, Alexandre Courbot <gnurou@gmail.com>

On Mon, Aug 3, 2015 at 10:10 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jul 30, 2015 at 9:27 AM, Shaveta Leekha <shaveta@freescale.com> wrote:
>
>> Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
>> ---
>> Tested on Freescale SDK 1.8, as LS1021aQDS support is not yet complete in upstream
> (...)
>> +               gpio1: gpio@2300000 {
>> +                       compatible = "fsl,ls1021a-gpio";
>
> Please patch
> Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
>
> In patch 2/3 to provide this compatible string binding.

Patch 1/3 I mean. Sorry. So we introduce the binding and
use it.

Yours,
Linus Walleij
