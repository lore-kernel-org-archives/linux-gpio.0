From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: add a missing function
 of A10/A20 pinctrl driver
Date: Thu, 6 Jul 2017 22:46:46 +0200
Message-ID: <20170706204646.3akr57fo6c2ok4wn@flea>
References: <20170706142822.20296-1-icenowy@aosc.io>
 <20170706142822.20296-2-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lia4rf3fybgly4n3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3GD7LFAKGQE2PT4HAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170706142822.20296-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org


--lia4rf3fybgly4n3
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Thu, Jul 06, 2017 at 10:28:21PM +0800, Icenowy Zheng wrote:
> The PH16 pin has a function with mux id 0x5, which is the DET pin of the
> "sim" (smart card reader) IP block.
> 
> This function is missing both in the old A10 and A20 drivers, so it's
> not found during the merge of these two drivers.
> 
> Add it to the driver. As we now merged A20 pinctrl driver to the A10
> one, we need to only fix the A10 driver now.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

I'm not sure what you mean there. It's not mentionned in the A10
datasheet, and neither in the A20. Where did you get that info from?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--lia4rf3fybgly4n3--
