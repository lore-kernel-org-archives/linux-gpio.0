From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: remove remaining users of gpiochip_remove() retval
Date: Wed, 1 Oct 2014 09:43:21 +0200
Message-ID: <CACRpkdaCcaNmv=fciiVJdmu3M7-dhqjqgAuP6eeJkkfptFbA1Q@mail.gmail.com>
References: <1412086542-1662-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:51068 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074AbaJAHnW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Oct 2014 03:43:22 -0400
Received: by mail-ig0-f173.google.com with SMTP id h18so470339igc.6
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2014 00:43:22 -0700 (PDT)
In-Reply-To: <1412086542-1662-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 30, 2014 at 4:15 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:

> Some driver in gpio still check for return value from gpiochip_remove
> Get rid of the check for return value.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
>
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>

This is already fixed in the GPIO tree, and in linux-next.

I have got more patches like this from other people, and cannot
quite understand what kind of tree you are actually looking at?

Yours,
Linus Walleij
