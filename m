From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: pl061: returning with lock held in pl061_irq_type()
Date: Thu, 15 Oct 2015 16:45:37 +0200
Message-ID: <CACRpkdbqWU-NO=tvZ5DvmKT_R31TKz_PTLOt4d5bmj96Gq4LrA@mail.gmail.com>
References: <20151008064001.GA25441@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33391 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782AbbJOOpi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2015 10:45:38 -0400
Received: by obbwb3 with SMTP id wb3so40299530obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2015 07:45:37 -0700 (PDT)
In-Reply-To: <20151008064001.GA25441@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Oct 8, 2015 at 9:12 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We were returning with "chip->lock" held by mistake.  It's safe to
> move the return to before we take the spinlock.
>
> Fixes: 1dbf7f299f90 ('gpio: pl061: detail IRQ trigger handling')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch applied.

Yours,
Linus Walleij
