From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: gpiolib-of: Use PTR_ERR_OR_ZERO
Date: Fri, 31 Jan 2014 12:33:06 +0100
Message-ID: <CACRpkdb7HBnbdZ+6zz0H8w=ghNZb2p9yjzyWHhzTkWt0Hh18Kw@mail.gmail.com>
References: <1390805108-20766-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:40275 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932316AbaAaLdH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jan 2014 06:33:07 -0500
Received: by mail-oa0-f47.google.com with SMTP id m1so5006316oag.20
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2014 03:33:06 -0800 (PST)
In-Reply-To: <1390805108-20766-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Patch Tracking <patches@linaro.org>

On Mon, Jan 27, 2014 at 7:45 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> PTR_RET is deprecated. Use PTR_ERR_OR_ZERO instead. While at it
> also include missing err.h header.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
