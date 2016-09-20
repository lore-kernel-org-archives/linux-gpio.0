From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mvebu: orion5x: Generalise mv88f5181l support
 for 88f5181
Date: Tue, 20 Sep 2016 23:54:48 +0200
Message-ID: <CACRpkdbo6JmR=K58KQ_J0Gd5_gLqub65watU-iEabQ0rWdeVpQ@mail.gmail.com>
References: <20160920162635.4195-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34414 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751729AbcITVyt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2016 17:54:49 -0400
Received: by mail-oi0-f53.google.com with SMTP id a62so38853615oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2016 14:54:49 -0700 (PDT)
In-Reply-To: <20160920162635.4195-1-gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jamie Lentin <jm@lentin.co.uk>

On Tue, Sep 20, 2016 at 6:26 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> From: Jamie Lentin <jm@lentin.co.uk>
>
> As far as I'm aware the mv88f5181-b1 and mv88f5181l are the same at the
> pinctrl level, so re-use the definitions for both.
>
> [gregory.clement@free-electrons.com: fix commit title]
> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Is this the patch from your pull request?
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Or do you prefer that I take it into the pinctrl tree?

Yours,
Linus Walleij
