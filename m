From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 4/7] gpio: brcmstb: correct the configuration of level interrupts
Date: Tue, 3 Oct 2017 19:03:29 -0700
Message-ID: <CADtm3G6jNNRi6WJMThVCxup81ZDPY5Qk2oUT5PL0z_eiWZ4RUQ@mail.gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com> <20170930034057.15166-5-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:51212 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750865AbdJDCEB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2017 22:04:01 -0400
In-Reply-To: <20170930034057.15166-5-opendmb@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 29, 2017 at 8:40 PM, Doug Berger <opendmb@gmail.com> wrote:
> This commit corrects a bug when configuring the GPIO hardware for
> IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_LEVEL_HIGH interrupt types. The
> hardware is now correctly configured to support those types.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
