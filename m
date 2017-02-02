From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler
Date: Thu, 2 Feb 2017 15:48:41 +0100
Message-ID: <CACRpkdb6HVr3azhwJmF3bA=6TazRP4mfhA5oNQ_Z7vA53b1PzQ@mail.gmail.com>
References: <20170130113528.17838-1-alexander.stein@systec-electronic.com>
 <20170130115149.GM17297@lahna.fi.intel.com> <1572471.RPgeE8YS6g@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:36302 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751045AbdBBOsr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 09:48:47 -0500
Received: by mail-io0-f180.google.com with SMTP id j13so182935888iod.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2017 06:48:47 -0800 (PST)
In-Reply-To: <1572471.RPgeE8YS6g@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Feb 1, 2017 at 8:47 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Monday 30 January 2017 13:51:49, Mika Westerberg wrote:
>> On Mon, Jan 30, 2017 at 12:35:28PM +0100, Alexander Stein wrote:
>> > According to VLI64 Intel Atom E3800 Specification Update (#329901)
>> > concurrent read accesses may result in returning 0xffffffff and write
>> > accesses may be dropped silently.
>> > To workaround all accesses must be protected by locks.
>> >
>> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
>>
>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Should probably go to stable as well.
>
> Sure, but I don't know which stable kernels this should go in.

More often than not, I *think* Greg will figure that out by:
"does it apply?" "then yes"

Yours,
Linus Walleij
