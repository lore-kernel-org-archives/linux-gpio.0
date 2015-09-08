From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: join lines that can be a single line within 80 columns
Date: Tue, 8 Sep 2015 11:03:26 +0200
Message-ID: <CACRpkdb4M-MnZAVffe=253MXVLzzm-KfUyEgbMWrUgTLUNheEw@mail.gmail.com>
References: <1438402958-7744-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33822 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbbIHJD1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 05:03:27 -0400
Received: by oiev17 with SMTP id v17so54914477oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 02:03:26 -0700 (PDT)
In-Reply-To: <1438402958-7744-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Aug 1, 2015 at 6:22 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> There is no reason to break a line shorter than 80 columns.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied for fixes.

Yours,
Linus Walleij
