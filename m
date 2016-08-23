From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 0/6] pinctrl: trivial demodularization of builtin code
Date: Tue, 23 Aug 2016 17:19:38 -0400
Message-ID: <20160823211944.18554-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Yuping Luo <yuping.luo-kQvG35nSl+M@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

This list of changes represents pinctrl drivers that use MODULE_<xyz>
tags but otherwise don't make use of any other module_<xyz> functions
or macros.

Since the former are no-ops when built-in, we simply remove these
MODULE_<xyz> tags and the module.h include that provides them, while
ensuring the information in the tag is properly represented in the
file at the comments at the top or similar.

Since these tags are no-ops, and we don't remove any orphaned fcns
for __exit or .remove support here, the drivers are binary equivalent
before and after this change -- i.e. zero runtime regression risk.

Paul.
---

Cc: Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>
Cc: Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Cc: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
Cc: Yuping Luo <yuping.luo-kQvG35nSl+M@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

Paul Gortmaker (6):
  pinctrl: mediatek: make mtk-common explicitly non-modular
  pinctrl: nomadik: make abx500 explicitly non-modular
  pinctrl: nomadik: make core support explicitly non-modular
  pinctrl: rockchip: make it explicitly non-modular
  pinctrl: sirf: make atlas7 explicitly non-modular
  pinctrl: sirf: make core support explicitly non-modular

 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  5 -----
 drivers/pinctrl/nomadik/pinctrl-abx500.c      |  8 ++------
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  5 -----
 drivers/pinctrl/pinctrl-rockchip.c            |  7 +------
 drivers/pinctrl/sirf/pinctrl-atlas7.c         |  5 +----
 drivers/pinctrl/sirf/pinctrl-sirf.c           | 12 +++++-------
 6 files changed, 9 insertions(+), 33 deletions(-)

-- 
2.8.4
