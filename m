From: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [BUG] pinctrl: sunxi: sunxi-pinctrl fail to load with CONFIG_DEBUG_TEST_DRIVER_REMOVE
Date: Mon, 7 Nov 2016 09:18:32 +0100
Message-ID: <20161107081832.GA23580@Red>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD7YLCN32UNBBW7RQDAQKGQEDKXZ5PA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Hello

With CONFIG_DEBUG_TEST_DRIVER_REMOVE=y pinctrl-sunxi fail to load on the second try.

[    3.900061] sun8i-h3-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
[    3.916251] gpio gpiochip1: GPIO integer space overlap, cannot add chip
[    3.923016] gpiochip_add_data: GPIOs 0..223 (1c20800.pinctrl) failed to register
[    3.931099] sun8i-h3-pinctrl: probe of 1c20800.pinctrl failed with error -16
[    3.944709] sun8i-h3-r-pinctrl 1f02c00.pinctrl: initialized sunXi PIO driver
[    3.960796] gpio gpiochip2: GPIO integer space overlap, cannot add chip
[    3.967594] gpiochip_add_data: GPIOs 352..383 (1f02c00.pinctrl) failed to register
[    3.975633] sun8i-h3-r-pinctrl: probe of 1f02c00.pinctrl failed with error -16

Without it, all subsequent drivers fail to load.
Tested on Orange PI PC board.

Regards
