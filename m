From: Marty Plummer <netz.kernel@gmail.com>
Subject: Re: [PATCH] gpio: f7188x: Add a missing break
Date: Sun, 30 Apr 2017 18:45:01 -0500
Message-ID: <20170430234500.lb4gp6jvuclziltp@tha-monstah.mydomain>
References: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
 <CACRpkdb=wia6hvVwVf6MphY86ATAr4KNxspOT6uCNyFiQutsKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36501 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968401AbdD3Xmo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Apr 2017 19:42:44 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb=wia6hvVwVf6MphY86ATAr4KNxspOT6uCNyFiQutsKw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Apr 28, 2017 at 10:09:39AM +0200, Linus Walleij wrote:
> On Wed, Apr 26, 2017 at 9:08 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > A break statement was obviously intended here.
> >
> > Fixes: d69843e416d3 ("gpio: f7188x: Add F71889A GPIO support.")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Patch applied.
> 
> Yours,
> Linus Walleij
How embarrassing, I completely missed that. Good catch.

Marty.
