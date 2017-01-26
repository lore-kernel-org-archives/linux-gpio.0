From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] of: Pass GPIO label down to gpiod_request when
 using get_gpiod_from_child
Date: Thu, 26 Jan 2017 15:44:42 +0100
Message-ID: <CACRpkdbe2x3q2cqQ0EqaAU-Be0-FXa8q-oUd5XCYdKMnB15gyg@mail.gmail.com>
References: <20170112163924.4414-1-alexander.stein@systec-electronic.com>
 <CACRpkdbbRcKvYuE4_oA2pPQsCpEhb_JbPDyvrcuJvK5y1BD6Og@mail.gmail.com> <CAMuHMdXUM8dCPwWjXmUP4gefB-_Apw7-LBENxjq7AqimEc+EXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:38118 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753050AbdAZOon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 09:44:43 -0500
Received: by mail-it0-f51.google.com with SMTP id c7so34590182itd.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 06:44:43 -0800 (PST)
In-Reply-To: <CAMuHMdXUM8dCPwWjXmUP4gefB-_Apw7-LBENxjq7AqimEc+EXQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, Alexandre Courbot <gnurou@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Jan 24, 2017 at 12:18 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> -gpio-780 (?): gpiod_set_debounce: missing set() or set_debounce() operations
> +gpio-780 (SW30): gpiod_set_debounce: missing set() or set_debounce() operations

And there is a special problem.

I wanted, at one point, to take the timer-based debouncing code out of
the GPIO keys input driver and make it into a generic fallback in
gpiolib so that *any* GPIO controller could be made to provide
debounce.

I ran into some obstacle feelin it was impossible IIRC but do not
remember what it was.

Yours,
Linus Walleij
