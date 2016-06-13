From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Always recurse into bcm folder
Date: Mon, 13 Jun 2016 08:52:06 +0200
Message-ID: <CACRpkdZfAQ5G8OEsKGuZLVLmA4n1sS-z8q73r8t95tw0jMhr5w@mail.gmail.com>
References: <1465422255-20716-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35218 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964807AbcFMGwI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 02:52:08 -0400
Received: by mail-oi0-f54.google.com with SMTP id w5so115167154oib.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2016 23:52:07 -0700 (PDT)
In-Reply-To: <1465422255-20716-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>

On Wed, Jun 8, 2016 at 11:44 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> drivers/pinctrl/bcm/Makefile properly builds individual drivers based on
> their respective Kconfig symbols. ARCH_BCM is currently a menuconfig
> option from arch/arm/mach-bcm/Kconfig, which is fine, but prevents ARM64
> platforms which do not have such menuconfig option from building their
> pinctrl drivers, so let's get rid of that dependency.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied with Scott's ACK.

Yours,
Linus Walleij
