From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: generic: add get_direction support
Date: Tue, 30 Jun 2015 08:19:02 +0200
Message-ID: <CACRpkdZS_VYsXLBN9SQpcFguNdTJKiWLKJ6__WSmOx72tooMrw@mail.gmail.com>
References: <1434126035-18596-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36536 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbbF3GTD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 02:19:03 -0400
Received: by oift81 with SMTP id t81so143682oif.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2015 23:19:02 -0700 (PDT)
In-Reply-To: <1434126035-18596-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Jun 12, 2015 at 6:20 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Allow to determine the current direction configuration by
> reading back from the direction register.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Patch applied for the next kernel cycle (4.3).

Yours,
Linus Walleij
