From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: Re: [PATCH 2/2] pinctrl: ns2: rename pinctrl_utils_dt_free_map
Date: Tue, 3 May 2016 21:29:00 +0530
Message-ID: <CAL2FKYkxz_+baj2Qa+8iBPC=3E+d6tDjV_wneFNLWCkoC2h8_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <ray.jui@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Arnd,

On Tue, May 3, 2016 at 8:56 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> A conflict of two patches caused a build error when a function got renamed
> but a new user appeared in the other patch:
>
> drivers/pinctrl/bcm/pinctrl-ns2-mux.c:540:17: error: 'pinctrl_utils_dt_free_map' undeclared here (not in a function)
>   .dt_free_map = pinctrl_utils_dt_free_map,
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> This renames the new user of pinctrl_utils_dt_free_map accordingly.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: d32f7fd3bbc3 ("pinctrl: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map")
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
> ---
>  drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> index 1fd57db52d7b..3fefd14acc3e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> @@ -537,7 +537,7 @@ static struct pinctrl_ops ns2_pinctrl_ops = {
>         .get_group_pins = ns2_get_group_pins,
>         .pin_dbg_show = ns2_pin_dbg_show,
>         .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> -       .dt_free_map = pinctrl_utils_dt_free_map,
> +       .dt_free_map = pinctrl_utils_free_map,
>  };
>
>  static int ns2_get_functions_count(struct pinctrl_dev *pctrl_dev)
> --
> 2.7.0
>

Looks good to me.

Thanks
Dhananjay
