From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl/amd: white space cleanups in amd_gpio_dbg_show()
Date: Wed, 11 Jan 2017 14:41:02 +0100
Message-ID: <CACRpkdYWm6Y5B3e_GKSCZkoXQG0XaQr7cZgwJTGHe=9K__rSxQ@mail.gmail.com>
References: <20170107063214.GE26959@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:33390 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937922AbdAKNlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 08:41:03 -0500
Received: by mail-qt0-f177.google.com with SMTP id v23so195181844qtb.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 05:41:03 -0800 (PST)
In-Reply-To: <20170107063214.GE26959@elgon.mountain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shah@elgon.mountain, Nehal-bakulchandra <Nehal-Bakulchandra.shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 7, 2017 at 7:32 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We accidentally deleted two tabs from the first line, but even with that
> fixed the conditions were not really kernel style.  Put the && at the
> end of the line so we can align the condition clauses.  Also add spaces
> around the "+" operator.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
