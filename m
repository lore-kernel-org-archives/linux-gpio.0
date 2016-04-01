From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: lantiq: add a to_irq callback
Date: Fri, 1 Apr 2016 15:22:45 +0200
Message-ID: <CACRpkdb0u1xPM94bvGzUpsMS9Mq5=2RUdcq4op9uY8zLii-NJQ@mail.gmail.com>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
	<1451942879-43265-3-git-send-email-blogic@openwrt.org>
	<CACRpkda9mNt8XHhESpgmOFiRrRqMN14uHPmcXcrrJqe1=qxtWg@mail.gmail.com>
	<e607457b3c544ac69ba6295313f2af66@TDT-MS.TDTNET.local>
	<CACRpkdaqCdOC4w7n7oXTAoc6KgZjB1z+SNEEs4bEhObtPF+ntQ@mail.gmail.com>
	<165cccb7239e476e953c2e93d8aec9ce@TDT-MS.TDTNET.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33497 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752833AbcDANWq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 09:22:46 -0400
Received: by mail-oi0-f50.google.com with SMTP id d205so104877710oia.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 06:22:46 -0700 (PDT)
In-Reply-To: <165cccb7239e476e953c2e93d8aec9ce@TDT-MS.TDTNET.local>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: John Crispin <blogic@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 31, 2016 at 6:44 AM, Martin Schiller <mschiller@tdt.de> wrote:

> I think there still went something wrong with this commit:
>
> In the commit log you can see that this changes are added on 2015-12-10 and
> then reverted on 2016-01-05.

You're right, I just screw everything up, sorry :(

I have reverted the revert for pin control fixes so
it goes into v4.6 as a fix.

Yours,
Linus Walleij
