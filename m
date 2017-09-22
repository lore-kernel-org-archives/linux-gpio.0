From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Mask interrupts on driver probe
Date: Fri, 22 Sep 2017 15:39:06 +0200
Message-ID: <CACRpkdY72GEJCFqhjgkU0-5=tV1rE5D_J88voicTnqMS=RO=Mw@mail.gmail.com>
References: <20170921192003.17324-1-kyle.roeschley@ni.com> <20170922054712.GW4630@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:46029 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbdIVNjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 09:39:07 -0400
Received: by mail-io0-f171.google.com with SMTP id g32so3103501ioj.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 06:39:07 -0700 (PDT)
In-Reply-To: <20170922054712.GW4630@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Kyle Roeschley <kyle.roeschley@ni.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 22, 2017 at 7:47 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Sep 21, 2017 at 02:20:03PM -0500, Kyle Roeschley wrote:
>> Powering off the system on Apollo Lake does not clear the interrupt
>> enable registers for the GPIOs. To avoid an interrupt storm on driver
>> probe, clear all interrupt enables before enabling our interrupt line.
>
> It is up to the BIOS to set the proper mask and program the pads
> accordingly. Which platform and BIOS this is?
>
> I would rather not do this because it might cause other problems.

If this needs to happen llike this on some systems or even
just on some BIOS revisions the target systems and/or BIOS
revisions certainly need to be detected first.

Yours,
Linus Walleij
