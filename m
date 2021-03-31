Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E6BC433ED
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Mar 2021 12:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E5EB6195D
	for <linux-gpio@archiver.kernel.org>; Wed, 31 Mar 2021 12:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhCaMyK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 31 Mar 2021 08:54:10 -0400
Received: from mail.thorsis.com ([92.198.35.195]:59344 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235654AbhCaMyB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 08:54:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 885F93970;
        Wed, 31 Mar 2021 14:53:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ddy8e7D0VyZZ; Wed, 31 Mar 2021 14:53:59 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 53D3D390B; Wed, 31 Mar 2021 14:53:59 +0200 (CEST)
Date:   Wed, 31 Mar 2021 14:53:48 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/3] docs: gpio: mockup: Fix parameter name
Message-ID: <YGRw3PlLBYCPvPn1@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <20210329111648.7969-1-ada@thorsis.com>
 <20210329111648.7969-2-ada@thorsis.com>
 <CAHp75VdqtWS15YPvaPvy4yj5TdW7DDgFB+_bbavFqPBp1zm6eg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdqtWS15YPvaPvy4yj5TdW7DDgFB+_bbavFqPBp1zm6eg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

Am Wed, Mar 31, 2021 at 03:27:05PM +0300 schrieb Andy Shevchenko:
> On Mon, Mar 29, 2021 at 2:18 PM Alexander Dahl <ada@thorsis.com> wrote:
> >
> > Module probing with the parameter documented yielded this in kernel log:
> >
> >         gpio_mockup: unknown parameter 'gpio_named_lines' ignored
> >
> > The parameter documented did not match the parameter actually
> > implemented with commit 8a68ea00a62e ("gpio: mockup: implement naming
> > the lines") long before introducing the documentation.
> >
> > Fixes: commit 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
> 
> Alexander, in the entire series you are using the wrong format for the
> Fixes tag.
> I highly recommend to add in your .gitconfig file an alias:
>         one = show -s --pretty='format:%h (\"%s\")'

You're right. Sorry, I messed things up. I first had that line without
the additional "commit", and added it because I thought checkpatch
complained (which it probably did not).

The actual format is documented of course:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

I actually have a slightly different setting for pretty.fixes in my
~/.gitconfig for other demands. I'll go and make that project
dependent now.

Thanks for pointing this out.

Greets
Alex

> 
> `git one <commit ID>` will give you proper value to refer to the
> commit in question.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
