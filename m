From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio-stp-xway: Fix enabling the highest bit of the
 PHY LEDs
Date: Mon, 1 Jun 2015 16:44:01 +0200
Message-ID: <CACRpkdaNuwXnBqyBG0371Hm28yS3f-acyPyHDEiBjzgMWn62Zg@mail.gmail.com>
References: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35553 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751746AbbFAOoC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 10:44:02 -0400
Received: by obcnx10 with SMTP id nx10so99512404obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 07:44:01 -0700 (PDT)
In-Reply-To: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, John Crispin <blogic@openwrt.org>

On Mon, May 25, 2015 at 10:39 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> 0x3 only masks two bits, but three bits have to be allowed. This fixes
> GPHY0 LED2 (which is the highest bit of phy2) on my board.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with John's ACK.

Yours,
Linus Walleij
