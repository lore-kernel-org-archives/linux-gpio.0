From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH v2 6/7] gpio: brcmstb: consolidate interrupt domains
Date: Thu, 26 Oct 2017 16:44:59 -0700
Message-ID: <CADtm3G4vK1-rjFS3rVCm+f1KuFsPBsJrDMh91EEJ3Gbjtp65Pw@mail.gmail.com>
References: <20171024195451.30535-1-opendmb@gmail.com> <20171024195451.30535-7-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:45860 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751489AbdJZXpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Oct 2017 19:45:31 -0400
In-Reply-To: <20171024195451.30535-7-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Oct 24, 2017 at 12:54 PM, Doug Berger <opendmb@gmail.com> wrote:
> The GPIOLIB IRQ chip helpers were very appealing, but badly broke
> the 1:1 mapping between a GPIO controller's device_node and its
> interrupt domain.
>
> When another device-tree node references a GPIO device as its
> interrupt parent, the irq_create_of_mapping() function looks for
> the irq domain of the GPIO device and since all bank irq domains
> reference the same GPIO device node it always resolves to the irq
> domain of the first bank regardless of which bank the number of
> the GPIO should resolve. This domain can only map hwirq numbers
> 0-31 so interrupts on GPIO above that can't be mapped by the
> device-tree.
>
> This commit effectively reverts the patch from Gregory Fong [1]
> that was accepted upstream and replaces it with a consolidated
> irq domain implementation with one larger interrupt domain per
> GPIO controller instance spanning multiple GPIO banks based on
> an earlier patch [2] also submitted by Gregory Fong.
>
> [1] https://patchwork.kernel.org/patch/6921561/
> [2] https://patchwork.kernel.org/patch/6347811/
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Gregory Fong <gregory.0xf0@gmail.com>
