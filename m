From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] pinctrl: icelake: Fix the resource number for community-4/5
Date: Thu, 20 Sep 2018 10:19:34 -0700
Message-ID: <CACK8Z6FLPVSJpPuAXZsqHV2rY2zy3L-Fvd=QPn=+Ynp3aHyhaQ@mail.gmail.com>
References: <20180913223143.12664-1-rajatja@google.com> <CAHp75VcVkp6i_4oNVJvzde13MwaRQge91mvZF2aXgneZC9nzWg@mail.gmail.com>
 <CACK8Z6FhJhhfgk1zPMv5M0oRwz=o75YOKFmU+4Wx-X9-prPnKA@mail.gmail.com> <CACK8Z6GeZ+2uRsRDPfdd=i+WrdQwQgEBvEyDxQuKLygXqPp4dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACK8Z6GeZ+2uRsRDPfdd=i+WrdQwQgEBvEyDxQuKLygXqPp4dw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajat Jain <rajatxjain@gmail.com>, "Banik, Subrata" <subrata.banik@intel.com>, "Bohra, Aamir" <aamir.bohra@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 14, 2018 at 2:38 PM Rajat Jain <rajatja@google.com> wrote:
>
> On Fri, Sep 14, 2018 at 2:06 PM Rajat Jain <rajatja@google.com> wrote:
> >
> > On Fri, Sep 14, 2018 at 12:41 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Fri, Sep 14, 2018 at 1:54 AM Rajat Jain <rajatja@google.com> wrote:
> > > >
> > > > The Icelake does not have a community-3, and the memory resources are
> > > > laid out in the following order in the ACPI:
> > > >
> > > > resource-0: community-0 registers
> > > > resource-1: community-1 registers
> > > > resource-2: community-2 registers
> > > > resource-3: community-4 registers
> > > > resource-4: community-5 registers
> > > >
> > > > (EDS also describes the communities in the above order).
> > > >
> > > > Since the pinctrl driver exposes communities 0, 1, 4, 5, it needs to get
> > > > the corresponding community registers by getting the resourse number right.
> > > > Currently the resourse number is not correct for community 4 and 5, thus
> > > > fix that.
> > > >
> > >
> > > Can you share link to the ACPI dump of the tables? (you may get one by
> > > running `acpidump -o tables.dat`)

Hello Andy,

Any feedback on this patch? I provided a dump of the ACPI below,
please let me know if you need more info.

Thanks,

Rajat

> >
> > I don't have that command on my system, but I took
> > /sys/firmware/acpi/tables/DSDT from the system and disassembled it
> > using Intel disassembler (iasl -d) and here is the relevant portion
> > that describes the GPIO controller. The port IDs for communities can
> > be seen in the below output (i.e. the PCRB()):
>
> I realized PCRB() is an ACPI method defined in the same disasembly:
>
>             Method (PCRB, 1, NotSerialized)
>             {
>                 Return ((0xFD000000 + (Arg0 << 0x10)))
>             }
>
> >
> >             Device (GPIO)
> >             {
> >                 Name (_HID, "INT3455")  // _HID: Hardware ID
> >                 Name (_UID, Zero)  // _UID: Unique ID
> >                 Name (_DDN, "GPIO Controller")  // _DDN: DOS Device Name
> >                 Name (RBUF, ResourceTemplate ()
> >                 {
> >                     Memory32Fixed (ReadWrite,
> >                         0x00000000,         // Address Base
> >                         0x00000000,         // Address Length
> >                         _Y06)
> >                     Memory32Fixed (ReadWrite,
> >                         0x00000000,         // Address Base
> >                         0x00000000,         // Address Length
> >                         _Y07)
> >                     Memory32Fixed (ReadWrite,
> >                         0x00000000,         // Address Base
> >                         0x00000000,         // Address Length
> >                         _Y08)
> >                     Memory32Fixed (ReadWrite,
> >                         0x00000000,         // Address Base
> >                         0x00000000,         // Address Length
> >                         _Y09)
> >                     Memory32Fixed (ReadWrite,
> >                         0x00000000,         // Address Base
> >                         0x00000000,         // Address Length
> >                         _Y0A)
> >                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
> >                     {
> >                         0x0000000E,
> >                     }
> >                 })
> >                 Method (_CRS, 0, NotSerialized)  // _CRS: Current
> > Resource Settings
> >                 {
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y06._BAS,
> > BAS0)  // _BAS: Base Address
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y06._LEN,
> > LEN0)  // _LEN: Length
> >                     BAS0 = PCRB (0x6E)
> >                     LEN0 = 0x00010000
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y07._BAS,
> > BAS1)  // _BAS: Base Address
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y07._LEN,
> > LEN1)  // _LEN: Length
> >                     BAS1 = PCRB (0x6D)
> >                     LEN1 = 0x00010000
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y08._BAS,
> > BAS2)  // _BAS: Base Address
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y08._LEN,
> > LEN2)  // _LEN: Length
> >                     BAS2 = PCRB (0x6C)
> >                     LEN2 = 0x00010000
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y09._BAS,
> > BAS4)  // _BAS: Base Address
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y09._LEN,
> > LEN4)  // _LEN: Length
> >                     BAS4 = PCRB (0x6A)
> >                     LEN4 = 0x00010000
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y0A._BAS,
> > BAS5)  // _BAS: Base Address
> >                     CreateDWordField (RBUF, \_SB.PCI0.GPIO._Y0A._LEN,
> > LEN5)  // _LEN: Length
> >                     BAS5 = PCRB (0x69)
> >                     LEN5 = 0x00010000
> >                     Return (RBUF) /* \_SB_.PCI0.GPIO.RBUF */
> >                 }
> >
> >                 Method (_STA, 0, NotSerialized)  // _STA: Status
> >                 {
> >                     Return (0x0F)
> >                 }
> >             }
> >
> > Please let me know if this helps, or if you need more info.
> >
> > Thanks & Best Regards,
> >
> > Rajat
> >
> > >
> > > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > > ---
> > > >  drivers/pinctrl/intel/pinctrl-icelake.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
> > > > index 630b966ce081..5b4eaf7c90df 100644
> > > > --- a/drivers/pinctrl/intel/pinctrl-icelake.c
> > > > +++ b/drivers/pinctrl/intel/pinctrl-icelake.c
> > > > @@ -331,8 +331,8 @@ static const struct intel_padgroup icllp_community5_gpps[] = {
> > > >  static const struct intel_community icllp_communities[] = {
> > > >         ICL_COMMUNITY(0, 0, 58, icllp_community0_gpps),
> > > >         ICL_COMMUNITY(1, 59, 152, icllp_community1_gpps),
> > > > -       ICL_COMMUNITY(2, 153, 215, icllp_community4_gpps),
> > > > -       ICL_COMMUNITY(3, 216, 240, icllp_community5_gpps),
> > > > +       ICL_COMMUNITY(3, 153, 215, icllp_community4_gpps),
> > > > +       ICL_COMMUNITY(4, 216, 240, icllp_community5_gpps),
> > > >  };
> > > >
> > > >  static const unsigned int icllp_spi0_pins[] = { 22, 23, 24, 25, 26 };
> > > > --
> > > > 2.19.0.397.gdd90340f6a-goog
> > > >
> > >
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
