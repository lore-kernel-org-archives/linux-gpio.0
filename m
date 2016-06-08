From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-kernel] [PATCH] pinctrl: nomadik: fix warnings from
 unexported functions
Date: Wed, 8 Jun 2016 14:14:32 +0200
Message-ID: <CACRpkdZk3gCP1D2cpYDr2H_C8B07iepdBnNnn=x5Kf48WWGRrA@mail.gmail.com>
References: <1465320302-5770-1-git-send-email-ben.dooks@codethink.co.uk>
 <d3712327-9d20-08ae-30b1-2b6d52e30420@codethink.co.uk> <40be947d-89f6-2552-7bd2-91d16a378b2f@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33905 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161028AbcFHMOd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 08:14:33 -0400
Received: by mail-oi0-f54.google.com with SMTP id e72so9180960oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 05:14:33 -0700 (PDT)
In-Reply-To: <40be947d-89f6-2552-7bd2-91d16a378b2f@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>

On Wed, Jun 8, 2016 at 11:15 AM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> On 07/06/16 18:30, Ben Dooks wrote:
>> On 07/06/16 18:25, Ben Dooks wrote:
>>> There are five functions in the driver that are defined but
>>> only used locally. Make these static to avoid the following
>>> warnings:
>>>
>>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1036:6: warning: symbol 'nmk_gpio_clocks_enable' was not declared. Should it be static?
>>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1050:6: warning: symbol 'nmk_gpio_clocks_disable' was not declared. Should it be static?
>>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1073:6: warning: symbol 'nmk_gpio_wakeups_suspend' was not declared. Should it be static?
>>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1094:6: warning: symbol 'nmk_gpio_wakeups_resume' was not declared. Should it be static?
>>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1120:6: warning: symbol 'nmk_gpio_read_pull' was not declared. Should it be static?
>>
>> Apologies, wrong version of the patch without a typo fix in it.
>
> Given these functions are not being used, should I just consider a
> patch to remove these. If they are not being considered for future
> development it might be a good idea?

Yeah just kill them. If I need them back, I can always revert.

Yours,
Linus Walleij
