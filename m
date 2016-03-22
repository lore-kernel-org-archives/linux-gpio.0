From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mb86s7x: Remove redundant platform_set_drvdata() call
Date: Tue, 22 Mar 2016 11:33:38 +0100
Message-ID: <CACRpkdY+jW8S5qKoEhj38ni=gQoehnRKpM4wT6Ft3-k-DBc+yw@mail.gmail.com>
References: <1457527695.720.4.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35685 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758498AbcCVKdj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 06:33:39 -0400
Received: by mail-oi0-f46.google.com with SMTP id w20so112702651oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 03:33:39 -0700 (PDT)
In-Reply-To: <1457527695.720.4.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 9, 2016 at 1:48 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Set it once is enough, so remove the second platform_set_drvdata() call.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for v4.7.

Yours,
Linus Walleij
