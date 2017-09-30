From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/7] gpio: brcmstb: improved interrupt and wake support
Date: Fri, 29 Sep 2017 22:34:08 -0700
Message-ID: <b2758902-a1b7-1621-5eec-651f3ada92e7@gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:54357 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750810AbdI3FeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Sep 2017 01:34:14 -0400
In-Reply-To: <20170930034057.15166-1-opendmb@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Doug Berger <opendmb@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 09/29/2017 08:40 PM, Doug Berger wrote:
> This patch set collects a number of improvements to the GPIO driver
> used by Broadcom Set-Top-Box devices.
> 
> Primarily they are aimed at correcting problems with the interrupt
> controller implementation, but they also extend the functionality for
> waking on GPIO interrupts.

This all looks good to me, thanks a lot for sending those patches out!

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> 
> Doug Berger (7):
>   gpio: brcmstb: allow all instances to be wakeup sources
>   gpio: brcmstb: release the bgpio lock during irq handlers
>   gpio: brcmstb: switch to handle_level_irq flow
>   gpio: brcmstb: correct the configuration of level interrupts
>   gpio: brcmstb: enable masking of interrupts when changing type
>   gpio: brcmstb: consolidate interrupt domains
>   gpio: brcmstb: implement suspend/resume/shutdown
> 
>  drivers/gpio/Kconfig        |   2 +-
>  drivers/gpio/gpio-brcmstb.c | 419 +++++++++++++++++++++++++++++++++-----------
>  2 files changed, 321 insertions(+), 100 deletions(-)
> 

-- 
Florian
