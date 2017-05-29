From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] ARM: dts: armadillo800eva: Split LCD mux and gpio
Date: Mon, 29 May 2017 13:23:38 +0200
Message-ID: <CAMuHMdVUihXD2fwMVG=1K2iwfRDS4hKJUCtwbfUqm_ELBkSXsQ@mail.gmail.com>
References: <1495626214-15502-1-git-send-email-geert+renesas@glider.be>
 <2806448.cAnmeTWMfp@avalon> <CAMuHMdV1z-fNtejciq14ocP3EpPOUe2zrubAEBkZmFNYE7qaDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV1z-fNtejciq14ocP3EpPOUe2zrubAEBkZmFNYE7qaDw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 24, 2017 at 3:36 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, May 24, 2017 at 2:57 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Wednesday 24 May 2017 13:43:34 Geert Uytterhoeven wrote:
>>> Configuration of the lcd0 pinmux group and GPIO hog for the external
>>> GPIO mux are done using a single device node, causing the "output-high"
>>> property to be applied to both.  This will fail for the pinmux group,
>>> but doesn't cause any harm, as the failure is ignored silently.
>>>
>>> However, after "pinctrl: sh-pfc: propagate errors on group config", the
>>> failure will become fatal, leading to a broken display:
>>>
>>>     sh-pfc e6050000.pin-controller: pin_config_group_set op failed for =
group
>>> 102 sh-pfc e6050000.pin-controller: Error applying setting, reverse thi=
ngs
>>> back sh-pfc e6050000.pin-controller: failed to select default state
>>>
>>> Split the configuration in two subnodes, and replace the GPIO hog by a
>>> pull-up pin bias to fix this.
>>>
>>> Fixes: ffd2f9a5afb730b9 ("ARM: shmobile: armadillo800eva dts: Add pinct=
rl
>>> and gpio-hog for lcdc0") Signed-off-by: Geert Uytterhoeven
>>> <geert+renesas@glider.be>
>>> ---
>>> This is a hard dependency for "pinctrl: sh-pfc: propagate errors on
>>> group config" (https://patchwork.kernel.org/patch/9186713/).
>>>
>>> Notes:
>>>   1. Just keeping the GPIO hog doesn't work, as the sh-pfc driver
>>>      requires each pinctrl (sub)node to have at least one "pins" or
>>>      "groups" property,
>>>   2. Keeping "output-high" doesn't work, as the sh-pfc driver does not
>>>      implement PIN_CONFIG_OUTPUT.
>>>
>>> Should I fix 1 and/or 2 instead?
>>> ---
>>>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 15 +++++++++------
>>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>>> b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts index
>>> 44b335b9f035436d..7feedc86f6915654 100644
>>> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>>> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
>>> @@ -267,13 +267,16 @@
>>>       };
>>>
>>>       lcd0_pins: lcd0 {
>>> -             groups =3D "lcd0_data24_0", "lcd0_lclk_1", "lcd0_sync";
>>> -             function =3D "lcd0";
>>> +             mux {
>>> +                     groups =3D "lcd0_data24_0", "lcd0_lclk_1", "lcd0_=
sync";
>>> +                     function =3D "lcd0";
>>> +             };
>>>
>>> -             /* DBGMD/LCDC0/FSIA MUX */
>>> -             gpio-hog;
>>> -             gpios =3D <176 0>;
>>> -             output-high;
>>> +             gpio {
>>> +                     /* DBGMD/LCDC0/FSIA MUX */
>>> +                     pins =3D "PORT176";
>>> +                     bias-pull-up;
>>
>> The signal is pulled low through a 10k=CE=A9 resistor, so a pull-up is a=
 bit weak.
>
> According to the schematics, the resistor is not mounted.

JFTR, R67 (bottom of the PCB, 2 cm from pin 1 of unpopulated CON16)
is indeed not populated on mine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
