From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpio: Make the vararg hacks not pass magic values
Date: Wed, 14 Jan 2015 13:33:36 +0100
Message-ID: <CACRpkdYg=bwRtsj8gbxbZnLtg+746xoJQcQf9FdNkhh_poR=PA@mail.gmail.com>
References: <1420620297-7329-1-git-send-email-oliver+list@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38578 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbbANMdh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 07:33:37 -0500
Received: by mail-ig0-f174.google.com with SMTP id hn15so22139254igb.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 04:33:36 -0800 (PST)
In-Reply-To: <1420620297-7329-1-git-send-email-oliver+list@schinagl.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Olliver Schinagl <oliver+list@schinagl.nl>
Cc: Alexandre Courbot <gnurou@gmail.com>, Olliver Schinagl <oliver@schinagl.nl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 7, 2015 at 9:44 AM, Olliver Schinagl
<oliver+list@schinagl.nl> wrote:

> From: Olliver Schinagl <oliver@schinagl.nl>
>
> Right now, in consumer.h, there's some vararg hacks that pass 0 as the
> flags. What actually is passed however is GPIOD_ASIS, which naturally is
> also 0. Using the define/enum rather then the magic 0 makes it the
> define more readable to a passer by.
>
> Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>

Patch applied.

Yours,
Linus Walleij
