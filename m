From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpiolib: potential oops on failure path
Date: Sat, 18 Jun 2016 10:52:52 +0200
Message-ID: <CACRpkdbYYyH805OGa-gkWkj0+JiApKo-kND=h1Oaycd86EcLRw@mail.gmail.com>
References: <20160617091550.GB25609@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33309 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864AbcFRIwy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 04:52:54 -0400
Received: by mail-oi0-f41.google.com with SMTP id u201so148673145oie.0
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 01:52:53 -0700 (PDT)
In-Reply-To: <20160617091550.GB25609@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jun 17, 2016 at 11:15 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> If anon_inode_getfd() fails then "i" is set to GPIOHANDLES_MAX.  It
> means that we will read beyond the end of the array and dereference an
> invalid pointer.
>
> Fixes: d7c51b47ac11 ('gpio: userspace ABI for reading/writing GPIO lines')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ouch, yeah that happens when you request max number of handles, thanks.

Patch applied.

Yours,
Linus Walleij
