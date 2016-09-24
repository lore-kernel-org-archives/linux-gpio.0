From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH v3] gpio: Added zynq specific check for special pins on
 bank zero
Date: Sat, 24 Sep 2016 18:18:13 +0300
Message-ID: <355c3a93-0f7d-adc1-224e-ac48afacbcb9@gmail.com>
References: <1474630018-9986-1-git-send-email-navam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474630018-9986-1-git-send-email-navam@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>, linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nava kishore Manne <navam@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

On 23/09/2016 14.26, Nava kishore Manne wrote:
> From: Nava kishore Manne <nava.manne@xilinx.com>
>
> This patch adds zynq specific check for bank 0 pins 7 and 8
> are special and cannot be used as inputs
>
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> Reported-by: Jonas Karlsson <Jonas.d.karlsson@gmail.com>
> Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes for v3:
> 		-Fixed some minor comments.
> Changes for v2:
>                  -Removed un-used quirks for zynqmp.
>
>   drivers/gpio/gpio-zynq.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index e72794e..6b4d10d 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -96,6 +96,9 @@
>   /* GPIO upper 16 bit mask */
>   #define ZYNQ_GPIO_UPPER_MASK 0xFFFF0000
>   
> +/* For GPIO quirks */
> +#define ZYNQ_GPIO_QUIRK_FOO	BIT(0)
Should this be a bit more descriptive than FOO?
