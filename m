From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Please pick commit d71cf15b865b to stable
Date: Tue, 25 Oct 2016 13:48:47 +0200
Message-ID: <CACRpkdZFbzFc4QsemEXQegt05MZYVx=27cX2c6WdLvNtp7-Ayg@mail.gmail.com>
References: <CACRpkdY9Y=7QCdu-sNG=S32RzGtHK7yF9CbdNi7gwRR2xJ1xUA@mail.gmail.com>
 <20161025093919.GA21075@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:35986 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752711AbcJYLst (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 07:48:49 -0400
Received: by mail-qk0-f175.google.com with SMTP id o68so258224222qkf.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2016 04:48:48 -0700 (PDT)
In-Reply-To: <20161025093919.GA21075@kroah.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: stable <stable@vger.kernel.org>, Liu Gang <Gang.Liu@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 25, 2016 at 11:39 AM, Greg KH <greg@kroah.com> wrote:
> On Tue, Oct 25, 2016 at 11:19:45AM +0200, Linus Walleij wrote:
>> Hi stable maintainers,
>>
>> commit d71cf15b865bdd45925f7b094d169aaabd705145
>> ("gpio: mpc8xxx: Correct irq handler function")
>> should be picked to the stable kernel.
>
> Any hint as to how far back it should go?

To the dawn of time, as long as it applies.

The bug was there when the driver was moved into
the gpiolib subsystem in
commit c68308dd50c3827a4ce77a1d70e0eb2d2521cafd
"gpio: move mpc8xxx/512x gpio driver to drivers/gpio"

Yours,
Linus Walleij
