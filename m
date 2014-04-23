From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 1/2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Wed, 23 Apr 2014 14:55:00 -0700
Message-ID: <CAGVrzcb_6qNKOL-3M7eooeEP6_xWzRArrevwCBR1+KnKPC-Ugw@mail.gmail.com>
References: <1397196885.12922.2.camel@phoenix> <CACRpkdYU7QjQz76c7N07LSowEcXak6dT0G0VpuCTWPzGdAgPqA@mail.gmail.com>
 <CAFRkauAB9qDrMBsg4aP=bHbAfufuesc2=K7D2XBvDAQUJ=oF+Q@mail.gmail.com> <CACRpkdaf6_7hR+vW5qN7Vb2hMEs3vL-OVDtf3TU1Xvn5E5Ku6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:58002 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbaDWVzl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 17:55:41 -0400
Received: by mail-qg0-f48.google.com with SMTP id q108so1664278qgd.7
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 14:55:40 -0700 (PDT)
In-Reply-To: <CACRpkdaf6_7hR+vW5qN7Vb2hMEs3vL-OVDtf3TU1Xvn5E5Ku6A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Axel Lin <axel.lin@ingics.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-04-23 14:53 GMT-07:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Apr 23, 2014 at 4:00 PM, Axel Lin <axel.lin@ingics.com> wrote:
>> 2014-04-23 21:25 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>
>>> -#define RDC321X_MAX_GPIO    58
>>> +#define RDC321X_MAX_GPIO    59
>> Hi Linus,
>>
>> I'm wondering if it is better to define RDC321X_NUM_GPIO  (59) rather
>> than RDC321X_MAX_GPIO.
>> How do you think?
>
> I think yes. It's not a maximum really is it? It's the number available,
> they just mean the max enumerator you can use :-P

Yes, NUM_GPIO is probably a better name for this, and it turns out to
also be the maximum for that particular GPIO chip, then it's all good.
-- 
Florian
