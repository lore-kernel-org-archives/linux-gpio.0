From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio] gpio: removing kfree remove functionality
Date: Wed, 8 Apr 2015 16:54:52 +0200
Message-ID: <CACRpkdaVMGhdBLv6aPaYSNGXJh2+P9N-Ld3irD-LNH1N2i4Jsg@mail.gmail.com>
References: <1428422680-4509-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:35563 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754089AbbDHOyw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 10:54:52 -0400
Received: by iejt8 with SMTP id t8so4060909iej.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 07:54:52 -0700 (PDT)
In-Reply-To: <1428422680-4509-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Apr 7, 2015 at 6:04 PM, Varka Bhadram <varkabhadram@gmail.com> wrote:

> commit 3de07e5aaf290a0b58919 ("drivers: gpio: use devm_kzalloc")
> introduce devm_kzalloc() for allocating the memory. In this case kfree
> is not required to use. Above commit id introduced the bug that kfree
> is not removed from the remove function.
>
> This patch fix the above bug.
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>

Patch applied.

BTW these "deep cleanups" are much appreciated.

Yours,
Linus Walleij
