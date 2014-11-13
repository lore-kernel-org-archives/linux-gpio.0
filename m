From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] convert to use basic mmio gpio library
Date: Thu, 13 Nov 2014 10:48:04 +0100
Message-ID: <CACRpkdZPCTsR6Mev9p1OcPOdT3LSaabBGwHBLWfY3_8diS6gqg@mail.gmail.com>
References: <1414591005-30961-1-git-send-email-kamlakant.patel@linaro.org>
	<CAAVeFuK+y-WpDPzU-vyy+FE2Ccbkr_JVK22jJyOW4JuDFdjV6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:51709 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932174AbaKMJsG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Nov 2014 04:48:06 -0500
Received: by mail-ig0-f178.google.com with SMTP id a13so4628834igq.5
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2014 01:48:04 -0800 (PST)
In-Reply-To: <CAAVeFuK+y-WpDPzU-vyy+FE2Ccbkr_JVK22jJyOW4JuDFdjV6g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 7, 2014 at 10:10 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Oct 29, 2014 at 10:56 PM,  <kamlakant.patel@linaro.org> wrote:
>> From: Kamlakant Patel <kamlakant.patel@linaro.org>
>>
>> This patch converts GPIO drivers to use BASIC MMIO GPIO library
>> (i.e GPIO GENERIC library) which makes drivers smaller and simpler.
>>
>> This patch needs to be tested on different platforms.
>
> This sounds like a good idea, but we will need to get a couple of
> Tested-by for each patch.

Any single Tested-by is enough for me. If it works for someone on
the real hardware I'll apply it ... testing resources are scarce.

Yours,
Linus Walleij
