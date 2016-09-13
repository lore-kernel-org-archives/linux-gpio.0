From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] driver: base: pinctrl: return error from pinctrl_bind_pins()
Date: Tue, 13 Sep 2016 23:01:39 +0200
Message-ID: <CACRpkdZewXRXqj2nFTwbnbEor=OSV44AGedwCWOVROmktxcZQQ@mail.gmail.com>
References: <57D7A700.8080402@mentor.com> <CACRpkdandEmr5PTfhUt39wMezMpbE9wEHDTR=jMidzUZY2Cn7A@mail.gmail.com>
 <57D80212.7060303@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36688 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755915AbcIMVBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 17:01:41 -0400
Received: by mail-oi0-f54.google.com with SMTP id q188so286783545oia.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 14:01:40 -0700 (PDT)
In-Reply-To: <57D80212.7060303@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Deepak Das <deepak_das@mentor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, vzapolsk <Vladimir_Zapolskiy@mentor.com>

On Tue, Sep 13, 2016 at 3:41 PM, Deepak Das <deepak_das@mentor.com> wrote:

>> Can you confim that this works for you too?
>
> Yes, This works for me as well but do we really need this extra error
> message ?

Nah, good point. I'll go in and drop it then.

Yours,
Linus Walleij
