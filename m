From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: generic: support input-only chips
Date: Mon, 27 Jul 2015 15:01:38 +0200
Message-ID: <CACRpkdZq+Ch61DzyTZgfzbVTCxHtPrzSPZN+p4pi=Gc21WKrGg@mail.gmail.com>
References: <1437570319-25297-1-git-send-email-rabin@rab.in>
	<1437570319-25297-2-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:32990 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262AbbG0NBj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 09:01:39 -0400
Received: by obdeg2 with SMTP id eg2so58716070obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 06:01:39 -0700 (PDT)
In-Reply-To: <1437570319-25297-2-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 22, 2015 at 3:05 PM, Rabin Vincent <rabin@rab.in> wrote:

> Allow chips to indicates that they are input-only and thus cannot set
> the output value.  This will be used by the gpio-etraxfs driver.
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Looks useful, patch applied!

Yours,
Linus Walleij
