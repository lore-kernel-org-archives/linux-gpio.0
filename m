From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: of: Correct error handling in of_get_named_gpiod_flags
Date: Thu, 15 Jan 2015 18:32:29 +0100
Message-ID: <CACRpkdZ_2EzUhyu6Mtum6_7GRBE=myPND8N-EP8Z1Aba0WkA2Q@mail.gmail.com>
References: <1420792844-27781-1-git-send-email-hans.holmberg@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:63061 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752107AbbAORcb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jan 2015 12:32:31 -0500
Received: by mail-ig0-f181.google.com with SMTP id r2so13880924igi.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2015 09:32:29 -0800 (PST)
In-Reply-To: <1420792844-27781-1-git-send-email-hans.holmberg@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans Holmberg <hans.holmberg@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 9, 2015 at 9:40 AM, Hans Holmberg <hans.holmberg@intel.com> wrote:

> of_get_named_gpiod_flags fails with -EPROBE_DEFER in cases
> where the gpio chip is available and the GPIO translation fails.
>
> This causes drivers to be re-probed erroneusly, and hides the
> real problem(i.e. the GPIO number being out of range).
>
> Signed-off-by: Hans Holmberg <hans.holmberg@intel.com>

Patch applied for fixes with Alex's ACK.

Yours,
Linus Walleij
