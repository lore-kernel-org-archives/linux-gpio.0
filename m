From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH v3] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
Date: Tue, 30 Apr 2019 02:12:29 +0800
Message-ID: <CAB4CAwfF7FoQK9OndOm_yHQe19j=E_cNLn3eTBfoggEacONiyg@mail.gmail.com>
References: <20190415055358.9269-1-chiu@endlessm.com> <CACRpkdanhW206AEj7m+2FQBhJ5epUzw60Y6v+k-eoJLLW_-SSQ@mail.gmail.com>
 <20190426125031.GQ9224@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426125031.GQ9224@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andriy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 26, 2019 at 8:50 PM Andriy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Apr 23, 2019 at 12:38:17PM +0200, Linus Walleij wrote:
> > On Mon, Apr 15, 2019 at 7:54 AM Chris Chiu <chiu@endlessm.com> wrote:
> >
> > > The touchpad of the ASUS laptops E403NA, X540NA, X541NA are not
> > > responsive after suspend/resume. The following error message
> > > shows after resume.
> > >  i2c_hid i2c-ELAN1200:00: failed to reset device.
> > >
> > > On these laptops, the touchpad interrupt is connected via a GPIO
> > > pin which is controlled by Intel pinctrl. After system resumes,
> > > the GPIO is in ACPI mode and no longer works as an IRQ.
> > >
> > > This commit saves the HOSTSW_OWN value during suspend, make sure
> > > the HOSTSW_OWN mode remains the same after resume.
> > >
> > > Signed-off-by: Chris Chiu <chiu@endlessm.com>
> >
> > This v3 patch applied with Mika's ACK.
>
> Hmm... It's supposed to go along with our PR.

Anything I can help with?

Chris
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
