From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: initialize ret to zero to avoid returning garbage
Date: Tue, 13 Sep 2016 14:46:19 +0200
Message-ID: <CACRpkdZOd2qeCCvC3f0n4SZtmt9PQMOyOGuyS7Oio6qLRc+0vQ@mail.gmail.com>
References: <20160909083154.26442-1-colin.king@canonical.com>
 <CACRpkdYHRjUoANEibzexrmGQiVHL4cgYWZPr6H-_GA1HqqpTNw@mail.gmail.com>
 <944b682f-6217-f759-7429-339274cd5894@electromag.com.au> <18457294.js4cyg49EU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36778 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbcIMMqU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 08:46:20 -0400
Received: by mail-oi0-f42.google.com with SMTP id q188so263881798oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 05:46:20 -0700 (PDT)
In-Reply-To: <18457294.js4cyg49EU@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Phil Reid <preid@electromag.com.au>, Colin King <colin.king@canonical.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 13, 2016 at 2:31 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Please try to avoid adding initializations in the local variable
> declaration, they just hide otherwise useful warnings when
> you get a function that actually does something incorrect
> in some code paths.

Agreed, sorry for my ignorance :(

I duly corrected the git and reverted the other patch instead of yours.

Yours,
Linus Walleij
