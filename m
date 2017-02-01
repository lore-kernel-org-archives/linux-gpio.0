From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: 104-dio-48e: Remove unnecessary driver_data set
Date: Wed, 1 Feb 2017 14:21:55 +0100
Message-ID: <CACRpkdYwEP4hy_bkRms5gqVZOF9bOneqBX0Ni3KfCqTaWLeKSQ@mail.gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com> <6842aabe11583bddfd5f241841ad9776f5dfe07e.1485786703.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:35444 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751126AbdBANWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 08:22:02 -0500
Received: by mail-it0-f50.google.com with SMTP id 203so16292180ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 05:22:02 -0800 (PST)
In-Reply-To: <6842aabe11583bddfd5f241841ad9776f5dfe07e.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 3:39 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Setting driver_data was necessary to access private data in the
> dio48e_remove function. Now that the dio48e_remove function is gone,
> driver_data is no longer used. This patch removes the relevant code.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
