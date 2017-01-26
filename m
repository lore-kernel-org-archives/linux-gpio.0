From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Thu, 26 Jan 2017 12:49:41 +0300
Message-ID: <9acf3e80-2e9b-10e0-2491-5157cc714f6c@cogentembedded.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello!

    s/r7s1000/r7s72100/ in the subject.

On 1/25/2017 9:09 PM, Jacopo Mondi wrote:

> Add pincontroller node compatible with the new Renesas RZ/A1
> pincontroller driver.

    Pin controller.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
> index 3dd427d..764006d 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -171,6 +171,18 @@
>  		};
>  	};
>
> +	pinctrl: pinctrl@fcfe3000 {

    I'd call the node "pin-controller@...".

MBR, Sergei
