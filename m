From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] pinctrl: cherryview: fixes and enhancements
Date: Wed, 8 Jun 2016 10:32:43 +0200
Message-ID: <CACRpkdYYhOXOAb+yQ1S2ufhvr+WjH65fiw9HZs7ZExBCdLB49Q@mail.gmail.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36608 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161190AbcFHIcp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 04:32:45 -0400
Received: by mail-oi0-f53.google.com with SMTP id p204so1702813oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 01:32:44 -0700 (PDT)
In-Reply-To: <1464904543-4094-1-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jun 2, 2016 at 11:55 PM, Dan O'Donovan <dan@emutex.com> wrote:

> This series includes a number of fixes and enhancements for the
> Cherryview pinctrl/gpio driver, developed during integration on the
> UP Board (based on the Intel X5-Z8350 "Cherry Trail" Atom SoC).
>
> Of particular note is a workaround for a documented silicon bug which
> causes data corruption of concurrent accesses to the GPIO controller
> registers on this SoC.
>
> Other patches include clean-up of checkpatch warnings, implementation
> of additional pin config functions and options, and a fix for a loss
> of pin config register state that can occur when switching in and out
> of GPIO pin mode.

Nice, but waiting for a revised patch set fixing Mika's comments.

Yours,
Linus Walleij
