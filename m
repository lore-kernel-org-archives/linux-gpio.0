From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Tue, 31 Jan 2017 11:34:09 +0100
Message-ID: <CAMuHMdXLdb-9ToG2Gppnsk69=MrcuwAV7xWOm_b7HPupnZ1T5w@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdW3WtBp=cLpqFuuLxQq-=by3wwE1mQtwKJN4znDVrF6LQ@mail.gmail.com> <61bdee6b-2573-35f8-f08b-2ff6cbc200de@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33419 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751655AbdAaKeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2017 05:34:11 -0500
In-Reply-To: <61bdee6b-2573-35f8-f08b-2ff6cbc200de@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Tue, Jan 31, 2017 at 11:24 AM, jacopo mondi <jacopo@jmondi.org> wrote:
> On 26/01/2017 20:54, Geert Uytterhoeven wrote:
>> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org>
>> wrote:
>>>
>>> Add pincontroller node compatible with the new Renesas RZ/A1
>>> pincontroller driver.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>  arch/arm/boot/dts/r7s72100.dtsi | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/r7s72100.dtsi
>>> b/arch/arm/boot/dts/r7s72100.dtsi
>>> index 3dd427d..764006d 100644
>>> --- a/arch/arm/boot/dts/r7s72100.dtsi
>>> +++ b/arch/arm/boot/dts/r7s72100.dtsi
>>> @@ -171,6 +171,18 @@
>>>                 };
>>>         };
>>>
>>> +       pinctrl: pinctrl@fcfe3000 {
>>> +               compatible = "renesas,rza1-pinctrl";
>>> +               #address-cells = <1>;
>>> +               #size-cells = <0>;
>>> +
>>> +               #pinctrl-cells = <2>;
>>
>>
>> Souldn't that be <3>?
>> E.g. <RZ_PIN(3, 0) ALTERNATE_FUNC_6> expands to <3 0 5>, i.e. 3 numbers.
>>
>
> From pinctrl-bindings.txt:
>
> #pinctrl-cells: Number of pin control cells in addition to the index within
> the pin controller device instance

IC. I incorrectly assumed it would be the number of cells after a pinctrl
phandle, which is superfluous here as these are subnodes of the pfc node.

> So here it's (2 + 1) as at least the pin index (first parameter) is
> mandatory.
>
> We're twisting the assumption of having "index" as first, single, parameter,
> as we have <bank pin mode> and the <bank, pin> pair identifies a pin.
>
> Hope this is ok, and we can re-use existing bindings even if our semantic is
> a bit different.

That's indeed a bit of twisting ;-)

You can fix that by keeping the RZ_PIN() macro, and changing it to e.g.

#define RZ_PIN(bank, pin)     ((bank) << 16 | (pin))

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
