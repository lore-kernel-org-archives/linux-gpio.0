From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] pinctrl: meson: rework pinmux ops
Date: Mon, 09 Oct 2017 15:25:07 +0200
Message-ID: <1507555507.16356.50.camel@baylibre.com>
References: <20171009101747.16940-1-jbrunet@baylibre.com>
         <20171009101747.16940-3-jbrunet@baylibre.com>
         <7cd1b638-f31b-3d89-64b8-976a458f81d6@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7cd1b638-f31b-3d89-64b8-976a458f81d6@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, 2017-10-09 at 13:42 +0200, Neil Armstrong wrote:
> > +/* Common pmx functions */
> > +int meson_pmx_get_funcs_count(struct pinctrl_dev *pcdev);
> > +const char *meson_pmx_get_func_name(struct pinctrl_dev *pcdev,
> > +                                 unsigned selector);
> > +int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
> > +                      unsigned selector,
> > +                      const char * const **groups,
> > +                      unsigned * const num_groups);
> 
> Maybe the naming of the common functions should be changed to something
> generic
> like meson_get_functions_name and meson_get_function_groups and leave "pmx" to
> the
> first version pinmux control implementation.
> Same for the ops, meson_pinmux_ops would be better.

I was thinking that the naming convention around this might be confusing. Thx
for the confirmation !

However, I think "pmx" was intially meant to denote a pinmux function, since
pinconf, gpio and pinmux are all mixed in pinctrl-meson.c. I'd prefer to keep
this "pmx" for this reason.

Maybe the SoC specific bits should be named after the first SoC supporting it:
* files: pinctrl-meson-pmx.* => pinctrl-meson8-pmx.*
* functions: meson_pmx_* => meson8_pmx_* 

What do you think ?
