From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Implement get_direction callback
Date: Fri, 1 Apr 2016 14:47:26 +0200
Message-ID: <CACRpkdaE3UKM3dhydXmHfFMUJ5r7murX3baYmm0ug9Y8P4G7HA@mail.gmail.com>
References: <1459177104-24353-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34632 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616AbcDAMr2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 08:47:28 -0400
Received: by mail-oi0-f48.google.com with SMTP id o62so103366396oig.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 05:47:28 -0700 (PDT)
In-Reply-To: <1459177104-24353-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Mar 28, 2016 at 4:58 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Implement gpio_chip's get_direction() callback, that lets other
> drivers get particular GPIOs direction using gpiod_get_direction().
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
