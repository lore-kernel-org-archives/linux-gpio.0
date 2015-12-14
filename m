From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 092/182] pinctrl: bcm2835: use gpiochip data pointer
Date: Mon, 14 Dec 2015 14:57:37 +0100
Message-ID: <CACRpkdZxzin43oHNo9dcwq8br=ibFyPdsAZYi8cULZ9vQ7Ng4A@mail.gmail.com>
References: <1449667836-1932-1-git-send-email-linus.walleij@linaro.org>
	<566A5D30.2040401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35840 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451AbbLNN5i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 08:57:38 -0500
Received: by obcno2 with SMTP id no2so12436040obc.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 05:57:37 -0800 (PST)
In-Reply-To: <566A5D30.2040401@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Eric Anholt <eric@anholt.net>

On Fri, Dec 11, 2015 at 6:20 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 12/09/2015 06:30 AM, Linus Walleij wrote:
>> This makes the driver use the data pointer added to the gpio_chip
>> to store a pointer to the state container instead of relying on
>> container_of().
>
> This looks like it's fine, but I wonder what is the justification for
> the change? It might be good to mention that in the commit description.

It is in patch 000/182:
http://marc.info/?l=linux-gpio&m=144966662402660&w=2

I couldn't CC everyone on patch 000, because the mailing lists
complain if too many people are in the To: and CC fields. Damned if
I do, damned if I don't...

Yours,
Linus Walleij
