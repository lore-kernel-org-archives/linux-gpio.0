From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] pinctrl: intel: Do pin translation in other GPIO
 operations as well
Date: Wed, 19 Sep 2018 10:35:22 -0700
Message-ID: <CACK8Z6HCqN83rtEsV0EzSUcYdkq2Fx+QmOBrtW+ud5V4-ucCvQ@mail.gmail.com>
References: <20180918153621.71984-1-mika.westerberg@linux.intel.com>
 <CACK8Z6F4+N1paQTSWcomnwLpLEHoospSOT3M9bqFQZHHfWmahA@mail.gmail.com>
 <CACK8Z6GfeJQSMN=m9hrFE2DFwpCNjNb57PqGiXFDD19Y=SXgnQ@mail.gmail.com> <20180919084002.GR14465@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919084002.GR14465@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, casey.g.bowman@intel.com, "Atwood, Matthew S" <matthew.s.atwood@intel.com>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 19, 2018 at 1:40 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, Sep 18, 2018 at 03:14:44PM -0700, Rajat Jain wrote:
> > Also consider fixing the checkpatch warning:
> >
> >         Errors:
> >             * checkpatch.pl errors/warnings
> >
> >             WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> >             #48: FILE: drivers/pinctrl/intel/pinctrl-intel.c:764:
> >             +static int intel_gpio_to_pin(struct intel_pinctrl *pctrl,
> > unsigned offset,
>
> Right, it is currently the "convention" used in Intel pinctrl drivers so
> I did not want to change that single entry.
>
> We should eventually convert the whole set of Intel pinctrl drivers to
> use unsigned int instead of unsigned.

OK, Thanks for the clarification.
