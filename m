From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pistachio: Drop pinctrl_unregister for devm_
 registered device
Date: Thu, 4 Aug 2016 10:11:29 +0200
Message-ID: <CACRpkdaBxmsCOwZXgFo9tvNn_B5vGpatw5+Bvm4NTLoJZzC9xg@mail.gmail.com>
References: <1469544777-32102-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36776 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754165AbcHDILb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2016 04:11:31 -0400
Received: by mail-oi0-f54.google.com with SMTP id f189so38560717oig.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Aug 2016 01:11:30 -0700 (PDT)
In-Reply-To: <1469544777-32102-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 26, 2016 at 4:52 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> It's not necessary to unregister pin controller device registered
> with devm_pinctrl_register() and using pinctrl_unregister() leads
> to a double free.
>
> This is detected by Coccinelle semantic patch.
>
> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
