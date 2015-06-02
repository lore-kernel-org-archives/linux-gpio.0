From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/6] ARM: brcmstb: Select ARCH_WANT_OPTIONAL_GPIOLIB
Date: Tue, 2 Jun 2015 15:42:32 +0200
Message-ID: <CACRpkdYC3DDejXDX-CE71cMt2nJiKxg3W8ORFtvYyEeSDHdXCw@mail.gmail.com>
References: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
	<1432865650-4062-6-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34788 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759160AbbFBNmd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 09:42:33 -0400
Received: by oifu123 with SMTP id u123so125728251oif.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 06:42:33 -0700 (PDT)
In-Reply-To: <1432865650-4062-6-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>

On Fri, May 29, 2015 at 4:14 AM, Gregory Fong <gregory.0xf0@gmail.com> wrote:

> Select ARCH_WANT_OPTIONAL_GPIOLIB from BRCMSTB to allow GPIOLIB and
> GPIO_BRCMSTB to be enabled.
>
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
