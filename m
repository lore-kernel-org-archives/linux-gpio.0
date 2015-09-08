From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Propagate errors from chip->get()
Date: Tue, 8 Sep 2015 15:04:09 +0200
Message-ID: <CACRpkdbbPizi_x1tYmQ_EePgGTRvpwvezdSmH=BVNciF5b+j9g@mail.gmail.com>
References: <1440780258-23652-1-git-send-email-bjorn.andersson@sonymobile.com>
	<20150901051613.GE13472@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:36255 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754751AbbIHNEK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 09:04:10 -0400
Received: by obqa2 with SMTP id a2so82327705obq.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 06:04:09 -0700 (PDT)
In-Reply-To: <20150901051613.GE13472@usrtlx11787.corpusers.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 1, 2015 at 7:16 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> Linus, Alexandre, please feel free to apply this with -ENOTSUPP in
> accordance to Alexandre's comment in [1], if you prefer that. I picked
> -EIO as that's what's used in most other places when the get() op is
> missing.

I applied as-is for fixes.

> Maybe we should follow up with separate patch to make that consistent?

A patch doing this would be appropriate for devel as it makes
deeper semantic changes.

Yours,
Linus Walleij
