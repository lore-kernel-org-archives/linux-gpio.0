From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 1/3] firmware: dmi: Add DMI_PRODUCT_FAMILY
 identification string
Date: Thu, 1 Jun 2017 14:42:54 +0200
Message-ID: <20170601144254.142be515@endymion>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com>
        <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40421 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750952AbdFAMm6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Jun 2017 08:42:58 -0400
In-Reply-To: <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Kelly French <kfrench@federalhill.net>

I did not notice before, but now that I'm testing...

On Wed, 17 May 2017 13:25:12 +0300, Mika Westerberg wrote:
> --- a/drivers/firmware/dmi-id.c
> +++ b/drivers/firmware/dmi-id.c
> @@ -47,6 +47,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
>  DEFINE_DMI_ATTR_WITH_SHOW(product_uuid,		0400, DMI_PRODUCT_UUID);
> +DEFINE_DMI_ATTR_WITH_SHOW(product_family,	0400, DMI_PRODUCT_FAMILY);
>  DEFINE_DMI_ATTR_WITH_SHOW(board_vendor,		0444, DMI_BOARD_VENDOR);
>  DEFINE_DMI_ATTR_WITH_SHOW(board_name,		0444, DMI_BOARD_NAME);
>  DEFINE_DMI_ATTR_WITH_SHOW(board_version,	0444, DMI_BOARD_VERSION);

I see no reason to hide this field from users. Permissions 0444 would
seem more appropriate. I'll include that change in my patch if there
are no objections.

-- 
Jean Delvare
SUSE L3 Support
