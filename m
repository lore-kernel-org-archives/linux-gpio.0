From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: max732x: Propagate wake-up setting to parent
 irq controller
Date: Mon, 4 May 2015 15:32:31 +0200
Message-ID: <CACRpkdYT6OMy1GSkoP3Tab3xcpC6qPFfX=aRVr4iUvBe5V6hjw@mail.gmail.com>
References: <1429637257-11055-1-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33404 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640AbbEDNcb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 09:32:31 -0400
Received: by oica37 with SMTP id a37so111655483oic.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2015 06:32:31 -0700 (PDT)
In-Reply-To: <1429637257-11055-1-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 21, 2015 at 7:27 PM, Semen Protsenko
<semen.protsenko@globallogic.com> wrote:

> Set .irq_set_wake callback to prevent possible issues on wake-up.
>
> This patch was inspired by this commit:
> b80eef95beb04760629822fa130aeed54cdfafca
>
> Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>

Are these real, observed issues?

Patch applied, but it seems we need a general approach to
cover a few GPIO drivers with this kind of thing.

Is this how we should always do it?

Yours,
Linus Walleij
