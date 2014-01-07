From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: f7188x: set can_sleep attribute
Date: Tue, 7 Jan 2014 19:02:23 +0100
Message-ID: <CACRpkdb7O_PsSAdDahWAnQJK9uY4Pb7gBU5gn0b1gR_c=9T36g@mail.gmail.com>
References: <1388761448-5045-1-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:41275 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753704AbaAGSCY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 13:02:24 -0500
Received: by mail-ob0-f180.google.com with SMTP id wo20so530165obc.39
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2014 10:02:24 -0800 (PST)
In-Reply-To: <1388761448-5045-1-git-send-email-simon.guinot@sequanux.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>

On Fri, Jan 3, 2014 at 4:04 PM, Simon Guinot <simon.guinot@sequanux.org> wrote:

> Since request_muxed_region() is used to synchronize access on the
> Super-I/O controller, then the can_sleep attribute must be set for
> the f7188x GPIO chips.
>
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> ---
> Changes since v1: initialize can_sleep with a boolean

Patch applied.

Yours,
Linus Walleij
