From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: fix Strago DMI workaround
Date: Mon, 21 Jan 2019 13:06:27 +0100
Message-ID: <CACRpkda8yBg=jqn+YJq_M8MTCAH8EkLuFbVi6mkUmxCf5B6m8g@mail.gmail.com>
References: <20190115033836.GA150475@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115033836.GA150475@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 15, 2019 at 4:38 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Well, hopefully 3rd time is a charm. We tried making that check
> DMI_BIOS_VERSION and DMI_BOARD_VERSION, but the real one is
> DMI_PRODUCT_VERSION.
>
> Fixes: 86c5dd6860a6 ("pinctrl: cherryview: limit Strago DMI workarounds to version 1.0")
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1631930
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Patch applied for fixes with the ACKs!

Yours,
Linus Walleij
