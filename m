From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/7] drivers/gpio: don't check resource with devm_ioremap_resource
Date: Wed, 15 Jan 2014 14:51:25 +0100
Message-ID: <CACRpkdY1FuRoSFAPT8qUybzrizN_tEgxB41dwW_-uEWdFPb0jA@mail.gmail.com>
References: <1389700739-3696-1-git-send-email-wsa@the-dreams.de>
	<1389700739-3696-7-git-send-email-wsa@the-dreams.de>
	<CACRpkdYymB4i7Ju5MMNXWVe5nB6_NbWHwrPbOK2KeT0Ji-RzQg@mail.gmail.com>
	<52D684E9.6080308@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:35049 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbaAONvZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2014 08:51:25 -0500
Received: by mail-oa0-f41.google.com with SMTP id i4so1220332oah.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2014 05:51:25 -0800 (PST)
In-Reply-To: <52D684E9.6080308@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Kevin Hilman <khilman@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 15, 2014 at 1:54 PM, Sekhar Nori <nsekhar@ti.com> wrote:
> On Wednesday 15 January 2014 02:58 PM, Linus Walleij wrote:

>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> The DaVinci maintainers are queuing GPIO patches for their driver
>> for this merge window, so requesting them to apply this patch.
>
> I wont be sending any more pull requests for v3.14. Even if I send, the
> ARM-SoC maintainers will not take it anyway.

But as it is a fix I believe the ARM SoC maintainers will apply it
directly to the davinci branch.

Wolfram: I suggest you send this patch with my ACK directly
to arm@kernel.org and ask it to be applied to the davinci branch
in the ARM SoC tree.

Yours,
Linus Walleij
