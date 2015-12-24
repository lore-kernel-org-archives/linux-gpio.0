From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nsp-gpio: fix type of iterator
Date: Thu, 24 Dec 2015 10:03:59 +0100
Message-ID: <CACRpkdZB60Zj3JP=ZT6R_C2DacwLPFwb-m2MJkCf-fiJNkN05w@mail.gmail.com>
References: <1450867041-729-1-git-send-email-a.hajda@samsung.com>
	<1450867041-729-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34142 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752535AbbLXJEA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2015 04:04:00 -0500
Received: by mail-ob0-f169.google.com with SMTP id iw8so181045787obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2015 01:04:00 -0800 (PST)
In-Reply-To: <1450867041-729-2-git-send-email-a.hajda@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, open list <linux-kernel@vger.kernel.org>

On Wed, Dec 23, 2015 at 11:37 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:

> Iterator i declared as unsigned is always non-negative so the
> loop will never end.
>
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].
>
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2038576
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

I already applied Dan Carpenters fix, somehow it was earlier
in my mail flow. Thanks anyways!

Yours,
Linus Walleij
