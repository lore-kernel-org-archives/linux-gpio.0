From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: icelake: Fix the resource number for community-4/5
Date: Tue, 25 Sep 2018 00:09:10 +0300
Message-ID: <CAHp75VdyOAzHDNr4L6Onj=Qgu2DfQxPy-j_jo2HXfyukCZRePg@mail.gmail.com>
References: <20180913223143.12664-1-rajatja@google.com> <CAHp75VcVkp6i_4oNVJvzde13MwaRQge91mvZF2aXgneZC9nzWg@mail.gmail.com>
 <CACK8Z6FhJhhfgk1zPMv5M0oRwz=o75YOKFmU+4Wx-X9-prPnKA@mail.gmail.com>
 <CACK8Z6GeZ+2uRsRDPfdd=i+WrdQwQgEBvEyDxQuKLygXqPp4dw@mail.gmail.com>
 <CACK8Z6FLPVSJpPuAXZsqHV2rY2zy3L-Fvd=QPn=+Ynp3aHyhaQ@mail.gmail.com>
 <20180924135935.GP15943@smile.fi.intel.com> <70D28D5DAE32E9429B09AA8B7C84AC472C0000CB@BGSMSX106.gar.corp.intel.com>
 <CACK8Z6Ej=BVThT8gSHCNZadXbLpzqKe6TmLYGkeBMmJBby1n-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACK8Z6Ej=BVThT8gSHCNZadXbLpzqKe6TmLYGkeBMmJBby1n-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: subrata.banik@intel.com, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajat Jain <rajatxjain@gmail.com>, aamir.bohra@intel.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 24, 2018 at 8:04 PM Rajat Jain <rajatja@google.com> wrote:
> On Mon, Sep 24, 2018 at 7:54 AM Banik, Subrata <subrata.banik@intel.com> wrote:

> > First of all, this is pre-production chip, so, I don't think there is a bug in the driver (yet) discovered.
> >
> > Looking to the above ASL code I may conclude that is definitely is *not* from our reference BIOS.
> > I have checked two versions of it and found that in both we have the following mapping:
> > for LP variant: there are only 4 communities are exported for H variant: there are only 5 communities are exported
> >
> > So, I guess the problem is in ASL code you provided. It simple should not export that community at all.
> >
> > In case you need to do so, there are ways:
> >  - contact Intel and ask for a change in reference BIOS
> >  - acquire another ACPI ID for the case, or, perhaps use special constants like
> >    _HRV for that purpose (also need to contact Intel while doing that)
>
> As Subrata clarified (Subrata & Aamir are from Intel's Coreboot team),
> that is not *the* Intel reference BIOS that you are using, but it is
> *an* Intel generated BIOS/Coreboot image.

Ah, interesting.

> Andy, can you please let us know in what order are the resources laid
> out in your reference BIOS for the case when it exports 5 communities
> (i.e. community-0-2, 4-5)?

We have no hardware with such PCH to answer to this question. LP
version exports only 4 communities and order of them as per existing
driver.

-- 
With Best Regards,
Andy Shevchenko
