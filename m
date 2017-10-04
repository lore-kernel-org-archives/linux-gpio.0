From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 1/7] gpio: brcmstb: allow all instances to be wakeup sources
Date: Tue, 3 Oct 2017 18:40:27 -0700
Message-ID: <CADtm3G4ADyD-nGpFZ2OD2fH6PMpEipykJuuLxz+S8mvXUV6VPg@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-2-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:44973 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751171AbdJDBk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 21:40:59 -0400
In-Reply-To: <20170930034057.15166-2-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 29, 2017 at 8:40 PM, Doug Berger <opendmb@gmail.com> wrote:
> This commit allows a wakeup parent interrupt to be shared between
> instances.
>
> It also removes the redundant can_wake member of the private data
> structure by using whether the parent_wake_irq has been defined to
> indicate that the GPIO device can wake.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
