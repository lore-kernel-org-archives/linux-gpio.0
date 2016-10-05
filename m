From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed, 5 Oct 2016 20:47:38 +0800
Message-ID: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
 <CAEhpT-WvLqfzfxrsRB_+tifq4tESnz_HqdaFb=0VUjff2=3-mg@mail.gmail.com>
 <20161005085502.GY1765@lahna.fi.intel.com> <CAFv23Qkv7EGQy+ObQukaArdyeeQhWTyUmvk=gxycwV_YD3dd2Q@mail.gmail.com>
 <20161005093256.GB1765@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:33226 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbcJEMzg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 08:55:36 -0400
Received: by mail-qt0-f169.google.com with SMTP id s49so36603201qta.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2016 05:55:35 -0700 (PDT)
In-Reply-To: <20161005093256.GB1765@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Calvin Johnson <linux.cj@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The patch doesn't work, so I filed a bug on kernel bugzilla[1]
Closing and opening the lid to trigger this issue doesn't have any
explicit error message in dmesg,
but anyway, I attached all these logs on bugzilla.
Thanks.

1. https://bugzilla.kernel.org/show_bug.cgi?id=176361

2016-10-05 17:32 GMT+08:00 Mika Westerberg <mika.westerberg@linux.intel.com>:
> On Wed, Oct 05, 2016 at 05:23:08PM +0800, AceLan Kao wrote:
>> Or maybe anyone of you can give me some hints, which pin related to
>> the touchscreen which is connected on USB port.
>> I can do some test to see if I can find other solution.
>> The issue we encountered is that closing the lid to enter S3 and then
>> open the lid to wake up, the touchscreen fails to work.
>> By other ways to enter S3, pm-suspend, or click from GUI, the
>> touchscreen still works after waking up.
>
> You can start by either filing a bug in the kernel bugzilla or
> alternatively send me full dmesg of the error. Also include output of
> /proc/interrupts before and after suspend.
>
> You can also try the following patch:
>
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=x86/urgent&id=db91aa793ff984ac048e199ea1c54202543952fe
>
> It fixes a memory corruption during suspend/resume which might be
> related to the issue you are seeing.
