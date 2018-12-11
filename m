From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: Add devicetree bindings for
 MT6797 SoC Pinctrl
Date: Tue, 11 Dec 2018 07:41:09 -0800
Message-ID: <20181211154109.trgger4syzsvpio6@localhost>
References: <20181107174844.5381-1-manivannan.sadhasivam@linaro.org>
 <20181107174844.5381-2-manivannan.sadhasivam@linaro.org>
 <CACRpkda25cuiPCe9ouvDDSpFwZ2z=Pm8pK=5jC-7OAcYwPSvvA@mail.gmail.com>
 <c1f63dd8-1c06-1797-025c-2cd4891d905d@gmail.com>
 <CACRpkdYCsh3AfmV-7ym-ffjp2k-kaNRqY1O3rd9h-WoUPYM_bw@mail.gmail.com>
 <CAOesGMhcBXLRRKdOMdq3Bg8fOGX6F0gWMJ3zzg0jW9bg9VeW7A@mail.gmail.com>
 <CAGp9Lzp9auBd5+gbrz5hZTM054JsWXs=NfSnO5EvczrJ8HOcGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGp9Lzp9auBd5+gbrz5hZTM054JsWXs=NfSnO5EvczrJ8HOcGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, amit.kucheria@linaro.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 07, 2018 at 01:42:59PM -0800, Sean Wang wrote:
> Hi Olof,
> 
> I'm a guy from MediaTek.
> Thanks for your input and we will get these bad things to be better.
> 
> On Fri, Dec 7, 2018 at 10:42 AM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Dec 5, 2018 at 4:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Mon, Dec 3, 2018 at 2:08 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > > > On 15/11/2018 11:04, Linus Walleij wrote:
> > > > > On Wed, Nov 7, 2018 at 6:49 PM Manivannan Sadhasivam
> > > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > >
> > > > >> Add devicetree bindings for Mediatek MT6797 SoC Pin Controller.
> > > > >>
> > > > >> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > >
> > > > > Patch applied.
> > > > >
> > > >
> > > > Could you provide a stable tree for me, so that I can take the dts parts?
> > > > I just realized that my build is broken because of the missing dt-bindings
> > > > header file.
> > >
> > > Since I pulled other changes on top it is too late for me to put that
> > > in an immutable branch and merge into my tree separately,
> > > you would have to pull in the whole "devel" branch from the
> > > pin control tree.
> > >
> > > What we sometimes do is simply apply the *EXACT* same patch
> > > to two git trees. Git will cope with that as long as they are
> > > absolutely *IDENTICAL*. (The patch will appear twice in the
> > > git log with different hashes but they will merge without
> > > problems, a bit unelegant but it works.)
> > >
> > > So in your situation I would extract this patch from the pinctrl
> > > tree:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=devel&id=95d2f00657ad4c2c3eacd8a871a7aa022c3fe7d9
> > > and apply it with some notice to the maintainers about
> > > the situation.
> > >
> > > ARM SoC folks: agreed?
> >
> > So, applying the patches in parallel is fine, but this made me look at
> > the actual patches and file contents, and they seem to be a bit messy.
> >
> 
> I've also noticed the messy thing so we've changed these doable SoCs
> to using generic pinctrl bindings like MT7622 and MT7629 to get rid of
> the big header. And for the other SoCs, they still tend to keep vendor
> binding because of historical reasons, the related board makers
> preferences and it is indeed a little hard to change what these people
> used to.

Yeah, changing bindings means that downstream DT files will need updates, which
can be awkward. But it's worth paying attention to moving forward.

