From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH RESEND] pinctrl: freescale: make
 =?UTF-8?Q?of=5Fdevice=5Fid=20array=20const?=
Date: Mon, 02 Mar 2015 08:57:05 +0100
Message-ID: <e6665bd30a3308df0f321936e94154d6@agner.ch>
References: <1425281101-6033-1-git-send-email-sanjeev_sharma@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425281101-6033-1-git-send-email-sanjeev_sharma@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sanjeev Sharma <sanjeev_sharma@mentor.com>
Cc: linus.walleij@linaro.org, shawn.guo@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2015-03-02 08:25, Sanjeev Sharma wrote:
> Make of_device_id array const.
> 
> Signed-off-by: Sanjeev Sharma <Sanjeev_Sharma@mentor.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-vf610.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-vf610.c
> b/drivers/pinctrl/freescale/pinctrl-vf610.c
> index fc86276..37a0375 100644
> --- a/drivers/pinctrl/freescale/pinctrl-vf610.c
> +++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
> @@ -302,7 +302,7 @@ static struct imx_pinctrl_soc_info vf610_pinctrl_info = {
>  	.flags = SHARE_MUX_CONF_REG,
>  };
>  
> -static struct of_device_id vf610_pinctrl_of_match[] = {
> +static const struct of_device_id vf610_pinctrl_of_match[] = {
>  	{ .compatible = "fsl,vf610-iomuxc", },
>  	{ /* sentinel */ }
>  };

Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan
