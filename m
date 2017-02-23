From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: altera-a10sr: Set gpio_chip parent property
Date: Thu, 23 Feb 2017 11:14:24 +0100
Message-ID: <CACRpkdZVNNnNQsmNDWpAen_eJyvY+Bqp8LTbV4QbCVrps4fqdg@mail.gmail.com>
References: <1487015398-4603-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:36305 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751061AbdBWKOb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 05:14:31 -0500
Received: by mail-it0-f42.google.com with SMTP id h10so160820968ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 02:14:31 -0800 (PST)
In-Reply-To: <1487015398-4603-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 13, 2017 at 8:49 PM,  <thor.thayer@linux.intel.com> wrote:

> From: Thor Thayer <thor.thayer@linux.intel.com>
>
> Set the gpio_chip parent property since some recent functions
> such as devprop_gpiochip_set_names() can use it.
>
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
