From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 0/2] Last step to working Allwinner R40 pinctrl
Date: Sat, 22 Jul 2017 10:50:52 +0800
Message-ID: <20170722025054.32645-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBIX3ZLFQKGQEYTPB3FI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

This patchset contains only two patches.

The first one is a minor fix for the A10 pinctrl driver, add a function
of a pin, which used to be missing in A10/A20 pinctrl driver. Thanks for
Chen-Yu for discovering it when reviewing my R40 pinctrl patchset.

The second one is the real R40 pinctrl part, with fixes suggested by
Chen-Yu and Maxime.

Icenowy Zheng (2):
  pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
  pinctrl: sunxi: add support of R40 to A10 pinctrl driver

 drivers/pinctrl/sunxi/Kconfig             |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 274 +++++++++++++++++++++---------
 2 files changed, 197 insertions(+), 79 deletions(-)

-- 
2.13.0
