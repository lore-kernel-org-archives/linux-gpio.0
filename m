From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v2 2/3] pinctrl: imx: use radix trees for groups and functions
Date: Fri, 30 Dec 2016 14:21:08 +0100
Message-ID: <CACRpkdYwX-qete=2vYi4a8t707H+YnNZOyNHb06pDcuyZn3pmQ@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-3-gary.bisson@boundarydevices.com>
 <CACRpkda26Dzh9c-hkPzY=ikYSwAED2xZGi3N4CVuzMB=1YL+iQ@mail.gmail.com> <CAAMH-yutJN3wLYze9Ao120LcCcE7F7JbpZyeghg-vB9pyFObkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:34677 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753845AbcL3NVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 08:21:09 -0500
Received: by mail-qt0-f176.google.com with SMTP id d45so172396050qta.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 05:21:09 -0800 (PST)
In-Reply-To: <CAAMH-yutJN3wLYze9Ao120LcCcE7F7JbpZyeghg-vB9pyFObkw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

n Thu, Dec 29, 2016 at 10:44 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> On Tue, Dec 27, 2016 at 11:07 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>>
>> On Fri, Dec 2, 2016 at 5:35 PM, Gary Bisson
>> <gary.bisson@boundarydevices.com> wrote:
>>
>> > This change is inspired from the pinctrl-single architecture.
>> >
>> > The problem with current implementation is that it isn't possible
>> > to add/remove functions and/or groups dynamically. The radix tree
>> > offers an easy way to do so. The intent is to offer a follow-up
>> > patch later that will enable the use of pinctrl nodes in dt-overlays.
>> >
>> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>>
>> This patch doesn't apply on v4.10-rc1 so please rebase it
>> on the mainline and resend as v3, include Fabio's review tag.
>
> Actually it applies if the first patch of this v2 series is also applied first.
> https://patchwork.kernel.org/patch/9458883/
> https://patchwork.kernel.org/patch/9458889/

Heh if it is part of a patch series then send it as part of the series
and don't confuse me ;)

> The 3rd patch of the series can be discarded though since it was just
> an example to show the benefit of the first two.
>
> I guess someone needs to also ack/review the first one. Because
> switching to radix tree keeping the const qualifier of the driver
> structure isn't really useful.

Sure, Fabio?

Yours,
Linus Walleij
