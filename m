From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-reg: fix build
Date: Sun, 24 Dec 2017 18:44:07 +0100
Message-ID: <CACRpkdavHjdELSxwn79YE1F5X8LygwENFF-WXzMbjJXXwDPNFg@mail.gmail.com>
References: <20171206173745.19853-1-grygorii.strashko@ti.com>
 <CAMuHMdWuHsM2TQaTsK4=XTq-Q1ea7CaNEMhWzDgt_ppqssxYpQ@mail.gmail.com> <20171224155619.GR10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:38300 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750877AbdLXRoI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Dec 2017 12:44:08 -0500
Received: by mail-io0-f194.google.com with SMTP id 87so25012810ior.5
        for <linux-gpio@vger.kernel.org>; Sun, 24 Dec 2017 09:44:08 -0800 (PST)
In-Reply-To: <20171224155619.GR10595@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On Sun, Dec 24, 2017 at 4:56 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:

> But the main thing is, this needs to be fixed - it's been causing build
> errors for those of us carrying patches to use it, and thereby destroying
> the usefulness of nightly testing.

I'm sorry, it's my fault for not being swift enough. :(

I sent a combined seasonal greetings and pull request to
Torvalds this morning.

Yours,
Linus Walleij
