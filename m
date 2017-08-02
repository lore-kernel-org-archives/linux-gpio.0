From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 4/6] gpio: mxc: use devres for irq generic chip
Date: Wed, 2 Aug 2017 13:54:09 +0200
Message-ID: <CAMRc=MfDNQTmppGZ-3raD+z3JveT=sVG91OfKy+Ef+rMZmhrLA@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-5-brgl@bgdev.pl>
 <2153314.vmO4TSUiTO@ws-stein> <CAHp75Vd_AG_nHSN=GYW95yh0AHmQGuUdJTFC-6iCjw-Xa9vHrw@mail.gmail.com>
 <CACRpkdbWWZEk6Ov8=ajNmBp57M4NwTpGcRBgtLS_5SKbr=ed0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:36846 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753018AbdHBLyK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 07:54:10 -0400
Received: by mail-qk0-f178.google.com with SMTP id d136so25095827qkg.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 04:54:10 -0700 (PDT)
In-Reply-To: <CACRpkdbWWZEk6Ov8=ajNmBp57M4NwTpGcRBgtLS_5SKbr=ed0A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-08-02 13:41 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Aug 2, 2017 at 10:32 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, Aug 2, 2017 at 11:09 AM, Alexander Stein
>> <alexander.stein@systec-electronic.com> wrote:
>>> On Wednesday 02 August 2017 09:51:24, Bartosz Golaszewski wrote:
>>>> Use resource managed variants of irq_alloc_generic_chip() and
>>>> irq_setup_generic_chip().
>>>
>>> Is this really useful for drivers which can only be built-in?
>>
>> But you still can unbind the driver and its ->remove() will be called
>> (in case of no remove, devres still on the table), right?
>
> Maybe the patches need to be combines with a
> .suppress_bind_attrs = true in the driver struct?
>
> I backed out the patches I applied, I thought the series were older,
> sorry stressed at work today.
>

gpio-sodaville sets .supress_bind_attrs to true. Other built-in
drivers need updates for that, but I think this could go in a separate
series as using devres doesn't affect the bind/unbind
functionality/issue.

Thanks,
Bartosz
