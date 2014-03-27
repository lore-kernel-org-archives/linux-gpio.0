From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: twl4030: Remove redundant assignment
Date: Thu, 27 Mar 2014 10:07:04 +0100
Message-ID: <CACRpkdbd=PrLed+11HBAjyTOjuMxATgmtf3j=S970y+V4a-bjQ@mail.gmail.com>
References: <1395477135-19867-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:42185 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753308AbaC0JHF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 05:07:05 -0400
Received: by mail-ob0-f171.google.com with SMTP id wn1so3973788obc.30
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2014 02:07:04 -0700 (PDT)
In-Reply-To: <1395477135-19867-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Mar 22, 2014 at 9:32 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Variable "status" is never used, so remove it and add warning if
> any error happen.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Looks sound, patch applied.

Yours,
Linus Walleij
