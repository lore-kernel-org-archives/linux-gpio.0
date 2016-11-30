From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [RFC] pinctrl: imx: use radix trees for groups and functions
Date: Wed, 30 Nov 2016 11:19:53 -0200
Message-ID: <CAOMZO5D7z2w2xXWHYp7Qzz8evT-6xM=mL4pswzG-G2M_R0DvqA@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35050 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757069AbcK3NTz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 08:19:55 -0500
In-Reply-To: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Peng Fan <van.freenix@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Hi Gary,

On Thu, Nov 24, 2016 at 9:38 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> This change is inspired from the pinctrl-single architecture.
>
> The problem with current implementation is that it isn't possible
> to add/remove functions and/or groups dynamically. The radix tree
> offers an easy way to do so. The intent is to offer a follow-up
> patch later that will enable the use of pinctrl nodes in dt-overlays.

Maybe you could re-post it including the follow-up patch that allows
the usage  of pinctrl nodes in dt-overlays?

This way we can have a better picture of the final result.

Thanks
