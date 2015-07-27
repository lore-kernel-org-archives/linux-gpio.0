From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: use dev_err() to show message in pinctrl_register_one_pin()
Date: Mon, 27 Jul 2015 14:44:02 +0200
Message-ID: <CACRpkdZc4iB1+DoTu2dK1d7ooQgvem2huL7Hb=UcSskdMcjxxA@mail.gmail.com>
References: <1437459927-5278-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35054 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255AbbG0MoE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:44:04 -0400
Received: by oihq81 with SMTP id q81so50598093oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:44:03 -0700 (PDT)
In-Reply-To: <1437459927-5278-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 21, 2015 at 8:25 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Use dev_err() rather than pr_err() to display the error message.
> (Besides, dev_err() is already used 7 lines below in this function.)
>
> Also, drop the redundant information "on %s" because dev_err() shows
> which device the message is related to.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
