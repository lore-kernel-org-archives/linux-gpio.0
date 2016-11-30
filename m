From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] pinctrl: imx: use radix trees for groups and functions
Date: Wed, 30 Nov 2016 13:48:21 +0100
Message-ID: <CACRpkdYN0vc2D2=X9xCwA3JucDj8fuSCjWRcLnZmZCGTWCuq_A@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:33726 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932836AbcK3MsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 07:48:22 -0500
Received: by mail-qk0-f178.google.com with SMTP id x190so207849843qkb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 04:48:22 -0800 (PST)
In-Reply-To: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Peng Fan <van.freenix@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Fri, Nov 25, 2016 at 12:38 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> This change is inspired from the pinctrl-single architecture.
>
> The problem with current implementation is that it isn't possible
> to add/remove functions and/or groups dynamically. The radix tree
> offers an easy way to do so. The intent is to offer a follow-up
> patch later that will enable the use of pinctrl nodes in dt-overlays.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I would like to see some feedback from one of the driver maintainers?
Else just resend it without RFC I guess.

Yours,
Linus Walleij
