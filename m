From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH RFT] gpio: moxart: Actually set output state in moxart_gpio_direction_output()
Date: Tue, 25 Mar 2014 11:15:17 +0900
Message-ID: <CAAVeFuJ+iePakuB0NLRveDCV7+QKNGiV0qodSQDGTxctgB_RmQ@mail.gmail.com>
References: <1395667506.4779.4.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:54177 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbaCYCPi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Mar 2014 22:15:38 -0400
Received: by mail-ve0-f173.google.com with SMTP id oy12so6614174veb.18
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2014 19:15:37 -0700 (PDT)
In-Reply-To: <1395667506.4779.4.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonas Jensen <jonas.jensen@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 24, 2014 at 10:25 PM, Axel Lin <axel.lin@ingics.com> wrote:
> moxart_gpio_direction_output() ignored the state passed into it. Fix it.
> Also slightly adjust the code to avoid forward declaration.

Considering that the code adjustment actually takes most of the volume
of this patch, could you maybe separate these two changes into their
own patches so the actual fix gets easier to spot?
