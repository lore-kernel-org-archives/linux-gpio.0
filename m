From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: General Purpose clocks for apq8064
Date: Mon, 14 Aug 2017 08:23:41 -0700
Message-ID: <20170814152341.GN29306@minitux>
References: <1502434516-9056-1-git-send-email-simhavcs@gmail.com>
 <1502434516-9056-2-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502434516-9056-2-git-send-email-simhavcs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinay Simha BN <simhavcs@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROLLER - QUALCOMM" <linux-arm-msm@vger.kernel.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu 10 Aug 23:55 PDT 2017, Vinay Simha BN wrote:

> Add support for general purpose (GP) clocks
> for apq8064
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
> * only gp_clk_1b tested in nexus7 anx7808 slimport.
> ---
>  drivers/pinctrl/qcom/pinctrl-apq8064.c | 37 ++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
[..]
> @@ -453,6 +477,7 @@ static const struct msm_function apq8064_functions[] = {
>  	FUNCTION(codec_mic_i2s),
>  	FUNCTION(codec_spkr_i2s),
>  	FUNCTION(gpio),
> +	FUNCTION(gp_clk_1b),

You missed the others variants here.

Other than that this looks good. So please add the other 5 functions and
you can resend this with my Acked-by.

PS. For small incremental patches like this, feel free to send the DT
binding updates in the same patch as the driver changes.

Regards,
Bjorn
