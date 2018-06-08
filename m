From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] pinctrl: devicetree: Fix pctldev pointer overwrite
Date: Fri, 8 Jun 2018 10:06:21 +0100
Message-ID: <1f6c4ce0-9348-b229-d301-7eb0ef2f8be4@opensource.cirrus.com>
References: <1528390293-8022-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1528390293-8022-1-git-send-email-festevam@gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, slongerbeam@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, mika.penttila@nextfour.com, Fabio Estevam <fabio.estevam@nxp.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 07/06/18 17:51, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Commit b89405b6102f ("pinctrl: devicetree: Fix dt_to_map_one_config
> handling of hogs") causes the pinctrl hog pins to not get initialized
> on i.MX platforms leaving them with the IOMUX settings untouched.
> 
> This causes several regressions on i.MX such as:
> 
> - OV5640 camera driver can not be probed anymore on imx6qdl-sabresd
> because the camera clock pin is in a pinctrl_hog group and since
> its pinctrl initialization is skipped, the camera clock is kept
> in GPIO functionality instead of CLK_CKO function.
> 
> - Audio stopped working on imx6qdl-wandboard and imx53-qsb for
> the same reason.
> 
> Richard Fitzgerald explains the problem:
> 
> "I see the bug. If the hog node isn't a 1st level child of the pinctrl
> parent node it will go around the for(;;) loop again but on the first
> pass I overwrite pctldev with the result of
> get_pinctrl_dev_from_of_node() so it doesn't point to the pinctrl driver
> any more."
> 
> Fix the issue by stashing the original pctldev so it doesn't
> get overwritten.
> 
> Fixes:  b89405b6102f ("pinctrl: devicetree: Fix dt_to_map_one_config handling of hogs")
> Cc: <stable@vger.kernel.org>
> Reported-by: Mika Penttilä <mika.penttila@nextfour.com>
> Reported-by: Steve Longerbeam <slongerbeam@gmail.com>
> Suggested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>   drivers/pinctrl/devicetree.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
> index b601039..c4aa411 100644
> --- a/drivers/pinctrl/devicetree.c
> +++ b/drivers/pinctrl/devicetree.c
> @@ -101,10 +101,11 @@ struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
>   }
>   
>   static int dt_to_map_one_config(struct pinctrl *p,
> -				struct pinctrl_dev *pctldev,
> +				struct pinctrl_dev *hog_pctldev,
>   				const char *statename,
>   				struct device_node *np_config)
>   {
> +	struct pinctrl_dev *pctldev = NULL;
>   	struct device_node *np_pctldev;
>   	const struct pinctrl_ops *ops;
>   	int ret;
> @@ -123,8 +124,10 @@ static int dt_to_map_one_config(struct pinctrl *p,
>   			return -EPROBE_DEFER;
>   		}
>   		/* If we're creating a hog we can use the passed pctldev */
> -		if (pctldev && (np_pctldev == p->dev->of_node))
> +		if (hog_pctldev && (np_pctldev == p->dev->of_node)) {
> +			pctldev = hog_pctldev;
>   			break;
> +		}
>   		pctldev = get_pinctrl_dev_from_of_node(np_pctldev);
>   		if (pctldev)
>   			break;
> 

Thanks for creating this patch. Looks ok to me.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
