From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sx150x: Fix comparing wrong value with chip->irq_masked
Date: Tue, 13 Jan 2015 10:23:33 +0100
Message-ID: <CACRpkda0gj7uBepfD5pgOjnV0_YWeGWLDQafoZV0_FEy51kR=A@mail.gmail.com>
References: <1418710947.23043.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:37918 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbbAMJXe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 04:23:34 -0500
Received: by mail-ie0-f173.google.com with SMTP id y20so1725586ier.4
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 01:23:33 -0800 (PST)
In-Reply-To: <1418710947.23043.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gregory Bean <gbean@codeaurora.org>

On Tue, Dec 16, 2014 at 7:22 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Fix a copy-paste bug.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Alex's review tag.

Yours,
Linus Walleij
