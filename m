From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 18/33] pcmcia: sa1100: provide generic CF support
Date: Wed, 14 Sep 2016 13:13:44 +0200
Message-ID: <CACRpkdZ9h=thWQeHfUs2FstEiKP1ea5MLH2eo74EuEX-PKjmSw@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJl3-0000nS-Nw@rmk-PC.armlinux.org.uk>
 <CACRpkda7qHx4JVdVv+q3=twTup9rDD2ke8K-tSH9CkhZMQqemg@mail.gmail.com> <20160914090602.GB1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34122 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932980AbcINLNr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 07:13:47 -0400
Received: by mail-oi0-f43.google.com with SMTP id m11so15895455oif.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2016 04:13:45 -0700 (PDT)
In-Reply-To: <20160914090602.GB1041@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Wed, Sep 14, 2016 at 11:06 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:

> Thanks, I've included a change there, should be part of the branch by
> the time you get this email - sa1100 head should be 9ad0f8181616.  If
> not, it's probably still being pushed out over my slow 'net link.

Thanks, fetched it and tested, this fix is there things work so far.

>> (It revealed another bug in fetching GPIOs but it is an orthogobal
>> problem altogether, looking into it.)
>
> If you're referring to the generic sa1100 pcmcia code, there's a fix
> for that already in my branch.

Unfortunately not, the bug is still there, I'll point it out in the relevant
patch, just need to do a boot test.

Yours,
Linus Walleij
