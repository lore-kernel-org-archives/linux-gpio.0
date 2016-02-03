From: Krzysztof Adamski <k@japko.eu>
Subject: [PATCH v3 0/5] pinctrl: sunxi: Add H3 R_PIO controller support
Date: Thu,  4 Feb 2016 00:33:45 +0100
Message-ID: <1454542430-16572-1-git-send-email-k@japko.eu>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDIL57GUWIARB4M4ZK2QKGQEBPN7G5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: inus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Krzysztof Adamski <k@japko.eu>
List-Id: linux-gpio@vger.kernel.org

This patch series is extension of my original single patch with the same
subject. It adds support for R_PIO so that GPIO port L can be used in H3
based devices. It was tested on OrangePi PC where PL is connected amount
others to an onboard led, a switch, an IR receiver and some VCC
controllers.

Patchset is based on next-20160129.

--- 

Changes since v2:
- fixed apb0 parrent clocks list
- moved binding documentation change to the proper patch
- simplified sunxi_pinctrl_gpio_get according to ChenYu suggestions
- fixed ordering in sunxi binding documentation

Changes since v1:
- splited patch to two separate - dtsi and c files
- added APB0 clocks a parent for R_PIO
- added fix in sunxi_pinctrl_gpio_get for getting pin value when in irq
  mode and on 2nd pinctrl
- fixed a "pwn" > "pwm" typo
- fixed order in allwinner,sunxi-pinctrl.txt


Krzysztof Adamski (5):
  clk: sunxi: Add apb0 gates for H3
  dts: sun8i-h3: Add APB0 related clocks and resets
  pinctrl: sunxi: Add H3 R_PIO controller support
  ARM: dts: sun8i-h3: Add R_PIO controller node to the dtsi
  pinctrl: sunxi: Use pin number when calling sunxi_pmx_set

 Documentation/devicetree/bindings/clock/sunxi.txt  |   1 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
 arch/arm/boot/dts/sun8i-h3.dtsi                    |  36 +++++++
 drivers/clk/sunxi/clk-simple-gates.c               |   2 +
 drivers/pinctrl/sunxi/Kconfig                      |   4 +
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c         | 106 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   5 +-
 8 files changed, 154 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3-r.c

-- 
2.1.4
