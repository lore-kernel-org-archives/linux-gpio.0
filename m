From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Mon, 7 Aug 2017 18:08:32 +0530
Message-ID: <3fc67c9e-4a03-cda0-1cd1-02f995fd9ab2@ti.com>
References: <1500543738-9696-1-git-send-email-j-keerthy@ti.com>
 <1500543738-9696-3-git-send-email-j-keerthy@ti.com>
 <32ca2ace-bca3-4819-d3fb-10331cd0213c@ti.com>
 <CACRpkdanDK338_eEKpekD39MedJKbCkFMtLbGske3QpTQKv28g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:62541 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753216AbdHGMjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 08:39:01 -0400
In-Reply-To: <CACRpkdanDK338_eEKpekD39MedJKbCkFMtLbGske3QpTQKv28g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tero Kristo <t-kristo@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, fcooper@ti.com, Suman Anna <s-anna@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>



On Monday 07 August 2017 05:42 PM, Linus Walleij wrote:
> On Wed, Aug 2, 2017 at 12:59 PM, Keerthy <j-keerthy@ti.com> wrote:
>> On Thursday 20 July 2017 03:12 PM, Keerthy wrote:
>>> Currently davinci_gpio_irq_setup return value is ignored. Handle the
>>> return value appropriately.
>>
>> Linus,
>>
>> Any comments on this? Sorry if i pinged too soon. The rest 2 of this
>> series were pulled by you. So just wanted to check on this one if you
>> had specific comments.
> 
> I got the impression you would send this in a series with a new
> patch requested by Johan.
> 
> Do we have consensus that this patch should be applied as-is?

IIUC a separate patch is needed to implement remove function. This can
still be independent of that.

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1450395.html

> 
> Yours,
> Linus Walleij
> 
