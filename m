From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] firmware: dmi: Add DMI_PRODUCT_FAMILY
 identification string
Date: Wed, 17 May 2017 13:31:10 +0300
Message-ID: <CAHp75Vd-EVr9fr=n++SQn=Ogpa_ZakyO+JCTQrxbPhzs_E96mQ@mail.gmail.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com> <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33396 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752430AbdEQKbM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2017 06:31:12 -0400
In-Reply-To: <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kelly French <kfrench@federalhill.net>

On Wed, May 17, 2017 at 1:25 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Sometimes it is more convenient to be able to match a whole family of
> products, like in case of bunch of Chromebooks based on Intel_Strago to
> apply a driver quirk instead of quirking each machine one-by-one.
>
> This adds support for DMI_PRODUCT_FAMILY identification string and also
> exports it to the userspace through sysfs attribute just like the
> existing ones.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/firmware/dmi-id.c       | 2 ++
>  drivers/firmware/dmi_scan.c     | 1 +
>  include/linux/mod_devicetable.h | 1 +
>  3 files changed, 4 insertions(+)
>
> diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
> index 44c01390d035..dc269cb288c2 100644
> --- a/drivers/firmware/dmi-id.c
> +++ b/drivers/firmware/dmi-id.c
> @@ -47,6 +47,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(product_name,               0444, DMI_PRODUCT_NAME);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_version,     0444, DMI_PRODUCT_VERSION);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_serial,      0400, DMI_PRODUCT_SERIAL);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_uuid,                0400, DMI_PRODUCT_UUID);
> +DEFINE_DMI_ATTR_WITH_SHOW(product_family,      0400, DMI_PRODUCT_FAMILY);
>  DEFINE_DMI_ATTR_WITH_SHOW(board_vendor,                0444, DMI_BOARD_VENDOR);
>  DEFINE_DMI_ATTR_WITH_SHOW(board_name,          0444, DMI_BOARD_NAME);
>  DEFINE_DMI_ATTR_WITH_SHOW(board_version,       0444, DMI_BOARD_VERSION);
> @@ -191,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
>         ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
>         ADD_DMI_ATTR(product_serial,    DMI_PRODUCT_SERIAL);
>         ADD_DMI_ATTR(product_uuid,      DMI_PRODUCT_UUID);
> +       ADD_DMI_ATTR(product_family,      DMI_PRODUCT_FAMILY);
>         ADD_DMI_ATTR(board_vendor,      DMI_BOARD_VENDOR);
>         ADD_DMI_ATTR(board_name,        DMI_BOARD_NAME);
>         ADD_DMI_ATTR(board_version,     DMI_BOARD_VERSION);
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 54be60ead08f..93f7acdaac7a 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -430,6 +430,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
>                 dmi_save_ident(dm, DMI_PRODUCT_VERSION, 6);
>                 dmi_save_ident(dm, DMI_PRODUCT_SERIAL, 7);
>                 dmi_save_uuid(dm, DMI_PRODUCT_UUID, 8);
> +               dmi_save_ident(dm, DMI_PRODUCT_FAMILY, 26);
>                 break;
>         case 2:         /* Base Board Information */
>                 dmi_save_ident(dm, DMI_BOARD_VENDOR, 4);
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 566fda587fcf..3f74ef2281e8 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -467,6 +467,7 @@ enum dmi_field {
>         DMI_PRODUCT_VERSION,
>         DMI_PRODUCT_SERIAL,
>         DMI_PRODUCT_UUID,
> +       DMI_PRODUCT_FAMILY,
>         DMI_BOARD_VENDOR,
>         DMI_BOARD_NAME,
>         DMI_BOARD_VERSION,
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
