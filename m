From: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Thu, 28 Mar 2019 11:17:29 +0200
Message-ID: <20190328091729.GV9224@smile.fi.intel.com>
References: <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
 <20171116124431.GS17200@lahna.fi.intel.com>
 <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
 <20171117064904.GZ17200@lahna.fi.intel.com>
 <CAB4CAwdGQjXc6gsswyCgLTfFRN9CgcC=OJ6pz4rX-HCn8AT-TQ@mail.gmail.com>
 <20171121105205.GP22431@lahna.fi.intel.com>
 <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
 <20171121120422.GR22431@lahna.fi.intel.com>
 <CAD8Lp444FNHZh6fLUfhfp1i_UBpMbS5QuvJ4FuZn7PKH1Ucy=A@mail.gmail.com>
 <20190327172940.GR3622@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190327172940.GR3622@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 27, 2019 at 07:29:40PM +0200, Mika Westerberg wrote:
> On Wed, Mar 27, 2019 at 04:22:04PM +0800, Daniel Drake wrote:
> > On Tue, Nov 21, 2017 at 8:13 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Tue, Nov 21, 2017 at 07:54:26PM +0800, Chris Chiu wrote:
> > > > Yup, I checked the value of the corresponded pin. It shows following before
> > > > suspend
> > > > pin 18 (GPIO_18) GPIO 0x40800102 0x00024075
> > > >
> > > > Then after resume
> > > > pin 18 (GPIO_18) GPIO 0x40800102 0x00024075 [ACPI]
> > >
> > > OK, so ownership is changed to ACPI.
> > >
> > > > What else register do you suggest me to compare? The PADCFG2 is invalid
> > >
> > > It's fine APL does not have PADCFG2.
> > >
> > > Hmm, I don't understand how this can work in Windows either. The Windows
> > > people told me that they don't save and restore anything else than
> > > padcfg registers + ie. If the ownership is changed to ACPI it means you
> > > don't get interrupts anymore (only GPEs) and that applies to Windows as
> > > well.
> > 
> > In the mails after the one quoted above, we reported back to you that
> > the new BIOS from Asus solved the issue.
> > 
> > However, during the time that has followed, we have had numerous user
> > reports from Asus E403NA, X540NA, and X541NA laptops (basically the
> > same models that we originally discussed) where the touchpad stops
> > working after suspend/resume, even with the latest BIOS. We managed to
> > get an affected E403NA unit in-hands again, and confirmed that
> > HOSTSW_OWN was being lost like we had observed before.

Hmm... Can you confirm that laptop you declared as a fixed case and the
mentioned here is the same one?

If they are different, I have a theory that PCBs of those two are not the same
and used GPIO pin can be also not the same, therefore the BIOS fixes only one
revision of the model, but didn't consider the rest.

If it's the case, I recommend to ping Asus again and make them check and fix.

Meanwhile, Mika's proposal sounds feasible and not so intrusive. We may
implement this later on.

> > 
> > Unfortunately as this was a customer laptop we had to return it
> > immediately, before we could investigate further. We don't have access
> > to any more units since they are old models now.
> > 
> > However I'm wondering if you have any other ideas or if you think
> > something like our workaround patch might be acceptable under these
> > circumstances:
> > https://github.com/endlessm/linux/commit/f391452299f62a3d0cbe5333be90f69e9895d8ff
> 
> I wonder if it would be simpler to save it always and then upon resume
> compare them and if changed, log this in dmesg and restore the saved
> one.

-- 
With Best Regards,
Andy Shevchenko
