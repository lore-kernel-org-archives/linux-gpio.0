From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] ARM: pxa: delete the custom GPIO header
Date: Mon, 18 Nov 2013 11:23:42 +0100
Message-ID: <CACRpkda72DWkRctD2cBEZWdewpoz3DnXPeA=znNcswJVCcJTpw@mail.gmail.com>
References: <1380183077-27407-1-git-send-email-linus.walleij@linaro.org>
	<20131115124522.GA1913@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:53366 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266Ab3KRKXm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:23:42 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp4so6632088obc.8
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:23:42 -0800 (PST)
In-Reply-To: <20131115124522.GA1913@n2100.arm.linux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@marvell.com>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Eric Miao <eric.y.miao@gmail.com>

On Fri, Nov 15, 2013 at 1:45 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Sep 26, 2013 at 10:11:17AM +0200, Linus Walleij wrote:
>> The PXA sub-architecture appears to have a custom <mach/gpio.h>
>> for no reason whatsoever. The file became completely empty
>> after Haojian removed the remaining content in
>> commit 157d2644cb0c1e71a18baaffca56d2b1d0ebf10f
>> "ARM: pxa: change gpio to platform device".
>>
>> That commit added these two lines:
>>
>> However it seems like deleting the file has no effect
>> whatsoever on the kernel compilation.
>
> This has broken pxa25x_udc - it seems that it was using this path to get
> hold of mach/hardware.h, and now that it doesn't have that, it gets lots
> of build errors.

OK I'm onto it.

Yours,
Linus Walleij
