From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 2/7] gpio: brcmstb: release the bgpio lock during irq handlers
Date: Tue, 3 Oct 2017 18:55:51 -0700
Message-ID: <CADtm3G58SBF0FskUPJCs_8km8oXrKYs-+hrJoV4osyw9mvQbiQ@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-3-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:48793 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdJDB4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 21:56:24 -0400
In-Reply-To: <20170930034057.15166-3-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Doug,

On Fri, Sep 29, 2017 at 8:40 PM, Doug Berger <opendmb@gmail.com> wrote:
> The basic memory-mapped GPIO controller lock must be released
> before calling the registered GPIO interrupt handlers to allow
> the interrupt handlers to access the hardware.  Otherwise, the
> hardware accesses will deadlock when they attempt to grab the
> lock.

I was having some trouble understanding exactly what the problem was
here, but I think I see it now.  Since this locks the entire bank,
where some GPIOs might be set as inputs and some as inputs (and
interrupt sources), then an interrupt on a GPIO that is supposed to
set another GPIO in the bank would result in deadlock.  Is that
correct?  If so, please update the commit message to make that clear,
and nice fix.  If not that, it would be nice to know what scenario can
cause a problem.

Thanks,
Gregory
