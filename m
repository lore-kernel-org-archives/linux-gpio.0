From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: f7188x: Add a missing break
Date: Fri, 28 Apr 2017 10:09:39 +0200
Message-ID: <CACRpkdb=wia6hvVwVf6MphY86ATAr4KNxspOT6uCNyFiQutsKw@mail.gmail.com>
References: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:37900 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968727AbdD1IJl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 04:09:41 -0400
Received: by mail-it0-f44.google.com with SMTP id f187so32105362ite.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 01:09:41 -0700 (PDT)
In-Reply-To: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marty Plummer <netz.kernel@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 26, 2017 at 9:08 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> A break statement was obviously intended here.
>
> Fixes: d69843e416d3 ("gpio: f7188x: Add F71889A GPIO support.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
