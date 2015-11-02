From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: ath79: Move to the generic GPIO driver
Date: Mon, 2 Nov 2015 09:30:49 +0100
Message-ID: <CACRpkdb2K=9BRRscFm6SUWOM+-eZSW4EZqMyQiPKGSZHq+bHYA@mail.gmail.com>
References: <1446201391-22553-1-git-send-email-albeu@free.fr>
	<1446201391-22553-2-git-send-email-albeu@free.fr>
	<CACRpkdY3Xjir7pHLhpT9nv1w-KA5E3a767vqZoQronyAWZ1F1w@mail.gmail.com>
	<20151101184659.1824dc35@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33720 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752246AbbKBIau (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 03:30:50 -0500
Received: by oiad129 with SMTP id d129so91082337oia.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 00:30:49 -0800 (PST)
In-Reply-To: <20151101184659.1824dc35@tock>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sun, Nov 1, 2015 at 6:46 PM, Alban <albeu@free.fr> wrote:
> On Sat, 31 Oct 2015 22:02:53 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:

>> Please rebase it on this branch or wait until after the merge window.
>
> I see that you applied my previous patch "gpio: ath79: Convert to the
> state container design pattern", this series was supposed to replace
> this patch. I'm sorry I forgot to mention this. That old patch doesn't
> make much sense any more as most of the code it changed just get
> dropped in the move to GPIO_GENERIC.

Hm you can tell me exactly which commits I need to revert
or something ... I cannot rebase the tree now.

It would be best if you cook a GPIO_GENERIC patch based on
devel.

Yours,
Linus Walleij
