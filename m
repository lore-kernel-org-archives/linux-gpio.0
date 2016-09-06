From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: zx: Add ZTE ZX SoC pinctrl driver
Date: Tue, 6 Sep 2016 16:31:39 +0200
Message-ID: <CACRpkdZL7sd2tuyKYvQL3qEF0ORB00afVdVBQLk=_Nbg4_xBzw@mail.gmail.com>
References: <1472213965-4899-1-git-send-email-jun.nie@linaro.org> <1472213965-4899-2-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33360 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755636AbcIFObl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2016 10:31:41 -0400
Received: by mail-oi0-f45.google.com with SMTP id y2so74500819oie.0
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2016 07:31:41 -0700 (PDT)
In-Reply-To: <1472213965-4899-2-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>

On Fri, Aug 26, 2016 at 2:19 PM, Jun Nie <jun.nie@linaro.org> wrote:

> This adds pinctrl driver for ZTE ZX platform. The bit width
> of pinmux registers are not unified, so this dedicated driver
> is needed and detail bit width data is store in private data.
> The parent pin information is also stored in private data so
> that parent pin can be requested automatically.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

(...)
> +static int zx_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                  struct device_node *np_config,
> +                                  struct pinctrl_map **map,
> +                                  u32 *num_maps)
> +{
> +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map,
> +                                             num_maps, PIN_MAP_TYPE_INVALID);
> +}

Uhm...

> +static const struct pinctrl_ops zx_pctrl_ops = {
> +       .dt_node_to_map         = zx_pctrl_dt_node_to_map,

Can't you just put pinconf_generic_dt_node_to_map here?

> +       .dt_free_map            = pinctrl_utils_free_map,
> +       .get_groups_count       = zx_pctrl_get_groups_count,
> +       .get_group_name         = zx_pctrl_get_group_name,
> +       .get_group_pins         = zx_pctrl_get_group_pins,
> +};

(...)

> +#define NONAON_MVAL 2
> +int zx_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
> +{
> +       struct zx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +       int ret;
> +       const struct pinctrl_pin_desc *pins = pctldev->desc->pins;
> +       struct zx_pin_desc_data *zx_pin_dat;
> +
> +       pins += offset;
> +       zx_pin_dat = (struct zx_pin_desc_data *)pins->drv_data;
> +       if (!zx_pin_dat->parent)
> +               return 0;
> +
> +       ret = pinctrl_request_pin(pctldev, zx_pin_dat->parent, "nonAON");
> +       if (ret) {
> +               dev_err(pctl->dev, "Failed to request parent pin %d\n",
> +                       zx_pin_dat->parent);
> +               return ret;
> +       }

This is the real trick isn't it?

I don't like exposing that function directly like this. It's
shortcutting through
the abstractions.

What we need is either:

- A way to describe that a pin controller is fully a child of another
  pin controller, a "strict hierarchy" if all pins go through both pin
  controllers.

OR

- If only *some* pins go routed through the hierarchy: something akin
  to the GPIO pin ranges. That makes it possible to specify in the
  device tree which lines are hierarchical and how that plays out.

Apart from this the driver looks all right, but we need to figure out
how to represent the hierarchy.

Yours,
Linus Walleij
