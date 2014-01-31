From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bcm281xx: Use "unsigned gpio" consistently
 throughout the code
Date: Fri, 31 Jan 2014 12:40:56 +0100
Message-ID: <CACRpkdYjErY-A-1U=QRas5jXH7SS8mteX2uxe_3HdcrVBCJisg@mail.gmail.com>
References: <1390872738-822-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:64196 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753951AbaAaLk4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jan 2014 06:40:56 -0500
Received: by mail-ob0-f173.google.com with SMTP id vb8so4838303obc.4
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2014 03:40:56 -0800 (PST)
In-Reply-To: <1390872738-822-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linaro Patches <patches@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tim Kryger <tim.kryger@linaro.org>

On Tue, Jan 28, 2014 at 2:32 AM, Markus Mayer <markus.mayer@linaro.org> wrote:

> This patch removes some inconsistencies caused by the use of "int gpio"
> in some parts of the code and "unsigned gpio" in others.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>

Patch applied, nice for static syntax checkers.

But the variable should probably be renamed from
"gpio" to "offset" since it's a local offset number on this
very GPIO block, not the global GPIO numberspace.

No big deal though.

Yours,
Linus Walleij
