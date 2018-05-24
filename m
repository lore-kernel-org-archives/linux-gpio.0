From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] gpio: rcar: Add Runtime PM handling for interrupts
Date: Thu, 24 May 2018 09:28:58 +0200
Message-ID: <20180524072858.GB13872@kroah.com>
References: <1527008295-15516-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527008295-15516-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: stable-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, stable@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 22, 2018 at 05:58:15PM +0100, Fabrizio Castro wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> commit b26a719bdba9aa926ceaadecc66e07623d2b8a53 upstream.
> 
> The R-Car GPIO driver handles Runtime PM for requested GPIOs only.
> 
> When using a GPIO purely as an interrupt source, no Runtime PM handling
> is done, and the GPIO module's clock may not be enabled.
> 
> To fix this:
>   - Add .irq_request_resources() and .irq_release_resources() callbacks
>     to handle Runtime PM when an interrupt is requested,
>   - Add irq_bus_lock() and sync_unlock() callbacks to handle Runtime PM
>     when e.g. disabling/enabling an interrupt, or configuring the
>     interrupt type.
> 
> Fixes: d5c3d84657db57bd "net: phy: Avoid polling PHY with PHY_IGNORE_INTERRUPTS"
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> [fabrizio: cherry-pick to v4.4.y. Use container_of instead of
> gpiochip_get_data.]
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> Hi Greg,
> 
> on R-Car we have found that if a GPIO is used purely as an interrupt source,
> the corresponding clock is not enabled, therefore the interrupt doesn't work.
> On Koelsch, the HDMI trasmitter node in the DT uses GPIO 3 29 for the
> interrupt line, and since gpio3 is used only for this, its clock is OFF,
> preventing the interrupt from working. This patch fixes this problem.
> Would you please consider this patch for 4.4.y?

Now applied, thanks.

greg k-h
