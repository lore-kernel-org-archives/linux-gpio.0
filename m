From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] pinctrl: cherryview: limit Strago DMI workarounds to
 version 1.0
Date: Thu, 24 May 2018 09:01:54 -0700
Message-ID: <20180524160154.GA177107@dtor-ws>
References: <20180522204753.GA260493@dtor-ws>
 <CACRpkdabMV1Vy5dGjW-eRVxY9yAcVhukMY1RNnb7nbYc7keHGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdabMV1Vy5dGjW-eRVxY9yAcVhukMY1RNnb7nbYc7keHGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, May 24, 2018 at 10:19:55AM +0200, Linus Walleij wrote:
> On Tue, May 22, 2018 at 10:47 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
> > virtual interrupt numbers for keyboard/touchpad/touchscreen controllers
> > in ACPI tables, they will also update BOARD version number from 1.0
> > to 1.1. Let's limit the DMI quirks that try to preserve virtual IRQ
> > numbers on Strago boards to those that still carry older BIOSes.
> >
> > Note that ideally not BOARD but BIOS version should have been updated.
> > However the BIOS version used by Chrome devices has format of
> > Google_BUILD.BRANCH.PATCH which is not well suited for DMI matching as
> > we do not have "less than" match mode for DMI data.
> >
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > v1->v2:
> >
> > - switch from matching on DMI_BIOS_VERSION to DMI_BOARD_VERSION
> 
> Patch applied for fixes.
> 
> Should this also be tagged for stable?

No, I do not think so. The workaround being active does not cause any
issues on boxes with updated firmware, so there is no point in trying to
get the patch to older kernels. It is going forward that we want the
"proper" behavior, when possible.

Also, I am not quite sure when the new firmware version will get
qualified for release.

Thanks.

-- 
Dmitry
