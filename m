From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: tb10x: Remove redundant of_match_ptr helper
Date: Thu, 2 Jan 2014 14:03:47 +0100
Message-ID: <CACRpkdY-ofdG3QCaz3JiKsAf3MGJhYkfzV+vkYgWieW6+GEHtg@mail.gmail.com>
References: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
	<1387621661-22128-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:55598 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbaABNDr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 08:03:47 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so14325173obc.34
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 05:03:47 -0800 (PST)
In-Reply-To: <1387621661-22128-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 21, 2013 at 11:27 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> 'tb10x_gpio_dt_ids' is always compiled in. Hence the
> helper macro is not needed.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
