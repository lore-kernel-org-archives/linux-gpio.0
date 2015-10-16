From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC/RFT 0/2] gpio: allow auto population of request/free
Date: Fri, 16 Oct 2015 23:04:37 +0200
Message-ID: <CACRpkdbbqz6pFak1vaE8+-1_t5utQ+=fP3hwKvS=fJO8FJiZXw@mail.gmail.com>
References: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
	<561D6A10.1070801@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:32971 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751278AbbJPVEh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 17:04:37 -0400
Received: by oiad129 with SMTP id d129so8895531oia.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 14:04:37 -0700 (PDT)
In-Reply-To: <561D6A10.1070801@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Jonas Gorski <jogo@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>, =?UTF-8?Q?Kader_Y=C4=B1lmaz?= <kaderyilmaz.92@hotmail.com>, Vikram Prakash <vikramp@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

On Tue, Oct 13, 2015 at 10:31 PM, Ray Jui <rjui@broadcom.com> wrote:

> One of the changes we made is to make use of the DT based gpio-ranges
> properly, i.e., we are setting GPIO->pinmux mapping in device tree
> instead of hardcoded in the driver. This feature is already supported by
> of_gpiochip_add_pin_range, called by of_gpiochip_add, called by
> gpiochip_add.
>
> Due to this, I'm not sure if the Cygnus GPIO driver is suitable as an
> example for this change.
(...)
> Linus, please advise how we should proceed with this.

It is more important that you switch to fetching the ranges from the
device tree. That is a very important clean-up.

Yours,
Linus Walleij
