From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v3] Documentation: gpio: board: add flags parameter to
 gpiod_get*() functions
Date: Tue, 8 Sep 2015 15:45:49 +0200
Message-ID: <CACRpkdZTPstRkWYvotyC3MJzaCp2A+w=v5+5xvf=DEG0TGs_jg@mail.gmail.com>
References: <1441217230-4530-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35511 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175AbbIHNpt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 09:45:49 -0400
Received: by obuk4 with SMTP id k4so83680876obu.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 06:45:49 -0700 (PDT)
In-Reply-To: <1441217230-4530-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Sep 2, 2015 at 8:07 PM, Dirk Behme <dirk.behme@gmail.com> wrote:

> With commit 39b2bbe3d715 ("gpio: add flags argument to gpiod_get*()
> functions") the gpiod_get*() functions got a 'flags' parameter. Reflect
> this in the documentation, too.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
> Changes in v3: Add a short note to mention the fact that the example will
>                switch the LEDs on, similarly to the existing explanation
>                for the "power" GPIO.

Patch applied.

Thanks for helping out keeping docs in sync!

Yours,
Linus Walleij
