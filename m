From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: pca953x: Move memcpy into mutex lock for set
 multiple function.
Date: Tue, 8 Nov 2016 09:32:26 +0100
Message-ID: <CACRpkdYTYrMGjqvbJZhsWfpNWW5e82+FhZnseKLfQSM20ZT7Nw@mail.gmail.com>
References: <1478582291-57976-1-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:35889 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751725AbcKHIc1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 03:32:27 -0500
Received: by mail-qt0-f176.google.com with SMTP id w33so102811250qtc.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 00:32:27 -0800 (PST)
In-Reply-To: <1478582291-57976-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Yong Li <yong.b.li@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 8, 2016 at 6:18 AM, Phil Reid <preid@electromag.com.au> wrote:

> Need to ensure that reg_output is not updated while setting multiple
> bits. This makes the mutex locking behaviour for the set_multiple call
> consistent with that of the set_value call.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied for fixes.

Stable? Fixes:?

Yours,
Linus Walleij
