From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: grgpio: off by one in grgpio_to_irq()
Date: Tue, 13 Jan 2015 10:22:08 +0100
Message-ID: <CACRpkdbPzjnqOj2Tgy19a=U9n5Ah0qkWj9JOPUw6WAT10x1SWQ@mail.gmail.com>
References: <20141216235358.GD31467@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:56067 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbAMJWJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 04:22:09 -0500
Received: by mail-ig0-f174.google.com with SMTP id hn15so15951525igb.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 01:22:08 -0800 (PST)
In-Reply-To: <20141216235358.GD31467@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 17, 2014 at 12:53 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> "gc->ngpio" is a number between 1 and GRGPIO_MAX_NGPIO.  If "offset" is
> GRGPIO_MAX_NGPIO then we're going one step beyond the end of the
> priv->lirqs[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Alex's ACK.

Yours,
Linus Walleij
