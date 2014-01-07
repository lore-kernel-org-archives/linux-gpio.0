From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: clps711x: Use of_match_ptr()
Date: Tue, 7 Jan 2014 18:54:06 +0100
Message-ID: <CACRpkdaqgziUm13MpoZFdCOWKqW0atYpCW1-TYoZZ3msk_0sRQ@mail.gmail.com>
References: <1387894134-11007-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:49773 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbaAGRyH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 12:54:07 -0500
Received: by mail-ob0-f179.google.com with SMTP id wm4so521715obc.24
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2014 09:54:06 -0800 (PST)
In-Reply-To: <1387894134-11007-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Dec 24, 2013 at 3:08 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> There is no reason to keep the OF data if the driver was compiled
> without DT support.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Patch applied.

Yours,
Linus Walleij
