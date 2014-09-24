From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RTF] [PATCH 00/26] gpio: use platform based module init
Date: Wed, 24 Sep 2014 10:03:44 +0200
Message-ID: <CACRpkdY51dJiFaX4oDij_dir-sF11+JxRoR+DDmew21jT4HDtQ@mail.gmail.com>
References: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
	<CAAVeFuKH_hz4Doi=omVxtdE291r0No_yB=mSAvC0oScg=b=VMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:35086 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753705AbaIXIDp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 04:03:45 -0400
Received: by mail-ig0-f179.google.com with SMTP id l13so6071474iga.6
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 01:03:45 -0700 (PDT)
In-Reply-To: <CAAVeFuKH_hz4Doi=omVxtdE291r0No_yB=mSAvC0oScg=b=VMQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 19, 2014 at 10:36 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, Sep 9, 2014 at 7:29 PM,  <kamlakant.patel@linaro.org> wrote:
>> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>>
>> This patch removes *_initcall based driver initialization
>> and adds regular module_platform_driver to instantiate
>> GPIO drivers which makes the code smaller and simpler.
>>
>> NOTE: This patch needs to be tested on different platforms.
>
> I'd say this looks good - have you at least tested this on one or more
> of the modified drivers?

I asked Kamlakant to send these patches. I will apply them when/if each
platform maintainer go about to actually test it on their machine and
can confirm it works.

Yours,
Linus Walleij
