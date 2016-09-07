From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: zx: Add ZTE ZX SoC pinctrl driver
Date: Wed, 7 Sep 2016 12:45:45 +0800
Message-ID: <CABymUCMf8Tgodw3idG28fCozJ5YrMWiLwMgxZgCvx0DG21zm9g@mail.gmail.com>
References: <1472213965-4899-1-git-send-email-jun.nie@linaro.org>
 <1472213965-4899-2-git-send-email-jun.nie@linaro.org> <CACRpkdZL7sd2tuyKYvQL3qEF0ORB00afVdVBQLk=_Nbg4_xBzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:34336 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750791AbcIGEpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 00:45:46 -0400
Received: by mail-qt0-f176.google.com with SMTP id 38so2136081qte.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2016 21:45:46 -0700 (PDT)
In-Reply-To: <CACRpkdZL7sd2tuyKYvQL3qEF0ORB00afVdVBQLk=_Nbg4_xBzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>

2016-09-06 22:31 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Aug 26, 2016 at 2:19 PM, Jun Nie <jun.nie@linaro.org> wrote:
>
>> This adds pinctrl driver for ZTE ZX platform. The bit width
>> of pinmux registers are not unified, so this dedicated driver
>> is needed and detail bit width data is store in private data.
>> The parent pin information is also stored in private data so
>> that parent pin can be requested automatically.
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> (...)
>> +static int zx_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>> +                                  struct device_node *np_config,
>> +                                  struct pinctrl_map **map,
>> +                                  u32 *num_maps)
>> +{
>> +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map,
>> +                                             num_maps, PIN_MAP_TYPE_INVALID);
>> +}
>
> Uhm...
>
>> +static const struct pinctrl_ops zx_pctrl_ops = {
>> +       .dt_node_to_map         = zx_pctrl_dt_node_to_map,
>
> Can't you just put pinconf_generic_dt_node_to_map here?

The callback function argument number is different with
pinconf_generic_dt_node_to_map. So a wrapper is needed.

>
>> +       .dt_free_map            = pinctrl_utils_free_map,
>> +       .get_groups_count       = zx_pctrl_get_groups_count,
>> +       .get_group_name         = zx_pctrl_get_group_name,
>> +       .get_group_pins         = zx_pctrl_get_group_pins,
>> +};
>
> (...)
>
>> +#define NONAON_MVAL 2
>> +int zx_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
>> +{
>> +       struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +       int ret;
>> +       const struct pinctrl_pin_desc *pins = pctldev->desc->pins;
>> +       struct zx_pin_desc_data *zx_pin_dat;
>> +
>> +       pins += offset;
>> +       zx_pin_dat = (struct zx_pin_desc_data *)pins->drv_data;
>> +       if (!zx_pin_dat->parent)
>> +               return 0;
>> +
>> +       ret = pinctrl_request_pin(pctldev, zx_pin_dat->parent, "nonAON");
>> +       if (ret) {
>> +               dev_err(pctl->dev, "Failed to request parent pin %d\n",
>> +                       zx_pin_dat->parent);
>> +               return ret;
>> +       }
>
> This is the real trick isn't it?
>
> I don't like exposing that function directly like this. It's
> shortcutting through
> the abstractions.
>
> What we need is either:
>
> - A way to describe that a pin controller is fully a child of another
>   pin controller, a "strict hierarchy" if all pins go through both pin
>   controllers.
>
> OR
>
> - If only *some* pins go routed through the hierarchy: something akin
>   to the GPIO pin ranges. That makes it possible to specify in the
>   device tree which lines are hierarchical and how that plays out.

As my reply in 2/3 patches, the shared pin config registers make me to
merge the two pin controllers driver together to ease pin config code.
GPIO pin ranges like logic surely provide clearer hierarchical. I am thinking
whether pin config can share the pinmux hierarchical path to get the
data to configure the required register.

>
> Apart from this the driver looks all right, but we need to figure out
> how to represent the hierarchy.
>
> Yours,
> Linus Walleij
