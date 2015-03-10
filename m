From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 4/8] ARM: dts: enable IOMUX for Broadcom Cygnus
Date: Tue, 10 Mar 2015 11:14:10 +0100
Message-ID: <CACRpkdase0H-fH4f_0FOXj6O79C=S4frjk-evsE+6EOSVN4MuA@mail.gmail.com>
References: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
	<1425933902-20652-5-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:38937 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295AbbCJKOL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Mar 2015 06:14:11 -0400
Received: by oigi138 with SMTP id i138so420804oig.6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2015 03:14:10 -0700 (PDT)
In-Reply-To: <1425933902-20652-5-git-send-email-rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback->

On Mon, Mar 9, 2015 at 9:44 PM, Ray Jui <rjui@broadcom.com> wrote:

> This enables the IOMUX support for Broadcom Cygnus SoC
>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Tested-by: Dmitry Torokhov <dtor@chromium.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Pls take this through some BRCM ARM SoC tree.

Linus
