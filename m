From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/9] arm: twr-k70f120m: timer driver for Kinetis SoC
Date: Tue, 14 Jul 2015 10:59:44 +0200
Message-ID: <CACRpkdbh063kZtmPf5HLuLXhmXDewG0atDjUt+LE2doGrdB-NQ@mail.gmail.com>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl>
	<1435667250-28299-5-git-send-email-pawelo@king.net.pl>
	<alpine.DEB.2.11.1507010944580.3916@nanos>
	<alpine.LNX.2.00.1507011031050.9009@localhost.localdomain>
	<alpine.DEB.2.11.1507011527380.3916@nanos>
	<alpine.LNX.2.00.1507011619250.13307@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:35162 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751961AbbGNI7p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2015 04:59:45 -0400
Received: by obbop1 with SMTP id op1so2071644obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 01:59:45 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1507011619250.13307@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Osmialowski <pawelo@king.net.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jiri Slaby <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Geert

On Wed, Jul 1, 2015 at 4:20 PM, Paul Osmialowski <pawelo@king.net.pl> wrote:

> -               kinetis_pit_init(kinetis_tmr, (rate / HZ) - 1);

Do you want to do DIV_ROUND_UP() or why is this -1 here?

Yours,
Linus Walleij
