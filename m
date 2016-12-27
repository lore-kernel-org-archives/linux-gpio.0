From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v2 2/3] pinctrl: imx: use radix trees for groups and functions
Date: Tue, 27 Dec 2016 14:05:46 +0100
Message-ID: <CACRpkdYvE1mGKi1uyEK0U9hvm5kgpjM9ZUAp3wL3f+LxO-0MHw@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-3-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:34223 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754884AbcL0NFs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Dec 2016 08:05:48 -0500
Received: by mail-qt0-f182.google.com with SMTP id d45so104789911qta.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2016 05:05:47 -0800 (PST)
In-Reply-To: <20161202163520.22927-3-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Fri, Dec 2, 2016 at 5:35 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> This change is inspired from the pinctrl-single architecture.
>
> The problem with current implementation is that it isn't possible
> to add/remove functions and/or groups dynamically. The radix tree
> offers an easy way to do so. The intent is to offer a follow-up
> patch later that will enable the use of pinctrl nodes in dt-overlays.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I would like some ACK from the i.MX pinctrl maintainers.

Fabio, do you have the context you need to ack/nack this?

Yours,
Linus Walleij
