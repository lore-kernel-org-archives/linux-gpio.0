From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular distinctions
Date: Tue, 30 May 2017 09:41:40 +0200
Message-ID: <CACRpkdYeKvMwjBNZ40nS3R9Wp9fVNfTn2-8zPegt==ODGT44ig@mail.gmail.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-4-paul.gortmaker@windriver.com> <CACRpkdbQTDkqy+ChBq=pg1BnHH5ARL0+J-zL_gipEEotujOxbA@mail.gmail.com>
 <4eb8be51-8cf9-31b9-c6e6-52fdb9cd202d@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:36568 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750841AbdE3Hll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 03:41:41 -0400
Received: by mail-io0-f181.google.com with SMTP id o12so51745879iod.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 00:41:41 -0700 (PDT)
In-Reply-To: <4eb8be51-8cf9-31b9-c6e6-52fdb9cd202d@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>

On Mon, May 29, 2017 at 6:35 PM, Scott Branden
<scott.branden@broadcom.com> wrote:

> It is a simple ask to place the new information in a new comment after the
> legal header.

OK send a patch fixing the headers the way you want them.

I don't mind if you want a certain order on your desk as a figure
of speak, I am the same.

> An aim at consistency helps reduce confusion (internal and external)
> of what license header template to apply to files.  Modifying these headers
> and placing
> information in the middle of them does not help in this effort.

Aha, I understand it if a human is reading the files.

If it is a machine, not so much, as we should not serve the machines
but the other way around.

Yours,
Linus Walleij
