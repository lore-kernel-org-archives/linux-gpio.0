From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] [RFC] gpio: gpio-it87: Add support for IT8620 and IT8628
Date: Thu, 31 Mar 2016 11:59:28 +0200
Message-ID: <CACRpkdYC3Xwh2Dg+6xOKfro_qWvfDdci5-c_mYyLxw_WNfUXpA@mail.gmail.com>
References: <1459076863-26014-1-git-send-email-martin.blumenstingl@googlemail.com>
	<1459093382-23119-1-git-send-email-martin.blumenstingl@googlemail.com>
	<1459093382-23119-2-git-send-email-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36389 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752337AbcCaJ73 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 05:59:29 -0400
Received: by mail-oi0-f46.google.com with SMTP id r187so53323905oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 02:59:29 -0700 (PDT)
In-Reply-To: <1459093382-23119-2-git-send-email-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, jdelvare@suse.com, Alexandre Courbot <gnurou@gmail.com>, Denis Turischev <denis@compulab.co.il>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>, cvubrugier@fastmail.fm

On Sun, Mar 27, 2016 at 5:43 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> These chips seem to have a 9th GPIO block (thus supporting 72 GPIOs)
> which is configured through SuperIO register 0xd2 (output enable) and
> 0xd3 (simple I/O). This is also the reason why io_size is larger than
> on IT8728 / IT8732. Unfortunately I don't have hardware to test this 9th
> GPIO block.
> I am also not sure about not configuring the Simple I/O registers as the
> hardware I have only uses GPIO block 8. Reading back the values of
> 0xc0-0xc7 (as configured by the BIOS/EFI on my board) shows that all
> have 0xff set.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied.

Yours,
Linus Walleij
