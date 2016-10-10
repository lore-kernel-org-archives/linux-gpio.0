From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pinctrl documentation not matching code
Date: Mon, 10 Oct 2016 10:11:46 +0200
Message-ID: <CACRpkdaF-HEaAAxE9R0JLheuhFzund8Ocb8oGnhud9iPVDAdXQ@mail.gmail.com>
References: <1475152419.4359.73.camel@rf-debian.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33551 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbcJJILs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 04:11:48 -0400
Received: by mail-oi0-f41.google.com with SMTP id y2so40670599oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 01:11:47 -0700 (PDT)
In-Reply-To: <1475152419.4359.73.camel@rf-debian.wolfsonmicro.main>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 29, 2016 at 2:33 PM, Richard Fitzgerald
<rf@opensource.wolfsonmicro.com> wrote:

> The pinctrl documented behaviour is different from actual code

The pinctrl device tree bindings are orthogonal from the Linux
implementation. The DT bindings is a OS-neutral description of how
to do pin control, not a definition of how Linux should implement it.

> in at
> least two areas:
>
> 1) pinctrl-bindings.txt doc says that when selecting mux function
> _either_ "pins" _or_ "groups" property must be given:
>
>> pin multiplexing nodes:
>>
>> function              - the mux function to select
>> groups                        - the list of groups to select with this function
>>                         (either this or "pins" must be specified)
>> pins                  - the list of pins to select with this function (either
>>                         this or "groups" must be specified)
>
> and gives an example of "function" + "pins":
>
>> state_2_node_a {
>>       function = "i2c0";
>>       pins = "mfio29", "mfio30";
>> };
>
> But this is not what the code does. The code in pinconf_generic_dt_subnode_to_map()
> calls pinctrl_utils_add_map_mux() if a function is specified, which always sets the
> map type as PIN_MAP_TYPE_CONFIGS_GROUP even if the string came from a "pins" property.
> This means the example above from the bindings documentation will not work because it
> will attempt to map to groups called "mfio29" and "mfio30".
> Is the code wrong or the documentation wrong?

Neither. There are other drivers that implement it according to the spec,
but it is not yet supported by the generic code, becuase noone yet cared
to extend the generic code to cover anything but groups.

Patches welcome :)

> 2) The bindings documentation explicitly says that a pinctrl driver can be a client of
> itself:
>
>>
>> Note that pin controllers themselves may also be client devices of themselves.
>> For example, a pin controller may set up its own "active" state when the
>> driver loads. This would allow representing a board's static pin configuration
>> in a single place, rather than splitting it across multiple client device
>
> However, although parts of the code seem to intend to support this (as a "hog")
> it is prevented by the devicetree.c code. If a pinctrl attempts to be its own client
> - that is, the client dev is the same as the pinctrl dev - the code in
> dt_to_map_one_config() will return -ENODEV and the pinctrl_get() will fail with that
> error:
>
>>               /* Do not defer probing of hogs (circular loop) */
>>               if (np_pctldev == p->dev->of_node) {
>>                       of_node_put(np_pctldev);
>>                       return -ENODEV;
>>               }
>
> Again, which is wrong? The documentation or the code?

There are several boards using hogs with no problems, I think you're getting
it wrong. Did you really test it or are you just reading the code?

Notice this right above the code you're citing:

        pctldev = get_pinctrl_dev_from_of_node(np_pctldev);
        if (pctldev)
            break;

I.e. if we locate the device, the hog goes in fine. The comment means
exactly what it says: do not stick in an eteral probe deferral loop,
which could happen with hogs looking for their own device.
Hogs are fine otherwise.

Yours,
Linus Walleij
