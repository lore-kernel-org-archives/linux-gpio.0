From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] pinctrl: sunxi: Free configs in pinctrl_map
 only if it is a config map
Date: Fri, 11 Nov 2016 09:29:14 +0100
Message-ID: <20161111082914.yz52rlhevzvnoac3@lukather>
References: <20161111023510.14146-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pzi45ornuiwhdy4r"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBW4CS3AQKGQE5B6XNRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161111023510.14146-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org


--pzi45ornuiwhdy4r
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Nov 11, 2016 at 10:35:10AM +0800, Chen-Yu Tsai wrote:
> In the recently refactored sunxi pinctrl library, we are only allocating
> one set of pin configs for each pinmux setting node. When the pinctrl_map
> structure is freed, the pin configs should also be freed. However the
> code assumed the first map would contain the configs, which actually
> never happens, as the mux function map gets added first.
> 
> The proper way to do this is to look through all the maps and free the
> first one whose type is actually PIN_MAP_TYPE_CONFIGS_GROUP.
> 
> Also slightly expand the comment explaining this.
> 
> Fixes: f233dbca6227 ("pinctrl: sunxi: Rework the pin config building code")
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--pzi45ornuiwhdy4r--
