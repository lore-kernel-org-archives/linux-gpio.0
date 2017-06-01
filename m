From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 1/3] firmware: dmi: Add DMI_PRODUCT_FAMILY
 identification string
Date: Thu, 1 Jun 2017 11:29:26 +0200
Message-ID: <20170601112926.78fa218a@endymion>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com>
        <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Kelly French <kfrench@federalhill.net>
List-Id: linux-gpio@vger.kernel.org

Hi all,

Sorry for the late reply.

On Wed, 17 May 2017 13:25:12 +0300, Mika Westerberg wrote:
> Sometimes it is more convenient to be able to match a whole family of
> products, like in case of bunch of Chromebooks based on Intel_Strago to
> apply a driver quirk instead of quirking each machine one-by-one.
> 
> This adds support for DMI_PRODUCT_FAMILY identification string and also
> exports it to the userspace through sysfs attribute just like the
> existing ones.

dmidecode currently provides no direct access to this string. Do you
think it should?

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
> (...)
> @@ -191,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
>  	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
>  	ADD_DMI_ATTR(product_serial,    DMI_PRODUCT_SERIAL);
>  	ADD_DMI_ATTR(product_uuid,      DMI_PRODUCT_UUID);
> +	ADD_DMI_ATTR(product_family,      DMI_PRODUCT_FAMILY);

Alignment, please!

>  	ADD_DMI_ATTR(board_vendor,      DMI_BOARD_VENDOR);
>  	ADD_DMI_ATTR(board_name,        DMI_BOARD_NAME);
>  	ADD_DMI_ATTR(board_version,     DMI_BOARD_VERSION);
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 54be60ead08f..93f7acdaac7a 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -430,6 +430,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
>  		dmi_save_ident(dm, DMI_PRODUCT_VERSION, 6);
>  		dmi_save_ident(dm, DMI_PRODUCT_SERIAL, 7);
>  		dmi_save_uuid(dm, DMI_PRODUCT_UUID, 8);
> +		dmi_save_ident(dm, DMI_PRODUCT_FAMILY, 26);

This field only exists since SMBIOS 2.4. For older implementations, you
are accessing a random location of the DMI table. Most likely you'll
hit a character in one of the strings associated with the system
information structure. In turn this character will be interpreted as a
DMI string number. With some luck, number will be >= 32, so you'll get
a non-existent string and dmi_string will return "". But you could hit
a string terminator (0) and return the 1st string of the structure
instead (most likely the system manufacturer.)

Note that the problem is not specific to this field, it is just more
likely to break because all other fields are defined by SMBIOS 2.0, or
for the product UUID, SMBIOS 2.1. The fact that all dmi_save_*
functions blindly assume that the structure is long enough to contain
all the fields they want to save is problematic. This should be fixed
separately.

>  		break;
>  	case 2:		/* Base Board Information */
>  		dmi_save_ident(dm, DMI_BOARD_VENDOR, 4);
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 566fda587fcf..3f74ef2281e8 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -467,6 +467,7 @@ enum dmi_field {
>  	DMI_PRODUCT_VERSION,
>  	DMI_PRODUCT_SERIAL,
>  	DMI_PRODUCT_UUID,
> +	DMI_PRODUCT_FAMILY,
>  	DMI_BOARD_VENDOR,
>  	DMI_BOARD_NAME,
>  	DMI_BOARD_VERSION,


-- 
Jean Delvare
SUSE L3 Support
