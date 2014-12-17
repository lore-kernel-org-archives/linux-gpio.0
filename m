From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: sx150x: Fix comparing wrong value with chip->irq_masked
Date: Wed, 17 Dec 2014 11:27:16 +0900
Message-ID: <CAAVeFuLKHAN4nmW2Q7DS1hb-irBSVub70-qxOh5AJEzeV0qG5g@mail.gmail.com>
References: <1418710947.23043.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:51796 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027AbaLQC1h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Dec 2014 21:27:37 -0500
Received: by mail-ig0-f170.google.com with SMTP id r2so8786863igi.5
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2014 18:27:36 -0800 (PST)
In-Reply-To: <1418710947.23043.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gregory Bean <gbean@codeaurora.org>

On Tue, Dec 16, 2014 at 3:22 PM, Axel Lin <axel.lin@ingics.com> wrote:
> Fix a copy-paste bug.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
