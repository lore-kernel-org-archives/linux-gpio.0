From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 3/5] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Tue, 31 Jan 2017 10:31:52 +0100
Message-ID: <CAMuHMdX_vYuBzJ5_AgPNkzAv3KxEWWjrM0qF7ZbRUDfgjj1BmQ@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUmy2QkvRomf8euzB0QNkeCA=N8=rhY0GkObz8qn-UvMQ@mail.gmail.com>
 <5227448.uVg4OnCqZq@avalon> <b315cc0c-a9f3-6287-8443-56e866a32924@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <b315cc0c-a9f3-6287-8443-56e866a32924@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Tue, Jan 31, 2017 at 10:12 AM, jacopo mondi <jacopo@jmondi.org> wrote:
> On 30/01/2017 19:30, Laurent Pinchart wrote:
>> On Thursday 26 Jan 2017 20:52:33 Geert Uytterhoeven wrote:
>>> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi wrote:
>>>> Add dt-bindings header for Renesas RZ pincontroller.
>>>> The header defines macros for pin description and alternate function
>>>> numbers.

>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h

>>>> +#define RZ_PIN(b, p) b p
>>>
>>> And the advantage of this macro is?
>>>
>
> Nothing beside being cute

:-)

>>>> +#define ALTERNATE_FUNC_1       0
>>>> +#define ALTERNATE_FUNC_2       1
>>>> +#define ALTERNATE_FUNC_3       2
>>>> +#define ALTERNATE_FUNC_4       3
>>>> +#define ALTERNATE_FUNC_5       4
>>>> +#define ALTERNATE_FUNC_6       5
>>>> +#define ALTERNATE_FUNC_7       6
>>>> +#define ALTERNATE_FUNC_8       7
>>>
>>> I have mixed feelings about these macros:
>>>   1. They're long to type,
>>>   2. They just map from n to n-1.
>>>
>>> Why not use plain numbers 1..8 (the alternate function numbering in the
>>> datasheet is 1-based), and subtract 1 in the C code?
>>
>> I was about to mention the same. I think you can drop this patch and use
>> the
>> numbers directly.
>
> Please be aware there are values we'll have to define here, such as the
> additional configurations we're talking about in some other part of this
> email thread.

In that case you indeed have to OR values, but...

> This may become something like:
>
> #define ALT_FUNC_1       0
> #define ALT_FUNC_2       1
> #define ALT_FUNC_3       2
> #define ALT_FUNC_4       3
> #define ALT_FUNC_5       4
> #define ALT_FUNC_6       5
> #define ALT_FUNC_7       6
> #define ALT_FUNC_8       7
>
> #define INPUT_MODE      1
> #define BIDRECTIONAL    2
> #define ...

... if you integrate the shifts in the definitions above, e.g.

#define INPUT_MODE     (1 << 16)

> #define PIN(b, p) b p
> #define PIN_MUX(func, conf)     \
>         ((func & 0xf) | ((conf) << 16))
>
> and in DTS sources you would describe a pin as
>
> pins = <PIN(bank, pin) PIN_MUX(ALT_FUNC_1, INPUT | BIDIRECTIONAL)>;
>
> We can drop the PIN macro as it does not bring anything I agree, but it's
> nicer to see imho

... you can keep plain 1-based numbers for alternate functions, and use
the definitions for flags, e.g.:

     pins = <PIN(bank, pin) (1 | INPUT_MODE | BIDIRECTIONAL)>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
