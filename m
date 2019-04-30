From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] pinctrl:intel: Retain HOSTSW_OWN for requested gpio pin
Date: Tue, 30 Apr 2019 14:37:21 +0300
Message-ID: <CAHp75VfXj=1Ef7aXWyETyiaUF3ftLEodTs3azoDHTq=yrj7adw@mail.gmail.com>
References: <20190415055358.9269-1-chiu@endlessm.com> <CACRpkdanhW206AEj7m+2FQBhJ5epUzw60Y6v+k-eoJLLW_-SSQ@mail.gmail.com>
 <20190426125031.GQ9224@smile.fi.intel.com> <CAB4CAwfF7FoQK9OndOm_yHQe19j=E_cNLn3eTBfoggEacONiyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAB4CAwfF7FoQK9OndOm_yHQe19j=E_cNLn3eTBfoggEacONiyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Andriy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 30, 2019 at 5:15 AM Chris Chiu <chiu@endlessm.com> wrote:
> On Fri, Apr 26, 2019 at 8:50 PM Andriy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Apr 23, 2019 at 12:38:17PM +0200, Linus Walleij wrote:
> > > On Mon, Apr 15, 2019 at 7:54 AM Chris Chiu <chiu@endlessm.com> wrote:

> > > This v3 patch applied with Mika's ACK.
> >
> > Hmm... It's supposed to go along with our PR.
>
> Anything I can help with?

Not sure.
I sent PR to Linus and asked at the same time to drop Intel specifics
from devel queue. Fortunately, for-next doesn't have such issue.
Linus?

-- 
With Best Regards,
Andy Shevchenko
