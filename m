From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Thu, 28 Mar 2019 10:28:24 +0200
Message-ID: <20190328082824.GU3622@lahna.fi.intel.com>
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
To: Daniel Drake <drake@endlessm.com>
Cc: Chris Chiu <chiu@endlessm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 27, 2019 at 07:29:40PM +0200, Mika Westerberg wrote:
> I wonder if it would be simpler to save it always and then upon resume
> compare them and if changed, log this in dmesg and restore the saved
> one.

Actually I think better is to restore hostsw_own only for GPIOs that are
already requested by us. The BIOS should have no business messing those
anyway once they are owned by the GPIO driver.
