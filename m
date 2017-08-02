From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] gpio: mxc: use devres for irq generic chip
Date: Wed, 2 Aug 2017 13:41:44 +0200
Message-ID: <CACRpkdbWWZEk6Ov8=ajNmBp57M4NwTpGcRBgtLS_5SKbr=ed0A@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-5-brgl@bgdev.pl>
 <2153314.vmO4TSUiTO@ws-stein> <CAHp75Vd_AG_nHSN=GYW95yh0AHmQGuUdJTFC-6iCjw-Xa9vHrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:37048 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752191AbdHBLlq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 07:41:46 -0400
Received: by mail-io0-f179.google.com with SMTP id c74so19278179iod.4
        for <linux-gpio@vger.kernel.org>; Wed, 02 Aug 2017 04:41:45 -0700 (PDT)
In-Reply-To: <CAHp75Vd_AG_nHSN=GYW95yh0AHmQGuUdJTFC-6iCjw-Xa9vHrw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 2, 2017 at 10:32 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Aug 2, 2017 at 11:09 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
>> On Wednesday 02 August 2017 09:51:24, Bartosz Golaszewski wrote:
>>> Use resource managed variants of irq_alloc_generic_chip() and
>>> irq_setup_generic_chip().
>>
>> Is this really useful for drivers which can only be built-in?
>
> But you still can unbind the driver and its ->remove() will be called
> (in case of no remove, devres still on the table), right?

Maybe the patches need to be combines with a
.suppress_bind_attrs = true in the driver struct?

I backed out the patches I applied, I thought the series were older,
sorry stressed at work today.

Yours,
Linus Walleij
