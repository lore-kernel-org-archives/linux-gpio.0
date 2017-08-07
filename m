From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Mon, 7 Aug 2017 14:12:04 +0200
Message-ID: <CACRpkdanDK338_eEKpekD39MedJKbCkFMtLbGske3QpTQKv28g@mail.gmail.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com>
 <1500543738-9696-3-git-send-email-j-keerthy@ti.com> <32ca2ace-bca3-4819-d3fb-10331cd0213c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34098 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753024AbdHGMMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 08:12:06 -0400
Received: by mail-io0-f182.google.com with SMTP id o9so1908638iod.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 05:12:06 -0700 (PDT)
In-Reply-To: <32ca2ace-bca3-4819-d3fb-10331cd0213c@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>

On Wed, Aug 2, 2017 at 12:59 PM, Keerthy <j-keerthy@ti.com> wrote:
> On Thursday 20 July 2017 03:12 PM, Keerthy wrote:
>> Currently davinci_gpio_irq_setup return value is ignored. Handle the
>> return value appropriately.
>
> Linus,
>
> Any comments on this? Sorry if i pinged too soon. The rest 2 of this
> series were pulled by you. So just wanted to check on this one if you
> had specific comments.

I got the impression you would send this in a series with a new
patch requested by Johan.

Do we have consensus that this patch should be applied as-is?

Yours,
Linus Walleij
