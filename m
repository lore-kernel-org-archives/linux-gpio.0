From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ge: Convert to use devm_kstrdup
Date: Thu, 29 Jan 2015 10:33:36 +0100
Message-ID: <CACRpkdYvR=9ZBoTG+8DwYeeiBaUYbGu4iuKoWGXRmFkeEzEcQw@mail.gmail.com>
References: <1421805006.9831.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:40447 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761005AbbA2Jdi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jan 2015 04:33:38 -0500
Received: by mail-lb0-f170.google.com with SMTP id w7so25982245lbi.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2015 01:33:36 -0800 (PST)
In-Reply-To: <1421805006.9831.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>, Martyn Welch <martyn.welch@ge.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jan 21, 2015 at 2:50 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Use devm_kstrdup to simplify the error handling path.
> Also return -ENOMEM instead of 0 if devm_kstrdup fails.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
