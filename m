From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: Introduce ->get_multiple callback
Date: Sat, 7 Oct 2017 13:23:17 +0200
Message-ID: <CACRpkdb4uKLTKUa_fwzMmvSHps8aXM4FQgXzhtf-UNmzt6=Q0g@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
 <20171004203203.GC9195@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:48228 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbdJGLXS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 07:23:18 -0400
Received: by mail-it0-f50.google.com with SMTP id m123so8615201ita.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 04:23:17 -0700 (PDT)
In-Reply-To: <20171004203203.GC9195@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 4, 2017 at 10:32 PM, Lukas Wunner <lukas@wunner.de> wrote:

> So I'm wondering if the const keyword does more harm than good in this case.
> Let me know what you think.

I've had similar experiences.

I'm not very sensitive about it, do whatever makes most sense to you.

What is important is that we get get_mutiple() in place.

Yours,
Linus Walleij
