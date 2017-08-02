From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: keystone-k2g-evm: Add gpio nodes
Date: Wed, 2 Aug 2017 11:24:22 +0200
Message-ID: <CACRpkdYvCngFxvK6kxA5rH9C8S37Eb8LSafnXks0caAzsq+Ejg@mail.gmail.com>
References: <1501048228-3492-1-git-send-email-j-keerthy@ti.com> <1501048228-3492-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:38089 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752352AbdHBJYY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 05:24:24 -0400
Received: by mail-io0-f177.google.com with SMTP id g13so17987467ioj.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 02:24:23 -0700 (PDT)
In-Reply-To: <1501048228-3492-2-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>

On Wed, Jul 26, 2017 at 7:50 AM, Keerthy <j-keerthy@ti.com> wrote:

> 66AK2G has 2 instances of gpio. The first one has all the 144 GPIOs
> functional( 9 banks with 16 gpios = 144). The second instance has
> only the GPIO0:GPIO67 functional and rest are marked reserved.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Merge this through the ARM SoC tree.

Yours,
Linus Walleij
