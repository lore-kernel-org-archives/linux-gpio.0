From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/6] gpio: mxc: use devres for irq generic chip
Date: Wed, 2 Aug 2017 11:32:23 +0300
Message-ID: <CAHp75Vd_AG_nHSN=GYW95yh0AHmQGuUdJTFC-6iCjw-Xa9vHrw@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-5-brgl@bgdev.pl>
 <2153314.vmO4TSUiTO@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:37873 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751950AbdHBIcY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2017 04:32:24 -0400
In-Reply-To: <2153314.vmO4TSUiTO@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Aug 2, 2017 at 11:09 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Wednesday 02 August 2017 09:51:24, Bartosz Golaszewski wrote:
>> Use resource managed variants of irq_alloc_generic_chip() and
>> irq_setup_generic_chip().
>
> Is this really useful for drivers which can only be built-in?

But you still can unbind the driver and its ->remove() will be called
(in case of no remove, devres still on the table), right?

-- 
With Best Regards,
Andy Shevchenko
