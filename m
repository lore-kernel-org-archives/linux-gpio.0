From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: cherryview: Add terminate entry for
 dmi_system_id tables
Date: Wed, 17 May 2017 13:30:18 +0300
Message-ID: <CAHp75Vf6thXUQe64T7KhhPypqwZnFJYKXoRG=5v+2bP+_rHp-g@mail.gmail.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com> <20170517102514.89744-3-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35846 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751005AbdEQKaU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2017 06:30:20 -0400
In-Reply-To: <20170517102514.89744-3-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kelly French <kfrench@federalhill.net>

On Wed, May 17, 2017 at 1:25 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Make sure dmi_system_id tables are NULL terminated.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard work again")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 2debba62fac9..e35d0fe4c737 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1547,7 +1547,8 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
>                         DMI_MATCH(DMI_BIOS_DATE, "05/21/2016"),
>                 },
> -       }
> +       },
> +       {}
>  };
>
>  static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
