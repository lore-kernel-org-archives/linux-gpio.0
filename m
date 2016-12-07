From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinctrl-sx150x.c: Fix typo in a previous patch
Date: Wed, 7 Dec 2016 16:04:25 +0100
Message-ID: <CACRpkdbW7C6ipJ=htOOdieZ3ai_ZbFbUW=1TPfz67ajTZM0aRQ@mail.gmail.com>
References: <1480888868-23331-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:32908 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932109AbcLGPE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2016 10:04:26 -0500
Received: by mail-qk0-f169.google.com with SMTP id x190so416185863qkb.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2016 07:04:26 -0800 (PST)
In-Reply-To: <1480888868-23331-1-git-send-email-andrew@lunn.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 4, 2016 at 11:01 PM, Andrew Lunn <andrew@lunn.ch> wrote:

> Fix typo of chip-irq to chip->irq.
>
> Fixes: abbb5af1166f ("pinctrl: sx150x: use new nested IRQ infrastructure")
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

Fixed it up in-tree because I had to rebase it anyways since this was
not the only thing I screwed up.

> y# Please enter the commit message for your changes. Lines starting

Hehe? :)

Yours,
Linus Walleij
