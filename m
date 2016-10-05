From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed, 5 Oct 2016 17:23:08 +0800
Message-ID: <CAFv23Qkv7EGQy+ObQukaArdyeeQhWTyUmvk=gxycwV_YD3dd2Q@mail.gmail.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
 <CAEhpT-WvLqfzfxrsRB_+tifq4tESnz_HqdaFb=0VUjff2=3-mg@mail.gmail.com> <20161005085502.GY1765@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:33712 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbcJEJXK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 05:23:10 -0400
Received: by mail-qk0-f170.google.com with SMTP id n189so140377213qke.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2016 02:23:09 -0700 (PDT)
In-Reply-To: <20161005085502.GY1765@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Calvin Johnson <linux.cj@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

I have no knowledge of those pin definitions, and with 3.19 kernel,
those 2 blacklisted machines work well.
There is no pinctrl-sunrisepoint in 3.19 kernel, so I think this
driver is not critical for the machines,
that why I blacklisted the machines in the driver.

Or maybe anyone of you can give me some hints, which pin related to
the touchscreen which is connected on USB port.
I can do some test to see if I can find other solution.
The issue we encountered is that closing the lid to enter S3 and then
open the lid to wake up, the touchscreen fails to work.
By other ways to enter S3, pm-suspend, or click from GUI, the
touchscreen still works after waking up.
Thanks.


2016-10-05 16:55 GMT+08:00 Mika Westerberg <mika.westerberg@linux.intel.com>:
> On Wed, Oct 05, 2016 at 01:27:31PM +0530, Calvin Johnson wrote:
>> On Wed, Oct 5, 2016 at 11:27 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
>> > The touchscreen on some Dell machines stop working after
>> > closing and opening the lid after this driver is introduced.
>> > So, I add a dmi list to black out those machines that doesn't
>> > work well with this driver.
>>
>> Why don't you find out what in the driver is causing this problem,
>> instead of avoiding the driver  loading altogether?
>
> Exactly!
