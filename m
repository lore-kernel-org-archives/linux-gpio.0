From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: do not care about blank pin name
Date: Tue, 31 May 2016 10:20:34 +0200
Message-ID: <CACRpkdaE0OMQ01VOxuCeqVGWM7M-j_8jUOOe2WqHpsVf+_iibg@mail.gmail.com>
References: <1464067586-20331-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34531 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755457AbcEaIUf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 04:20:35 -0400
Received: by mail-oi0-f48.google.com with SMTP id e72so15745086oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 01:20:35 -0700 (PDT)
In-Reply-To: <1464067586-20331-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 24, 2016 at 7:26 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> If a pin name is not specified in struct pinctrl_pin_desc,
> pinctrl_register_one_pin() dynamically assigns its name.
> So, desc->name is always a valid pointer here.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

That's definately true.

Good catch, patch applied.

Yours,
Linus Walleij
