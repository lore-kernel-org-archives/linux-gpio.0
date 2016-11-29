From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7791: Add ADI pinconf support
Date: Tue, 29 Nov 2016 21:30:56 +0200
Message-ID: <4558124.JutbKSQ7ug@avalon>
References: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1480410716-25993-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tuesday 29 Nov 2016 10:11:56 Jacopo Mondi wrote:
> Add pin configuration support for Gyro-ADC, named ADI on r8a7791 SoC.
> 
> The Gyro-ADC supports three different configurations:
> a single ADC (adi and adi_b groups), 2 ADCs selectable through a single
> channel select signal (adi_chsel1 and adi_chsel1_b groups),

I've only briefly looked up at the datasheet, but is that a supported mode ? 
It seems that mode 1 uses 4 channels and mode 2 and 3 use 8 channels.

> up to 4 ADCs
> through 2 channel select signals (adi_chsel2 and adi_chsel2_b groups)
> and up to 8 ADCs through 3 channel select signals (adi_chsel3 and
> adi_chsel3_b groups)
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
> 
> Compiled only, not tested with an actual ADC.
> 
> For reference only, these are the changes introduced by Geert's private
> review of first sketch of this patch:
>     * separate ADI chsel in 3 overlapping groups:
>       the user can now select how many pins to assign to channel selection
>       function.
> 
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 86 +++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c index 7ca37c3..3898747 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -1691,6 +1691,72 @@ static const struct sh_pfc_pin pinmux_pins[] = {
>  	PINMUX_GPIO_GP_ALL(),
>  };
> 
> +/* - ADI --------------------------------------------------------------- */
> +static const unsigned int adi_pins[] = {
> +	/* ADIDATA, ADICS, CLK*/

Missing space before */. Same comment in other places below.

> +	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25), RCAR_GP_PIN(6, 26),
> +};
> +static const unsigned int adi_mux[] = {
> +	/* ADIDATA, ADICS, CLK*/
> +	ADIDATA_MARK, ADICS_SAMP_MARK, ADICLK_MARK,
> +};
> +static const unsigned int adi_chsel1_pins[] = {
> +	/* CHS 0 */
> +	RCAR_GP_PIN(6, 27),
> +};
> +static const unsigned int adi_chsel1_mux[] = {
> +	/* CHS 0 */
> +	ADICHS0_MARK, ADICHS1_MARK, ADICHS2_MARK,

One pin, three mux ?

> +};
> +static const unsigned int adi_chsel2_pins[] = {
> +	/* CHS 0, 1 */
> +	RCAR_GP_PIN(6, 27), RCAR_GP_PIN(6, 28),
> +};
> +static const unsigned int adi_chsel2_mux[] = {
> +	/* CHS 0, 1 */
> +	ADICHS0_MARK, ADICHS1_MARK, ADICHS2_MARK,

Two pins, three mux ?

> +};
> +static const unsigned int adi_chsel3_pins[] = {
> +	/* CHS 0, 1, 2 */
> +	RCAR_GP_PIN(6, 27), RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
> +};
> +static const unsigned int adi_chsel3_mux[] = {
> +	/* CHS 0, 1, 2 */
> +	ADICHS0_MARK, ADICHS1_MARK, ADICHS2_MARK,
> +};
> +static const unsigned int adi_b_pins[] = {
> +	/* ADIDATA B, ADICS B, CLK B */
> +	RCAR_GP_PIN(5, 25), RCAR_GP_PIN(5, 26), RCAR_GP_PIN(5, 27),
> +};
> +static const unsigned int adi_b_mux[] = {
> +	/* ADIDATA B, ADICS B, CLK B */
> +	ADIDATA_B_MARK, ADICS_SAMP_B_MARK, ADICLK_B_MARK,
> +};
> +static const unsigned int adi_chsel1_b_pins[] = {
> +	/* CHS B 0 */
> +	RCAR_GP_PIN(5, 28),
> +};
> +static const unsigned int adi_chsel1_b_mux[] = {
> +	/* CHS B 0 */
> +	ADICHS0_B_MARK,
> +};
> +static const unsigned int adi_chsel2_b_pins[] = {
> +	/* CHS B 0, 1 */
> +	RCAR_GP_PIN(5, 28), RCAR_GP_PIN(5, 29),
> +};
> +static const unsigned int adi_chsel2_b_mux[] = {
> +	/* CHS B 0, 1 */
> +	ADICHS0_B_MARK, ADICHS1_B_MARK,
> +};
> +static const unsigned int adi_chsel3_b_pins[] = {
> +	/* CHS B 0, 1, 2 */
> +	RCAR_GP_PIN(5, 28), RCAR_GP_PIN(5, 29), RCAR_GP_PIN(5, 30),
> +};
> +static const unsigned int adi_chsel3_b_mux[] = {
> +	/* CHS B 0, 1, 2 */
> +	ADICHS0_B_MARK, ADICHS1_B_MARK, ADICHS2_B_MARK,
> +};
> +
>  /* - Audio Clock ------------------------------------------------------- */
>  static const unsigned int audio_clk_a_pins[] = {
>  	/* CLK */
> @@ -4343,6 +4409,14 @@ static const unsigned int vin2_clk_mux[] = {
>  };
> 
>  static const struct sh_pfc_pin_group pinmux_groups[] = {
> +	SH_PFC_PIN_GROUP(adi),
> +	SH_PFC_PIN_GROUP(adi_chsel1),
> +	SH_PFC_PIN_GROUP(adi_chsel2),
> +	SH_PFC_PIN_GROUP(adi_chsel3),
> +	SH_PFC_PIN_GROUP(adi_b),
> +	SH_PFC_PIN_GROUP(adi_chsel1_b),
> +	SH_PFC_PIN_GROUP(adi_chsel2_b),
> +	SH_PFC_PIN_GROUP(adi_chsel3_b),
>  	SH_PFC_PIN_GROUP(audio_clk_a),
>  	SH_PFC_PIN_GROUP(audio_clk_b),
>  	SH_PFC_PIN_GROUP(audio_clk_b_b),
> @@ -4687,6 +4761,17 @@ static const struct sh_pfc_pin_group pinmux_groups[]
> = { SH_PFC_PIN_GROUP(vin2_clk),
>  };
> 
> +static const char * const adi_groups[] = {
> +	"adi",
> +	"adi_chsel1",
> +	"adi_chsel2",
> +	"adi_chsel3",
> +	"adi_b",
> +	"adi_chsel1_b",
> +	"adi_chsel2_b",
> +	"adi_chsel3_b",
> +};
> +
>  static const char * const audio_clk_groups[] = {
>  	"audio_clk_a",
>  	"audio_clk_b",
> @@ -5192,6 +5277,7 @@ static const char * const vin2_groups[] = {
>  };
> 
>  static const struct sh_pfc_function pinmux_functions[] = {
> +	SH_PFC_FUNCTION(adi),
>  	SH_PFC_FUNCTION(audio_clk),
>  	SH_PFC_FUNCTION(avb),
>  	SH_PFC_FUNCTION(can0),

-- 
Regards,

Laurent Pinchart
