From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock
Date: Tue, 28 Jul 2015 14:40:57 +0200
Message-ID: <CACRpkdZ67vr5kg0OG989EPyaSb440PDKBD1xpCy9_tgTOcQmCg@mail.gmail.com>
References: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36158 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755116AbbG1Mk6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2015 08:40:58 -0400
Received: by obnw1 with SMTP id w1so82676830obn.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2015 05:40:57 -0700 (PDT)
In-Reply-To: <1437486870-11135-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 21, 2015 at 3:54 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> mpc8xxx_gpio_chip.lock needs to be a real spinlock in preempt-rt.
> Especially the interrupt related functions can not be converted to a
> sleeping lock.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied with Uwe's ACK.

Yours,
Linus Walleij
