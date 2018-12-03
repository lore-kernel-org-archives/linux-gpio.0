From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/2] Add device driver for APU2/APU3 GPIOs
Date: Mon, 3 Dec 2018 17:43:39 +0200
Message-ID: <CAHp75VdEgm-=jHgJXz_mM6DZMnFVEeZW_es3VyL4L2V+khYWtg@mail.gmail.com>
References: <20181127132508.5501-1-fe@dev.tdt.de> <CAHp75VfFYJQzTv_oe8RKPo03-FLYHy6BkrKaG23svAKtC+jVBg@mail.gmail.com>
 <583ca922b4a877a4b0577994e40ddf5f@dev.tdt.de> <CAHp75VcKu4fhP8=NH7fgfSFCh6xdCLWrNLcsHSuWvMcW+irfmA@mail.gmail.com>
 <70e7b8e2346b9837273b5edce0524584@dev.tdt.de> <CAHp75VfSKz8sauUKq2pxUhQ6xvmX4UeOBw6eEA+71=NUyWES9g@mail.gmail.com>
 <51e0d3f36dc23de801f2fdfc990f6c23@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51e0d3f36dc23de801f2fdfc990f6c23@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Eckert.Florian@googlemail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 3, 2018 at 9:58 AM Florian Eckert <fe@dev.tdt.de> wrote:

> >> > Btw, is the statement in above email still actual? "...I can fix
> >> > required things."
> >
> >> Yes i will fix your hints tomorrow and send a v6 of my patchset.
> >> Thank you for your hints and time
> >> It would be nice if you could fix ACPI problemmatik.
> >
> > I would like to see the ACPI dump for that...
>
> See https://github.com/openwrt/openwrt/pull/1232#issuecomment-443224576
> In this comment Micha=C5=82 =C5=BBygowski appended to this thread the mis=
sing
> files you want to have.

Thanks!

So, let me clarify what we have:
 - some platforms are in the wild with old BIOS with broken ACPI tables
 - you still may fix the things for new BIOS version for all affected platf=
orms
 - you need to support both

Is this all correct?

For broken firmware you need to do the following:
 - create an MFD driver, which would instantiate GPIO and GPIO keys
support (at least)
 - create one of each above drivers w/o any DMI crap (should be done
as a part of MFD driver)

For fixed BIOS you need to add the following (example, not a fully
correct solution) at the level behind SB:

Scope (SB)
{
  Device(GPIO)
  {
           Name (_ADR, Zero)  // _ADR: Address
           Name (_HID, "AMDxxxx") // One ID per platform, so, APU2 :
1, APU 3: 1 =3D> 2 unique IDs, in this case no need to add neither _HRV
nor _UID
           Name (_HRV, 2)          // Other approach is to have one ID
but different _HRV: e.g. 2 for APU2, 3 for APU3
           Name (_UID, Zero)        // Another approach is to have one
device per community of pins and several _UID:s
           Name (_DDN, "AMD APU General Purpose Input/Output (GPIO) control=
ler")
           Method (_CRS, 0, NotSerialized)
           {
               Name (RBUF, ResourceTemplate ()
               {
                   Memory32Fixed (ReadWrite,
                       0xFED80000 // + offset + community0 offset
                       0x0000xxxx, // + size of the community0
                       )
...
                  Memory32Fixed (ReadWrite,
                       0xFED80000 // + offset + communityN offset
                       0x0000xxxx, // + size of the communityN
                       )
                   /* IRQ resource if needed and present on real HW */
                   Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,=
, )
                   {
                       0x000000xx,
                   }
               })
               Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
           }

           Method (_STA, 0, NotSerialized)
           {
               Return (0x0F)
           }
  }

  Device (BTNS)
  {
           Name (_HID, "PRP0001")
           Name (_DDN, "GPIO buttons device")
           Name (_CRS, ResourceTemplate () {
               GpioIo (
                   Exclusive,                  // Not shared
                   PullUp,                     // Pull up the line
                   0,                          // Debounce timeout
                   0,                          // Drive strength
                   IoRestrictionInputOnly,     // Only used as input
                   "\\_SB.GPIO",           // GPIO controller
                   0)                          // Must be 0
               {
                   x0,                         // GPIO pin offset in
corresponding controller for Button 0
                   x1,                         // for Button 1, and so on
...
               }
           })

           Name (_DSD, Package () {
               ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
               Package () {
                   Package () {"compatible", "gpio-keys-polled"},
                   Package () {"poll-interval", 100},
                   Package () {"autorepeat", 1}
               },
               ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
               Package () {
                   Package () {"button-0", "BTN0"},
                   Package () {"button-1", "BTN1"},
...
               }
           })

           // For more information about these bindings see:
           // Documentation/devicetree/bindings/input/gpio-keys-polled.txt
           // and Documentation/acpi/gpio-properties.txt.

           Name (BTN0, Package () {
               ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
               Package () {
                   Package () {"linux,code", 105},
                   Package () {"linux,input-type", 1},
                   Package () {"gpios", Package () {^BTNS, 0, 0, 1}}
               }
           })

  }
}

After updating firmware you would need just an ACPI ID table to be
added to the GPIO driver. MFD driver should not be enumerated at all.

--=20
With Best Regards,
Andy Shevchenko
