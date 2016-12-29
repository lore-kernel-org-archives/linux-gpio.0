From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [RFC v2 2/3] pinctrl: imx: use radix trees for groups and functions
Date: Thu, 29 Dec 2016 10:44:53 +0100
Message-ID: <CAAMH-yutJN3wLYze9Ao120LcCcE7F7JbpZyeghg-vB9pyFObkw@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-3-gary.bisson@boundarydevices.com>
 <CACRpkda26Dzh9c-hkPzY=ikYSwAED2xZGi3N4CVuzMB=1YL+iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f174.google.com ([209.85.161.174]:36694 "EHLO
        mail-yw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752402AbcL2Joy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2016 04:44:54 -0500
Received: by mail-yw0-f174.google.com with SMTP id a10so203709757ywa.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2016 01:44:54 -0800 (PST)
In-Reply-To: <CACRpkda26Dzh9c-hkPzY=ikYSwAED2xZGi3N4CVuzMB=1YL+iQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Hi Linus, All,

On Tue, Dec 27, 2016 at 11:07 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
>
> On Fri, Dec 2, 2016 at 5:35 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>
> > This change is inspired from the pinctrl-single architecture.
> >
> > The problem with current implementation is that it isn't possible
> > to add/remove functions and/or groups dynamically. The radix tree
> > offers an easy way to do so. The intent is to offer a follow-up
> > patch later that will enable the use of pinctrl nodes in dt-overlays.
> >
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>
> This patch doesn't apply on v4.10-rc1 so please rebase it
> on the mainline and resend as v3, include Fabio's review tag.

Actually it applies if the first patch of this v2 series is also applied first.
https://patchwork.kernel.org/patch/9458883/
https://patchwork.kernel.org/patch/9458889/

The 3rd patch of the series can be discarded though since it was just
an example to show the benefit of the first two.

I guess someone needs to also ack/review the first one. Because
switching to radix tree keeping the const qualifier of the driver
structure isn't really useful.

Regards,
Gary
