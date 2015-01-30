From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: zynq: Fix usb0 pins
Date: Fri, 30 Jan 2015 10:32:32 +0100
Message-ID: <CACRpkdYWoK2GJQGL3Krk4b5eUeo68tbKb=EYTMq0J+hbUkzdTw@mail.gmail.com>
References: <1422290895-4046-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:54103 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755803AbbA3Jcd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 04:32:33 -0500
Received: by mail-ie0-f182.google.com with SMTP id ar1so2166558iec.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 01:32:32 -0800 (PST)
In-Reply-To: <1422290895-4046-1-git-send-email-afaerber@suse.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ola Jeppson <ola@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, open list <linux-kernel@vger.kernel.org>

On Mon, Jan 26, 2015 at 5:48 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:

> Fix usb0 pin 19 -> 29 (matching ethernet1 pins and manual).
> Pin 19 is used for ethernet0 on the Parallella board.
>
> Fixes: add958cee967 ("pinctrl: Add driver for Zynq")
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>

Patch applied with S=C3=B6ren's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
