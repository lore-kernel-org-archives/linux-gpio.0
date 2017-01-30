From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 3/3] pinctrl: baytrail: Add debounce to debug output
Date: Mon, 30 Jan 2017 17:13:29 +0200
Message-ID: <1485789209.2133.361.camel@linux.intel.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com>
         <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
         <CACRpkdbevRV9rfJwZo_S2k6WTErNeK17HtHyyORdt6dERE_KGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:1518 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932348AbdA3PSD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Jan 2017 10:18:03 -0500
In-Reply-To: <CACRpkdbevRV9rfJwZo_S2k6WTErNeK17HtHyyORdt6dERE_KGw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>

On Mon, 2017-01-30 at 15:51 +0100, Linus Walleij wrote:
> On Thu, Jan 26, 2017 at 6:24 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > When debug pin configuration is printed out debounce setting is
> > missed.
> > Add it here.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I have dropped this patch for now due to Mika's skepticism.

Thank you, that what I was expecting.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
