From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] documentation: Add compatibles for Amlogic Meson AXG
 pin controllers
Date: Fri, 17 Nov 2017 14:16:24 +0100
Message-ID: <f1659ac3-84d7-f8a0-7335-a8f9ce351d79@baylibre.com>
References: <20171108064711.32376-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36114 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933637AbdKQNQ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Nov 2017 08:16:27 -0500
Received: by mail-wm0-f67.google.com with SMTP id r68so6425674wmr.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2017 05:16:26 -0800 (PST)
In-Reply-To: <20171108064711.32376-1-yixun.lan@amlogic.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 08/11/2017 07:47, Yixun Lan wrote:
> From: Xingyu Chen <xingyu.chen@amlogic.com>
> 
> Add compatibles for Amlogic Meson AXG pin controllers
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index 2392557ede27..2c12f9789116 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -9,6 +9,8 @@ Required properties for the root node:
>  		      "amlogic,meson-gxbb-aobus-pinctrl"
>  		      "amlogic,meson-gxl-periphs-pinctrl"
>  		      "amlogic,meson-gxl-aobus-pinctrl"
> +		      "amlogic,meson-axg-periphs-pinctrl"
> +		      "amlogic,meson-axg-aobus-pinctrl"
>   - reg: address and size of registers controlling irq functionality
>  
>  === GPIO sub-nodes ===
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
