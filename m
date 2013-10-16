From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: lpc32xx: Include linux/of.h header
Date: Wed, 16 Oct 2013 13:09:34 +0200
Message-ID: <CACRpkdYXKg1SMpP8ZJ2NzT6DM1zXSvJgxFyoVJKXtuUXzCzdcw@mail.gmail.com>
References: <1381917902-6829-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:44864 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760543Ab3JPLJg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2013 07:09:36 -0400
Received: by mail-ie0-f171.google.com with SMTP id tp5so929021ieb.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2013 04:09:35 -0700 (PDT)
In-Reply-To: <1381917902-6829-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 16, 2013 at 12:05 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> 'of_match_ptr' is defined in linux/of.h. Include it explicitly to
> avoid build breakage in the future.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
