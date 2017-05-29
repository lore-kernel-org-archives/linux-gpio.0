From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] gpio: of: Reflect decoupling of open collector and
 active low/high
Date: Mon, 29 May 2017 11:06:17 +0200
Message-ID: <CACRpkdYJf=DhdBbSMbyMg8yW2KQCN2PG5uRPLWY=pvWUcWbhNw@mail.gmail.com>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33662 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750942AbdE2JGT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 05:06:19 -0400
Received: by mail-io0-f172.google.com with SMTP id p24so38065497ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 02:06:18 -0700 (PDT)
In-Reply-To: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, Frank Rowand <frowand.list@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>

On Tue, May 23, 2017 at 4:47 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> Commit 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with
> active low/high") decoupled the open collector outputs from active
> low/high but did not update the documentation.
>
> Update the device tree documentation to correctly reflect this new
> separation between the two concepts.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Awesome, patch applied.

Yours,
Linus Walleij
