From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] gpio: brcmstb: improved interrupt and wake support
Date: Sat, 7 Oct 2017 12:54:25 +0200
Message-ID: <CACRpkdYrYxi4ZNWvPVNr=w+QobQheDdgjUL0qLrAM+9t1-dd3w@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:54432 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750974AbdJGKy0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 06:54:26 -0400
Received: by mail-it0-f44.google.com with SMTP id 72so7562306itk.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 03:54:26 -0700 (PDT)
In-Reply-To: <20170930034057.15166-1-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sat, Sep 30, 2017 at 5:40 AM, Doug Berger <opendmb@gmail.com> wrote:

> This patch set collects a number of improvements to the GPIO driver
> used by Broadcom Set-Top-Box devices.
>
> Primarily they are aimed at correcting problems with the interrupt
> controller implementation, but they also extend the functionality for
> waking on GPIO interrupts.

I saw there was some mention of a v2 patch set inline, so I
backed out the applied patch.

Please send the v2 series and collect the ACKs from Gregory
and Florian so I can apply it all!

Yours,
Linus Walleij
