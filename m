From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 6/7] gpio: brcmstb: consolidate interrupt domains
Date: Tue, 3 Oct 2017 20:03:12 -0700
Message-ID: <CADtm3G5v6_BHwanRYvCq1y-8Hdmn7gxX3zoVHx2c7cOFL-pj+Q@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-7-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33896 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750797AbdJDDDo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 23:03:44 -0400
In-Reply-To: <20170930034057.15166-7-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Doug,

On Fri, Sep 29, 2017 at 8:40 PM, Doug Berger <opendmb@gmail.com> wrote:
> The GPIOLIB IRQ chip helpers were very appealing, but badly broke
> the 1:1 mapping between a GPIO controller's device_node and its
> interrupt domain.

Out of curiosity, what sort of problems have you seen from this?

>
> This commit consolidates the per bank irq domains to a version
> where we have one larger interrupt domain per GPIO controller
> instance spanning multiple GPIO banks.

This works (and is reminiscent to my initially submitted
implementation at [1]), but I think it might make sense to keep as-is
(using the gpiolib irqchip helpers), and instead allocate an irqchip
fwnode per bank and use to_of_node() to set it as the of_node for the
gpiochip before calling gpiochip_irqchip_add().  OTOH, that capability
might go away...

Linus, can you comment on the FIXME in gpiochip_irqchip_add_key() that
says "get rid of this and use gpiochip->parent->of_node everywhere"?
It seems like it would still be beneficial to be able to override the
associated node for a gpiochip, since that's what's used for the
irqdomain, but if that's going away, obviously we don't want to start
using that now.

Thanks,
Gregory

[1] https://patchwork.kernel.org/patch/6347811/
