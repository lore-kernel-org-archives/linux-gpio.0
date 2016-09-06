From: Peter Rosin <peda@axentia.se>
Subject: Re: [RFC PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Tue, 6 Sep 2016 12:43:28 +0200
Message-ID: <3922b85b-1072-6770-c8d7-58a68ecc290e@axentia.se>
References: <1472130692-14404-1-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZJy6N2uCnPLrM0V=67=xJzge94bYesHjL3r4itgE-9GA@mail.gmail.com>
 <85f4ae6f-2563-967c-1e75-28a864405f53@axentia.se>
 <44e8d692-832f-fbbf-2930-0cd7c140a754@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve1eur01on0100.outbound.protection.outlook.com ([104.47.1.100]:40555
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932180AbcIFPS7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Sep 2016 11:18:59 -0400
In-Reply-To: <44e8d692-832f-fbbf-2930-0cd7c140a754@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 2016-09-06 10:20, Neil Armstrong wrote:
> Hi Linus, Peter,
> 
> On 09/06/2016 08:44 AM, Peter Rosin wrote:
>> I intend to test this, but it might be a couple of days. I need
>> to bring the damn thing out of the closet and find the right
>> cables etc etc. And I of course have other stuff to do as well...
> 
> Is it a DT only platform you intent to test with ? In this case the current version is OK.

Yes, it's DT-only, but I don't expect it to be compatible as I linked
the wrong patch, see below...

*snip*

>> No, we have not, because we depend on yet to be upstreamed drivers
>> for all of our boards, sometimes written by us, sometimes from
>> the CPU vendor. For this driver, we were using a rejected patch
>> to configure the pins from DT in the gpio driver written by
>> Wei Chen [1] 
> 
> Actually it seems the patch was accepted, but it is not enough to handle
> DT completely since the gpio base is incorrect, this was the subject
> of my previous patch [2], make is DT compliant even for IRQ management.
> But having a pinctrl version seens far more reasonable.

Oh crap, wrong link... Here's a better one:
https://patchwork.kernel.org/patch/5437921/

>> One thing I noted at the very end of the patch was that I on
>> first glance did not see any i2c_del_driver call, maybe use the
>> module_i2c_driver macro?
> 
> Well, it's not present in the gpio version and since it manages IRQs, I assume it was
> decided to not use is as a module since it's needed to attach very early.

I just noted the omission, someone else will shirley know better than
me about what to do about it...

(BTW, we're not using interrupts)

Cheers,
Peter

