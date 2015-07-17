From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: lpc18xx: fix schmitt trigger setup
Date: Fri, 17 Jul 2015 14:22:48 +0200
Message-ID: <CACRpkda4Ctc_6jTTYrsx_xZF+3Xbd5BGbDaedJbOPWSVMhEkXA@mail.gmail.com>
References: <1436912727-11559-1-git-send-email-manabian@gmail.com>
	<1436912727-11559-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36249 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946030AbbGQMWt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:22:49 -0400
Received: by oibn4 with SMTP id n4so69549932oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:22:49 -0700 (PDT)
In-Reply-To: <1436912727-11559-2-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jul 15, 2015 at 12:25 AM, Joachim Eastwood <manabian@gmail.com> wrote:

> The param_val variable is what determines if schmitt
> trigger is enabled on a pin or not. A typo here mean
> that schmitt trigger was always enabled for standard
> and i2c pins.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
