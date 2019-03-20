From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH -next] pinctrl: fsl: Make pinctrl_ipc_handle static
Date: Thu, 21 Mar 2019 01:28:28 +0530
Message-ID: <38d8265b-52b9-f7fd-d665-46b66848118a@codeaurora.org>
References: <20190320141425.20920-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320141425.20920-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>, aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


On 3/20/2019 7:44 PM, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
>
> Fix sparse warning:
>
> drivers/pinctrl/freescale/pinctrl-scu.c:38:19: warning:
>   symbol 'pinctrl_ipc_handle' was not declared. Should it be static?
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/pinctrl/freescale/pinctrl-scu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
> index 83e69c0..73bf1d9 100644
> --- a/drivers/pinctrl/freescale/pinctrl-scu.c
> +++ b/drivers/pinctrl/freescale/pinctrl-scu.c
> @@ -35,7 +35,7 @@ struct imx_sc_msg_resp_pad_get {
>   	u32 val;
>   } __packed;
>   
> -struct imx_sc_ipc *pinctrl_ipc_handle;
> +static struct imx_sc_ipc *pinctrl_ipc_handle;
>   
>   int imx_pinctrl_sc_ipc_init(struct platform_device *pdev)
>   {


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
