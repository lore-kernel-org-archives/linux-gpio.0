From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] pinctrl: cherryview: limit Strago DMI workarounds to
 version 1.0
Date: Wed, 23 May 2018 07:36:51 +0300
Message-ID: <20180523043651.GD15419@lahna.fi.intel.com>
References: <20180522204753.GA260493@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180522204753.GA260493@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, May 22, 2018 at 01:47:53PM -0700, Dmitry Torokhov wrote:
> As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
> virtual interrupt numbers for keyboard/touchpad/touchscreen controllers
> in ACPI tables, they will also update BOARD version number from 1.0
> to 1.1. Let's limit the DMI quirks that try to preserve virtual IRQ
> numbers on Strago boards to those that still carry older BIOSes.
> 
> Note that ideally not BOARD but BIOS version should have been updated.
> However the BIOS version used by Chrome devices has format of
> Google_BUILD.BRANCH.PATCH which is not well suited for DMI matching as
> we do not have "less than" match mode for DMI data.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
