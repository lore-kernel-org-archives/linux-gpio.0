From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Fri, 5 Sep 2014 10:00:51 +0200
Message-ID: <CACRpkdYZ0W4+iGyP5bbARAAfrqcrG77PVCHKcGhnBXvpCHoqxw@mail.gmail.com>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
	<1409161588-19417-4-git-send-email-alvin.chen@intel.com>
	<CACRpkdZJSf+EfYN=hHxRnpjQZGuqroBL0c+08Ng=dRkS0GZySA@mail.gmail.com>
	<4656BEB6164FC34F8171C6538F1A595B2E9826A6@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36537 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756028AbaIEIAw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Sep 2014 04:00:52 -0400
Received: by mail-oi0-f47.google.com with SMTP id a141so5477552oig.34
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2014 01:00:52 -0700 (PDT)
In-Reply-To: <4656BEB6164FC34F8171C6538F1A595B2E9826A6@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Chen, Alvin" <alvin.chen@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>

On Fri, Sep 5, 2014 at 4:09 AM, Chen, Alvin <alvin.chen@intel.com> wrote:

>> > +       unsigned long data;
>> > +       unsigned long dir;
>> > +       unsigned long int_en;
>> > +       unsigned long int_mask;
>> > +       unsigned long int_type;
>> > +       unsigned long int_pol;
>> > +       unsigned long int_deb;
>> > +} saved_regs;
>>
>> Singleton huh?
>>
>> Insert this into the dynamically allocated per-port or chip struct instead.
>>
> How about the following?
>
> static struct dwapb_context {
>         u32 data[DWAPB_MAX_PORTS];
>         u32 dir[DWAPB_MAX_PORTS];
>         u32 ext[DWAPB_MAX_PORTS];
>         u32 int_en;
>         u32 int_mask;
>         u32 int_type;
>         u32 int_pol;
>         u32 int_deb;
> } dwapb_context;

NO because this is still a singleton variable. Put it into the
dynamically allocated structs.

> Comparing to allocate for each port
> dynamically, it is more directly and easy to understand.

No, I disagree. The overall design pattern in the kernel is to
allocate all state containers dynamically.

Yours,
Linus Walleij
