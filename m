From: "Xue, Ken" <Ken.Xue@amd.com>
Subject: RE: [PATCH] pinctrl: amd:Add device HID for future AMD GPIO
 controller
Date: Wed, 16 Mar 2016 05:10:55 +0000
Message-ID: <DM2PR12MB0201D5583811701257DF34DBFB8A0@DM2PR12MB0201.namprd12.prod.outlook.com>
References: <1457665122-16365-1-git-send-email-annie.wang@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457665122-16365-1-git-send-email-annie.wang@amd.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Wang, Annie" <Annie.Wang@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>
List-Id: linux-gpio@vger.kernel.org

> From: Wang Hongcheng [mailto:annie.wang@amd.com]
> Sent: Friday, March 11, 2016 10:59 AM
> To: Linus Walleij; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org;
> SPG_Linux_Kernel
> Cc: Wang, Annie
> Subject: [PATCH] pinctrl: amd:Add device HID for future AMD GPIO controller
> 
> Add device HID AMDI0030 to match the AMD ACPI Vendor ID (AMDI) as
> registered in http://www.uefi.org/acpi_id_list, and the GPIO controller on
> future AMD paltform will use the HID instead of AMD0030.
> 
> Signed-off-by: Wang Hongcheng <annie.wang@amd.com>
> ---

Acked-by: Ken Xue <ken.Xue@amd.com>

Hi Linus,
Can you please help apply and queue this patch into V4.6?
Thanks.

>  drivers/pinctrl/pinctrl-amd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c index
> 3318f1d..d7eb9ad 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -849,6 +849,7 @@ static int amd_gpio_remove(struct platform_device
> *pdev)
> 
>  static const struct acpi_device_id amd_gpio_acpi_match[] = {
>  	{ "AMD0030", 0 },
> +	{ "AMDI0030", 0},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_gpio_acpi_match);
> --
> 1.9.1
