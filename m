From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: altera: kill bogus dependency on GPIO_GENERIC
Date: Wed, 15 Jul 2015 10:26:06 +0200
Message-ID: <CACRpkdYUBHgqJo+AoBfNDhHDth96=kZFdfF46ZETd6gx1b-u0Q@mail.gmail.com>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34990 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751087AbbGOI0H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 04:26:07 -0400
Received: by oihq81 with SMTP id q81so23583785oih.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2015 01:26:06 -0700 (PDT)
In-Reply-To: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 19, 2015 at 1:31 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The driver gpio-altera.c does not depend on gpio-generic.c at all.
> Drop unneeded "select GPIO_GENERIC".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
