From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] gpio: ws16c48: Remove unnecessary driver_data set
Date: Wed, 1 Feb 2017 14:45:28 +0100
Message-ID: <CACRpkdbhBFBxJnUsNbZSWO2+QcYuN_fwM=wit60WH7B7vLQXVA@mail.gmail.com>
References: <cover.1485786703.git.vilhelm.gray@gmail.com> <f1e2648b075174cd37d9f2c85cda878bc3b23cf2.1485786703.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:35971 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750858AbdBANpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 08:45:31 -0500
Received: by mail-io0-f174.google.com with SMTP id j13so156221087iod.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 05:45:30 -0800 (PST)
In-Reply-To: <f1e2648b075174cd37d9f2c85cda878bc3b23cf2.1485786703.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 3:40 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> Setting driver_data was necessary to access private data in the
> ws16c48_remove function. Now that the ws16c48_remove function is gone,
> driver_data is no longer used. This patch removes the relevant code.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
