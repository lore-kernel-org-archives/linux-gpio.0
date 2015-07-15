From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] Make generic MMIO GPIO aware of the pinctrl subsystem
Date: Wed, 15 Jul 2015 08:49:13 +0200
Message-ID: <CACRpkdZNFMHLnpT_R2SgBi12qnUoHoH3L9rHOYgpmB=NnHGU3w@mail.gmail.com>
References: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35284 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751598AbbGOGtO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 02:49:14 -0400
Received: by oihq81 with SMTP id q81so22214027oih.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2015 23:49:13 -0700 (PDT)
In-Reply-To: <1434718697-31335-1-git-send-email-michael@smart-africa.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael van der Westhuizen <michael@smart-africa.com>, Jonas Jensen <jonas.jensen@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Kamlakant Patel <kamlakant.patel@linaro.org>

On Fri, Jun 19, 2015 at 2:58 PM, Michael van der Westhuizen
<michael@smart-africa.com> wrote:

> While adding pinctrl awareness to gpio-dwapb it became clear to me that
> all but one GPIO driver using generic MMIO GPIO lacked pinctrl
> awareness.
>
> I moved my pinctrl integration efforts to the gpio-generic driver and
> cleaned up moxart-gpio, the only pinctrl-integrated gpio-generic user
> in-tree.

I'd like to see Jonas' Tested-by before applying this, if possible.

Jonas?

Yours,
Linus Walleij
