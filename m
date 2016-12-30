From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix DT bindings for marvell,kirkwood-pinctrl
Date: Fri, 30 Dec 2016 08:37:52 +0100
Message-ID: <CACRpkdaUY1sss+Gz56Du07MqRfoPf5-Yeo=_ne2P2QrLYFgLXA@mail.gmail.com>
References: <20161213230827.GA5286@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:35238 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752320AbcL3Hhx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 02:37:53 -0500
Received: by mail-qk0-f175.google.com with SMTP id u25so280636696qki.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2016 23:37:53 -0800 (PST)
In-Reply-To: <20161213230827.GA5286@andreas>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 14, 2016 at 12:08 AM, Andreas Klinger <ak@it-klinger.de> wrote:

> On Marvell mv88f6180 mpp pins range from 0 to 19 as well as from 35 to 44.
> This is already fixed in commit: 9573e7923007961799beff38bc5c5a7635634eef
>
> This is the documentation change for above commit.
>
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>

Patch applied.

Yours,
Linus Walleij
