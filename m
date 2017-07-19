From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] simulated interrupts
Date: Wed, 19 Jul 2017 18:28:53 +0300
Message-ID: <CAHp75Vf3HonXDDhN3sbGW2hP-kyRzPjfsSLbDDOj+aQSMjmafA@mail.gmail.com>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
 <alpine.DEB.2.20.1707191424190.2286@nanos> <CAMRc=McO4L59zDT4QJSmqsdOpLfAv4NDyjddd57Prz2hjE5zWw@mail.gmail.com>
 <alpine.DEB.2.20.1707191557390.2286@nanos> <7c98e6b0-3dbd-52f7-79d5-4ec64bf8a66e@arm.com>
 <CAHp75Vdu1Eiyuo0WCg+Cx7aifcaQ-1ipGZ4cAPCwZ8D+id882Q@mail.gmail.com> <alpine.DEB.2.20.1707191652330.2286@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35988 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932786AbdGSP2z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2017 11:28:55 -0400
In-Reply-To: <alpine.DEB.2.20.1707191652330.2286@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Documentation List <linux-doc@vger.kernel.org>

On Wed, Jul 19, 2017 at 5:53 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Wed, 19 Jul 2017, Andy Shevchenko wrote:
>> On Wed, Jul 19, 2017 at 5:19 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:

>> > echo 1 >/proc/irq/9/trigger
>> > (or the corresponding /sys/kernel/debug/irq/irqs/ interface if we want to make sure that this
>> > is really not for production use...).
>>
>> or /sys/kernel/irq as a successor of /proc/irq
>
> /sys/kernel/debug/irq/irqs/ is already there and it's DEBUG and not
> something which is in the regular sysfs maze.

Yep. My point was "not to extend /proc/irq interface". From the
description of the series it indeed looks suitable rather for debug.

-- 
With Best Regards,
Andy Shevchenko
