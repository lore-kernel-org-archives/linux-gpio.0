From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: lantiq: add a to_irq callback
Date: Tue, 5 Jan 2016 15:19:56 +0100
Message-ID: <CACRpkdaqCdOC4w7n7oXTAoc6KgZjB1z+SNEEs4bEhObtPF+ntQ@mail.gmail.com>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
	<1451942879-43265-3-git-send-email-blogic@openwrt.org>
	<CACRpkda9mNt8XHhESpgmOFiRrRqMN14uHPmcXcrrJqe1=qxtWg@mail.gmail.com>
	<e607457b3c544ac69ba6295313f2af66@TDT-MS.TDTNET.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:33505 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751543AbcAEOT5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 09:19:57 -0500
Received: by mail-ob0-f177.google.com with SMTP id bx1so248045031obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 06:19:57 -0800 (PST)
In-Reply-To: <e607457b3c544ac69ba6295313f2af66@TDT-MS.TDTNET.local>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: John Crispin <blogic@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 5, 2016 at 1:59 PM, Martin Schiller <mschiller@tdt.de> wrote:

> As I submitted this change a few weeks ago, you already applied this in the linux-gpio tree here:
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/drivers/pinctrl/pinctrl-xway.c?h=devel&id=3e640743fee6e6a82ead1f163737755b2a965712

Yeah I noticed.... hehe it blew up in my face when I tried to merge
the pin control and GPIO trees to see what happens in Linux-next.
I think I figured it out now...

Yours,
Linus Walleij
