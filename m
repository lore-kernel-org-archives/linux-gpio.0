From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] Fix sun7i pin assignment for IRQ's
Date: Sun, 21 Feb 2016 09:18:30 -0800
Message-ID: <20160221171830.GD19169@lukather>
References: <1456060845-20692-1-git-send-email-henry@nitronetworks.nl>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2PCU63AKGQE7AVR3NQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456060845-20692-1-git-send-email-henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Henry Paulissen <draakje197-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sun, Feb 21, 2016 at 02:20:41PM +0100, Henry Paulissen wrote:
> After testing IRQ pins we found some bugs in the pinctrl declaration.

Your commit log is going to need some work. Which bugs? What tests did
you make? Why are you making these changes while the datasheet says
otherwise?

> Signed-off-by: Henry Paulissen <henry-oxlTVf6CAJF4HdFT58BDcQ@public.gmane.org>
> ---
> 
> Changes in v2:
>     After some more testing we found irq on PI pins.
>     they where on mux6 so this is included in my patch.
> 
>     Also included is a warning for PI17, this pin was not working
>     on apritzel his bPI and he thinks it might be correlated to
>     GIC and IRQ 29.
> 
> Changes in v3:
>     Changed name from nickname to realname in email and SoB.
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
> index cf1ce0c..0fe173e 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
> @@ -344,25 +344,21 @@ static const struct sunxi_desc_pin sun7i_a20_pins[] = {
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE4 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* CS0 */
> -		  SUNXI_FUNCTION_IRQ(0x6, 12)),		/* EINT12 */

Have you tried to compile it?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ZJcv+A0YCCLh2VIg--
