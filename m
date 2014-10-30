From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: msm-v1: Fix typo in function argument
Date: Thu, 30 Oct 2014 16:00:39 +0100
Message-ID: <CACRpkdYr8K7HM1G=EkUUeuTO_B8X0-sc9hh5C9bLxy=Bz2NkkA@mail.gmail.com>
References: <1414160997-30575-1-git-send-email-daniel.thompson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:40696 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760485AbaJ3PAt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Oct 2014 11:00:49 -0400
Received: by mail-ig0-f177.google.com with SMTP id hl2so4335933igb.10
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2014 08:00:49 -0700 (PDT)
In-Reply-To: <1414160997-30575-1-git-send-email-daniel.thompson@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jiri Kosina <trivial@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Patch Tracking <patches@linaro.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Oct 24, 2014 at 4:29 PM, Daniel Thompson
<daniel.thompson@linaro.org> wrote:

> irq_set_irq_wake() treats its second argument as a boolean. It is much
> easier to read code when constant booleans are either 0 or 1!
>
> This particular line of code distracted me somewhat when I was doing a bit of
> work in a code browser since it (spuriously) got me worried that I had
> misunderstood how irq_set_irq_wake() worked.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Patch applied with Alexandre's Review tag.

Yours,
Linus Walleij
