From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: x86: update config dependencies for x86 specific hardware
Date: Tue, 8 Nov 2016 11:08:08 +0100
Message-ID: <CACRpkdYhBHRW5RvuN2bxBtWMW6F_z=Z5f-Sf0bqZ2dLnH=juxg@mail.gmail.com>
References: <20161106191456.29497-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:34148 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753004AbcKHKIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 05:08:09 -0500
Received: by mail-qk0-f169.google.com with SMTP id q130so210373926qke.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 02:08:09 -0800 (PST)
In-Reply-To: <20161106191456.29497-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Nov 6, 2016 at 8:14 PM, Peter Robinson <pbrobinson@gmail.com> wrote:

> The devices here are specific to x86 so lets depend on x86.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Need to be compiled also for COMPILE_TEST I think.

Yours,
Linus Walleij
