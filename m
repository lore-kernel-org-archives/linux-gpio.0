From: David Wu <david.wu@rock-chips.com>
Subject: [PATCH v3 2/2] dt-bindings: rockchip-pinctrl: Support the RK3399 SoCs compatible
Date: Sat, 30 Jan 2016 19:31:57 +0800
Message-ID: <1454153517-52969-3-git-send-email-david.wu@rock-chips.com>
References: <1451997055-47655-1-git-send-email-wdc@rock-chips.com>
 <1454153517-52969-1-git-send-email-david.wu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454153517-52969-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linus.walleij@linaro.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

Change-Id: Ic1bdb3dc358837e97d7b48dd58be2f8d9d08d766
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 391ef4b..3bb9456 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -22,6 +22,7 @@ Required properties for iomux controller:
   - compatible: one of "rockchip,rk2928-pinctrl", "rockchip,rk3066a-pinctrl"
 		       "rockchip,rk3066b-pinctrl", "rockchip,rk3188-pinctrl"
 		       "rockchip,rk3288-pinctrl", "rockchip,rk3368-pinctrl"
+		       "rockchip,rk3399-pinctrl"
   - rockchip,grf: phandle referencing a syscon providing the
 	 "general register files"
 
-- 
1.9.1
