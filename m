From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix support for threaded level
 triggered IRQs
Date: Wed, 8 Apr 2015 16:43:30 +0200
Message-ID: <CACRpkdbRmWUYv_2cy8NebpRm5tHZJD-LiximUJ-teJb8y3hrCg@mail.gmail.com>
References: <1428403425-12058-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:35108 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932427AbbDHOna (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 10:43:30 -0400
Received: by iejt8 with SMTP id t8so3719089iej.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 07:43:30 -0700 (PDT)
In-Reply-To: <1428403425-12058-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Ray Jui <rjui@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Lee Jones <lee@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 7, 2015 at 12:43 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> Currently, the driver uses handle_simple_irq for all IRQ types and hard
> codes the acknowledge for different IRQ types into the handler. It is
> better to use the IRQ core as intended and let it handle the differences
> between the various types of IRQ. For example the current system does
> not work for threaded level triggered IRQs as these need to be masked
> until the threaded handler has run.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Looks like a very fine patch so applied unless Stephen has
some problem with it.

Yours,
Linus Walleij
