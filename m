From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: pxa: checking IS_ERR() instead of NULL
Date: Tue, 5 Jan 2016 11:19:57 +0100
Message-ID: <CACRpkdY3Gv-pCh=LJ32AQpGd4qnoUB_-3WHZh1JX=H6cbQ4WYg@mail.gmail.com>
References: <20160105095637.GE23619@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35548 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbcAEKT6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 05:19:58 -0500
Received: by mail-oi0-f41.google.com with SMTP id l9so243689158oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 02:19:58 -0800 (PST)
In-Reply-To: <20160105095637.GE23619@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jan 5, 2016 at 10:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> irq_domain_add_legacy() returns NULL on error, it doesn't return error
> pointers.
>
> Fixes: 384ca3c6a28d ('gpio: pxa: change the interrupt management')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
