From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rc5t583: Remove redundant check
Date: Mon, 24 Feb 2014 14:52:25 +0100
Message-ID: <CACRpkdYEQa3CzJfBDVq1oKXjQj3f7HFjuVb+HH3uzqLbzdmwwA@mail.gmail.com>
References: <1392470647-16842-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:50955 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752560AbaBXNw0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 08:52:26 -0500
Received: by mail-oa0-f43.google.com with SMTP id i7so4033422oag.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 05:52:26 -0800 (PST)
In-Reply-To: <1392470647-16842-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Feb 15, 2014 at 2:24 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> Variable "offset" cannot be negative, so no need to check if it
> greater than zero or equal.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Patch applied.

Nice patches by the way, are you finding these by using some
static code checking tool?

Yours,
Linus Walleij
