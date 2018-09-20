From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl-icelake: driver writes to wrong offsets?
Date: Thu, 20 Sep 2018 08:14:14 -0700
Message-ID: <CACRpkdbq91Uc8cvo-VbszzfGsthRg-CL45A2DLAXYRX-Bi+Y7Q@mail.gmail.com>
References: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACK8Z6ECjwWqDnaXKrmEbEXzmiX41Sbzys=FSCqMwh8eYLPH9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajatja@google.com
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, casey.g.bowman@intel.com, matthew.s.atwood@intel.com
List-Id: linux-gpio@vger.kernel.org

Good bug hunting in this thread!

Please see if you can use libgpiod or the tools from the kernel
tools/gpio directory to test GPIO lines, I usually use that since
the global GPIO numberspace only constantly confuse me.

Especially when there is a really many many GPIOs the local
numberspace and the global GPIO numberspace approach the
same values and I get totally lost sometimes.

Yours,
Linus Walleij
