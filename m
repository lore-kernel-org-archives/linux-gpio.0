From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mvebu: use BIT macro instead of bit shifting
Date: Thu, 23 Mar 2017 10:22:11 +0100
Message-ID: <CACRpkdZ_uUSvgO1uW73U8zZt9i87xBaXx925XJoUU-r6OsdpJg@mail.gmail.com>
References: <20170317174406.13431-1-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36786 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933751AbdCWJWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 05:22:14 -0400
Received: by mail-it0-f42.google.com with SMTP id w124so36534991itb.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 02:22:12 -0700 (PDT)
In-Reply-To: <20170317174406.13431-1-ralph.sennhauser@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Fri, Mar 17, 2017 at 6:44 PM, Ralph Sennhauser
<ralph.sennhauser@gmail.com> wrote:

> Use the BIT macro instead of explicitly shifting bits for some added
> clarity.
>
> Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>

Patch applied.

Yours,
Linus Walleij
