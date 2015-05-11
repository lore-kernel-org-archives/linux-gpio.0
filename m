From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] Revert "gpio: generic: clamp retured value to [0,1]"
Date: Mon, 11 May 2015 11:46:57 +0200
Message-ID: <CACRpkdYWEygtL3h4Z6uaWGxc1ac2Q7_X9gddCobUj_dHpSiK0g@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34888 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752610AbbEKJq6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 05:46:58 -0400
Received: by obcus9 with SMTP id us9so66069254obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2015 02:46:58 -0700 (PDT)
In-Reply-To: <1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Apr 29, 2015 at 5:34 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:

> This reverts commit 25b35da7f4cce82271859f1b6eabd9f3bd41a2bb.
>
> The original change is a fast workaround in GPIO generic driver,
> which is properly fixed by Alexandre's 23600969ff centralized handling
> of return values from GPIO chip drivers.
>
> To avoid a redundant check and copy/paste confusion, it is better to
> revert the change done in a particular driver.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

I'm gonna drop this patch, because the code is helpful like this,
clear to see what is going on.

In the long run I want to change the signature of the get/set functions
to take bools because that is what they actually handle.

Yours,
Linus Walleij
