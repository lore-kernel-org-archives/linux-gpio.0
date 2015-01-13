From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: consumer: use correct retval for placeholder functions
Date: Tue, 13 Jan 2015 09:56:42 +0100
Message-ID: <CACRpkdZi8+6v02kjZrLt3XGeZMdHtZwDyB_FohNeBtbDC8RpsA@mail.gmail.com>
References: <1418723959-10253-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:58317 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668AbbAMI4n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 03:56:43 -0500
Received: by mail-ie0-f175.google.com with SMTP id x19so1625693ier.6
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 00:56:42 -0800 (PST)
In-Reply-To: <1418723959-10253-1-git-send-email-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Tue, Dec 16, 2014 at 10:59 AM, Wolfram Sang <wsa@the-dreams.de> wrote:

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> These functions are supposed to return an error pointer, not NULL.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Worried that some driver may depend on this behaviour, but
patch applied anyway, let's deal with it.

Yours,
Linus Walleij
