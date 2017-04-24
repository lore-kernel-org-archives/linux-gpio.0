From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 5/6] gpio: Add gpio driver support for ThunderX and OCTEON-TX
Date: Mon, 24 Apr 2017 15:08:03 +0200
Message-ID: <CACRpkda20HfMYvTHK7LKm-z+mYpLTVvUy36FNAjqCNsDjB4B3Q@mail.gmail.com>
References: <1491931269-15650-1-git-send-email-david.daney@cavium.com> <1491931269-15650-6-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:36651 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1170550AbdDXNIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 09:08:05 -0400
Received: by mail-io0-f174.google.com with SMTP id p80so73329970iop.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 06:08:05 -0700 (PDT)
In-Reply-To: <1491931269-15650-6-git-send-email-david.daney@cavium.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 11, 2017 at 7:21 PM, David Daney <david.daney@cavium.com> wrote:

> Cavium ThunderX and OCTEON-TX are arm64 based SoCs.  Add driver for
> the on-chip GPIO pins.
>
> Signed-off-by: David Daney <david.daney@cavium.com>

I'm already happy with this driver.

Just waiting for the IRQ people to merge the dependencies
of give their ACKs.

Yours,
Linus Walleij
