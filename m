From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add a real time compliance checklist
Date: Mon, 12 Oct 2015 10:48:28 +0200
Message-ID: <CACRpkdbpgW2av7S=KN7cczr3PmWuGi3qXxvFRaEkk7qHy8T6oA@mail.gmail.com>
References: <1443821496-19818-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36074 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbbJLIs3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2015 04:48:29 -0400
Received: by oihr205 with SMTP id r205so11895965oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2015 01:48:28 -0700 (PDT)
In-Reply-To: <1443821496-19818-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

On Fri, Oct 2, 2015 at 11:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Add some information about real time compliance to the driver document.
> Inspired by Grygorii Strashko's real time compliance patches.
>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Grygorii: can you help out with some heavy comments on all I do wrong
> in this document? Thx. For example I have no real clue of the difference
> between generic_handle_irq() and handle_nested_irq() in this context.
>
> We also need to think about new helper functions that can aid driver writers
> in getting drivers real time compliant and properly preemptible. Should we
> have the goal to make *all* drivers using the helpers use nested/threaded IRQs,
> or do you think there are (old) systems around that would suffer too much
> from this?

Poking Grygorii about this!

Yours,
Linus Walleij
