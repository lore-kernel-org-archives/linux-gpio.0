From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: cherryview: prevent concurrent access to
 GPIO controllers
Date: Mon, 13 Jun 2016 14:23:44 +0200
Message-ID: <CACRpkdaPHcooBkA4PtApQ=8NgQk4G8sZ-=FkRJ7nQOnyXKc5hQ@mail.gmail.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com> <1465561416-29732-2-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36213 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161242AbcFMMXp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:23:45 -0400
Received: by mail-oi0-f48.google.com with SMTP id p204so204430651oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 05:23:45 -0700 (PDT)
In-Reply-To: <1465561416-29732-2-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>

On Fri, Jun 10, 2016 at 2:23 PM, Dan O'Donovan <dan@emutex.com> wrote:

> Due to a silicon issue on the Atom X5-Z8000 "Cherry Trail" processor
> series, a common lock must be used to prevent concurrent accesses
> across the 4 GPIO controllers managed by this driver.
>
> See Intel Atom Z8000 Processor Series Specification Update
> (Rev. 005), errata #CHT34, for further information.
>
> Signed-off-by: Dan O'Donovan <dan@emutex.com>
> Cc: stable <stable@vger.kernel.org>

Patch applied.

Does it *really* need to go into fixes right now or can it wait until
the next merge window?

Since the rest of the patches seem to depend on it it creates a problem
where some apply to the fixes branch etc and need special care, that
is why I'm asking. If it is super-important, I will fix it.

Yours,
Linus Walleij
