From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl:Convert the composition of devm_request_mem_region
 and devm_ioremap to a single call
Date: Mon, 14 Dec 2015 15:03:54 +0100
Message-ID: <CACRpkda7a2KtyUJM4jkjn7aCZFYyzuz+xB328Djmc=ayHOdMhA@mail.gmail.com>
References: <1446191478-22714-1-git-send-email-sanjeev_sharma@mentor.com>
	<CACRpkdZFhseQDbXvJg1CP3+WRsw_dPivx0w8730-9FV3fwjUGQ@mail.gmail.com>
	<20151203214415.GC23396@atomide.com>
	<CACRpkdZFw=tbRmh1_qUeRvVKokMqYd35FEO+NPbp+=gwSE6yDA@mail.gmail.com>
	<20151210223142.GH23396@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36089 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752898AbbLNODy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 09:03:54 -0500
Received: by obcno2 with SMTP id no2so12576521obc.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 06:03:54 -0800 (PST)
In-Reply-To: <20151210223142.GH23396@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Sanjeev Sharma <sanjeev_sharma@mentor.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>

On Thu, Dec 10, 2015 at 11:31 PM, Tony Lindgren <tony@atomide.com> wrote:

>> >
>> > I think we need to add ourselves to MAINTAINERS for this driver,
>> > otherwise we'll keep on missing emails.
>>
>> Good idea! Patches accepted.
>
> How about this one below?

Patch applied for fixes!

Yours,
Linus Walleij
