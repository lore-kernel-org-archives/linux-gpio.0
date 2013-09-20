From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] IOP GPIO refactoring take 2
Date: Fri, 20 Sep 2013 23:09:48 +0200
Message-ID: <CACRpkdYo-mci-2hSw7WZRJREV4RLPkV_d+x6USgViz0ta2dAog@mail.gmail.com>
References: <1379708226-7802-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:40178 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752358Ab3ITVJt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Sep 2013 17:09:49 -0400
Received: by mail-ob0-f172.google.com with SMTP id gq1so1251327obb.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Sep 2013 14:09:48 -0700 (PDT)
In-Reply-To: <1379708226-7802-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lennert Buytenhek <kernel@wantstofly.org>, Dan Williams <dan.j.williams@intel.com>, Mikael Pettersson <mikpe@it.uu.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, "arm@kernel.org" <arm@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>

On Fri, Sep 20, 2013 at 10:17 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> This is a resend of the IOP GPIO refactoring, this time
> I took some extra care to be sure I moved all the IOP32x boards
> to instantiate their platform devices properly, as noted
> by Aaro.
>
> Also available as a branch:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git iop-cleanup
>
> Testing and ACKing appreciated.

ARM SoC folks: are you happy with me taking this into the
GPIO tree?

Yours,
Linus Walleij