> 
> > This feedback is more to the MT maintainers/developers than you, Linus
> > (obviously):
> >
> > These header files are huge, and they're inconsistent in the way they
> > define these constants:
> >
> > include/dt-bindings/pinctrl/mt7623-pinfunc.h:
> > #define MT7623_PIN_21_PCM_TX_FUNC_GPIO21 (MTK_PIN_NO(21) | 0)
> > #define MT7623_PIN_21_PCM_TX_FUNC_PCM_TX (MTK_PIN_NO(21) | 1)
> > #define MT7623_PIN_21_PCM_TX_FUNC_MRG_TX (MTK_PIN_NO(21) | 2)
> > #define MT7623_PIN_21_PCM_TX_FUNC_MRG_RX (MTK_PIN_NO(21) | 3)
> > #define MT7623_PIN_21_PCM_TX_FUNC_PCM_RX (MTK_PIN_NO(21) | 4)
> > #define MT7623_PIN_21_PCM_TX_FUNC_CONN_DSP_JMS (MTK_PIN_NO(21) | 5)
> > #define MT7623_PIN_21_PCM_TX_FUNC_AP_PCM_TX (MTK_PIN_NO(21) | 6)
> >
> > include/dt-bindings/pinctrl/mt6397-pinfunc.h:
> > #define MT6397_PIN_24_ROW4__FUNC_GPIO24 (MTK_PIN_NO(24) | 0)
> > #define MT6397_PIN_24_ROW4__FUNC_ROW4 (MTK_PIN_NO(24) | 1)
> > #define MT6397_PIN_24_ROW4__FUNC_EINT22_1X (MTK_PIN_NO(24) | 2)
> > #define MT6397_PIN_24_ROW4__FUNC_SCL2_3X (MTK_PIN_NO(24) | 3)
> > #define MT6397_PIN_24_ROW4__FUNC_TEST_IN15 (MTK_PIN_NO(24) | 6)
> > #define MT6397_PIN_24_ROW4__FUNC_TEST_OUT15 (MTK_PIN_NO(24) | 7)
> >
> > include/dt-bindings/pinctrl/mt6797-pinfunc.h:
> > #define MT6797_GPIO34__FUNC_GPIO34 (MTK_PIN_NO(34) | 0)
> > #define MT6797_GPIO34__FUNC_CMFLASH (MTK_PIN_NO(34) | 1)
> > #define MT6797_GPIO34__FUNC_CLKM0 (MTK_PIN_NO(34) | 2)
> > #define MT6797_GPIO34__FUNC_UDI_NTRST (MTK_PIN_NO(34) | 3)
> > #define MT6797_GPIO34__FUNC_SCP_JTAG_TRSTN (MTK_PIN_NO(34) | 4)
> > #define MT6797_GPIO34__FUNC_CONN_MCU_TRST_B (MTK_PIN_NO(34) | 5)
> > #define MT6797_GPIO34__FUNC_MD_UTXD0 (MTK_PIN_NO(34) | 6)
> > #define MT6797_GPIO34__FUNC_C2K_DM_JTINTP (MTK_PIN_NO(34) | 7)
> >
> > So, is it a pin or a GPIO and why does 6797 use different naming
> > scheme?
> 
> They all stand for the pin and list all the functions which the pin
> can be switched to.
> 
> MT6797 is the first mtk pinctrl driver not contributed by mediatek people,
> we will try to fix these confusing things and should be careful
> keeping the naming be uniform in the future.
> 
> > Why do some of them have __FUNC and some _FUNC?Why do some
> > have the non-gpio function as part of the name and some do not?
> >
> 
> ditto, we will try to fix and keep the naming be uniform

Sounds good!

> > Also, "pin 24 row 4 func row4"? Seems to have very limited value to
> > describe it in that manner, it's just overly verbose without adding
> > information.
> 
> All the function names for a pin totally are same (copied) with
> hardware document describes. That means it's default function of the
> pin the hardware provides.

Yeah, I can see how that happens. Also, often the hardware documents don't
aggregate in the same way that our software does, so they won't notice
inconsistencies between versions in the same way (nobody really tries to make
one document with pin names between different chip families on the hardware
side).

> > Some other SoCs tend to use a pinctrl specifier that is two-cell <pin
> > function> instead of trying to pack them into one integer.
> 
> I'm not the initial developer for the vendor binding. but I guessed
> the initial thought trying to pack them into one integer can decrease
> the risk of inconsistency between pin and function, especially
> there're more than some hundred pins and functions present on SoC.

Yeah, I can see that benefit, but it can also be caught with our new schemas
and/or by drivers in some cases. Having a binding that's a natural way of
describing the hardware without encoding it tends to be preferred.

> > That seems
> > a lot more practical, especially since the base GPIO function seems to
> > generically be '0'. So the pin number would go in the first cell, and
> > the function in the second.
> >
> > Finally, I don't see how the header file is used in the code at all?
> >
> > The main idea behind the dt bindings header files is that they would
> > provide shared constants between the DT and the driver in the kernel.
> > If the constants are never used (i.e. they're just register values,
> > like today), then there's no need to merge the dt header with the
> > driver at all, it should go with the DT contents instead.
> 
> Yes, it should be better to go with DT contents, not be the interface
> between DT and driver. These pin names are totally the same with these
> pin names shown on the schematic diagram, so it works more like
> providing an easy to remember text to allow people configure its pin
> easier while crossing reference schematic diagram.

You can still have symbols for the pin numbers if you want, but if you build
your header file a bit more elabroate you can easily expose the pin and
function names through sysfs instead, which helps debugging.

> > So, for
> > example, if you used something like a format of <pin function>
> > properties, the header file could contain both the string
> > representation of the function for debug, as well as the values, all
> > derived from one place. Today all you have string representations for
> > is "func0".."func15" through mtk_gpio_functions[]. Seems like an
> > improvement all around?


-Olof
