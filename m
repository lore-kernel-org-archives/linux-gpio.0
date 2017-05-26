From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] pinctrl: amd: don't load pinctrl-amd on Gigabyte AM4
 boards
Date: Fri, 26 May 2017 12:09:20 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705261206180.1902@nanos>
References: <20170525040006.22654-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:40723 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761857AbdEZKJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2017 06:09:23 -0400
In-Reply-To: <20170525040006.22654-1-kai.heng.feng@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>

On Thu, 25 May 2017, Kai-Heng Feng wrote:

> On Gigabyte AM4 boards, pinctrl-amd generates tons of irq, makes the
> system not able to boot properly.
> 
> Don't load the module until Gigabyte fixes the issue.

NAK. 

That's the completely wrong approach. This crap will surface on a gazillion
of other boards and will hit users faster than you can keep that DMI list
up to date.

There is a proper solution to this problem:

http://lkml.kernel.org/r/alpine.DEB.2.20.1705232307330.2409@nanos

Thanks,

	tglx
