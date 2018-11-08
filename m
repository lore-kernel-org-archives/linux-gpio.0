From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: Add devicetree bindings
 for MT6797 SoC Pinctrl
Date: Thu, 8 Nov 2018 10:11:12 +0800
Message-ID: <1541643072.23791.3.camel@mtksdaap41>
References: <20181107174844.5381-1-manivannan.sadhasivam@linaro.org>
         <20181107174844.5381-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107174844.5381-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 2018-11-07 at 23:18 +0530, Manivannan Sadhasivam wrote:
> Add devicetree bindings for Mediatek MT6797 SoC Pin Controller.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |   83 +
>  include/dt-bindings/pinctrl/mt6797-pinfunc.h  | 1368 +++++++++++++++++
>  2 files changed, 1451 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  create mode 100644 include/dt-bindings/pinctrl/mt6797-pinfunc.h
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
> new file mode 100644
> index 000000000000..bd83401e6179
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt

Sorry if this is discussed.

What's the difference between this and
Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt?
Should this be added to pinctrl-mt65xx.txt?

Joe.C
