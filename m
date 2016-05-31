From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/17] pinctrl: uniphier: set pinctrl_desc name in common
 probe function
Date: Tue, 31 May 2016 12:40:11 +0200
Message-ID: <CACRpkdYNrKSULcoos3owH76+Bx0Kgi3mFh1YrESFZZhrwWF+wQ@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-6-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34803 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752275AbcEaKkM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 06:40:12 -0400
Received: by mail-oi0-f48.google.com with SMTP id e72so18642505oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 03:40:12 -0700 (PDT)
In-Reply-To: <1464681923-7469-6-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Every SoC driver sets the same name for struct pinctrl_desc and
> platform_driver.  The common probe function can set desc->name
> instead of duplicating strings in each SoC driver.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
