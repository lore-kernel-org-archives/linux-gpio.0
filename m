From: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Subject: Re: [PATCH 5/6] ARM: dts: Add NextThing GR8 dtsi
Date: Wed, 7 Sep 2016 19:51:48 +0200
Message-ID: <20160907175148.c3fioqbr2k2pdqri@x1-6-00-0f-9f-c6-3e-90.cpe.webspeed.dk>
References: <20160831081817.5191-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from SMTPOUT03.DKBAL.mailcore.com ([85.235.243.176]:63440 "EHLO
        SMTPOUT02.DKBAL.mailcore.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754952AbcIGRv5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 13:51:57 -0400
Content-Disposition: inline
In-Reply-To: <20160831081817.5191-6-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, Alexander Kaplan <alex@nextthing.co>, Mylene Josserand <mylene.josserand@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, Aug 31, 2016 at 4:18 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> From: Mylène Josserand <mylene.josserand@free-electrons.com>
>
> The GR8 is an SoC made by Nextthing loosely based on the sun5i family.
>
> Since it's not clear yet what we can factor out and merge with the A10s and
> A13 support, let's keep it out of the sun5i.dtsi include tree. We will
> figure out what can be shared when things settle down.
>
> Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  arch/arm/boot/dts/gr8.dtsi | 1080 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 1080 insertions(+)
>  create mode 100644 arch/arm/boot/dts/gr8.dtsi
>
> diff --git a/arch/arm/boot/dts/gr8.dtsi b/arch/arm/boot/dts/gr8.dtsi
> new file mode 100644
> index 000000000000..d21cfa3f3c14
> --- /dev/null
> +++ b/arch/arm/boot/dts/gr8.dtsi

In the node names, you sometimes use underscores and sometimes use hyphens.
Here are the ones I spotted:

> +               osc3M: osc3M_clk {
> +               pll3x2: pll3x2_clk {
> +               pll7x2: pll7x2_clk {
> +       display-engine {
> +               sram-controller@01c00000 {
> +                               otg_sram: sram-section@0000 {
> +               dma: dma-controller@01c02000 {
> +               tve0: tv-encoder@01c0a000 {
> +               tcon0: lcd-controller@01c0c000 {
> +               intc: interrupt-controller@01c20400 {
> +                       lcd_rgb666_pins: lcd_rgb666@0 {
> +                       nand_pins_a: nand_base0@0 {
> +                       nand_cs0_pins_a: nand_cs@0 {
> +                       nand_rb0_pins_a: nand_rb@0 {
> +                       uart1_cts_rts_pins_a: uart1-cts-rts@0 {
> +               fe0: display-frontend@01e00000 {
> +               be0: display-backend@01e60000 {

Underscores should not be used in node names. [1][2] Since you're adding a
new file here, please use hyphens instead.

[1] https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1122967.html
[2] https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1145633.html

-- 
Rask Ingemann Lambertsen
