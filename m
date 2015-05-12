From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: fix gpio leak in gpiochip_add error path
Date: Tue, 12 May 2015 10:57:15 +0200
Message-ID: <CACRpkdZTgBj=uj8XygzAYddOrXzQLEV+EYk8hKTEq2DLwVfdLQ@mail.gmail.com>
References: <1430753005-19691-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34675 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752790AbbELI5Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:57:16 -0400
Received: by obfe9 with SMTP id e9so436365obf.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:57:15 -0700 (PDT)
In-Reply-To: <1430753005-19691-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:23 PM, Johan Hovold <johan@kernel.org> wrote:

> Make sure to free any hogged gpios on errors in gpiochip_add.
>
> Also move all forward declarations to the top of the file.
>
> Fixes: f625d4601759 ("gpio: add GPIO hogging mechanism")
> Signed-off-by: Johan Hovold <johan@kernel.org>

Applied for fixes.

Yours,
Linus Walleij
