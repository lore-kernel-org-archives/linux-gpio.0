From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/6] pinctrl: Add a possibility to configure pins from
 a gpiolib based drivers
Date: Wed, 18 Jan 2017 10:26:39 +0100
Message-ID: <CACRpkdbfkpdYU7knh3Wo5KW0_w-q+o7J3kz1BLfap-fRYAgmaw@mail.gmail.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
 <20170110143201.53539-4-mika.westerberg@linux.intel.com> <CACRpkdbFotEknW2dK0ouc2HWLLhL-MERJS_BvCm5ux5hrEsQsg@mail.gmail.com>
 <20170111133304.GQ2330@lahna.fi.intel.com> <20170112092255.GX2330@lahna.fi.intel.com>
 <CACRpkdZjQipUkPxGTzJBF_L0EK8dg4wiW5DSCTft15aJ0UiLxQ@mail.gmail.com> <20170113163324.GI25630@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:32886 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751478AbdARJ0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 04:26:40 -0500
Received: by mail-qt0-f176.google.com with SMTP id v23so6332415qtb.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 01:26:40 -0800 (PST)
In-Reply-To: <20170113163324.GI25630@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 13, 2017 at 5:33 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Jan 13, 2017 at 04:36:42PM +0100, Linus Walleij wrote:
>> On Thu, Jan 12, 2017 at 10:22 AM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>>
>> > Hmm, looking at users of .set_debounce() I can see that the debounce
>> > time can be quite large. For example some signals which are connected to
>> > physical push-buttons may need > 64ms debounce time.
>> >
>> > However, the current pinconfig value is defined to be unsigned long
>> > which on 32-bit architecture is 32-bits. From that the higher 16-bits
>> > are used as config leaving the value to be 16-bits. This gives maximum
>> > debounce time of 65535us. I don't think it can cover all the uses of
>> > .set_debounce(). This could also be problematic when specifying values
>> > for pull resistors.
>> >
>> > One solution is to convert the packed value to be u64 instead, leaving
>> > up to 48-bits for the value. Alternatively we could provide a scale
>> > field with the packed format.
>>
>> Hm yeah as long as all in-kernel users survive I don't see why we
>> couldn't just make it 64bit. Is it a big deal?
>
> As long as everyone is using those macros and inline functions from
> pinconf-generic.h, I think the conversion should be pretty
> straightforward.

I think I just make it a strict requirement that if people want to use
the pinctrl back-end for GPIO they simply have to support generic
pin control. It's not like they have something else already, and
converting a driver is not any unreasonable amount of work.

Yours,
Linus Walleij
