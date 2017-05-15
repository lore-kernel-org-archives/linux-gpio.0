From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 3/3] pinctrl: cherryview: Extend the Chromebook DMI
 quirk to Intel_Strago systems
Date: Mon, 15 May 2017 14:14:38 +0300
Message-ID: <1494846878.6967.58.camel@linux.intel.com>
References: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
         <20170515110103.59765-4-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:52215 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934117AbdEOLOo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 07:14:44 -0400
In-Reply-To: <20170515110103.59765-4-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Mon, 2017-05-15 at 14:01 +0300, Mika Westerberg wrote:
> It turns out there are quite many Chromebooks out there that have the
> same keyboard issue than Acer Chromebook. All of them are based on
> Intel_Strago reference and report their DMI_PRODUCT_FAMILY as
> "Intel_Strago" (Samsung Chromebook 3 and Cyan Chromebooks are
> exceptions
> for which we add separate entries).
> 
> Instead of adding each machine to the quirk table, we use
> DMI_PRODUCT_FAMILY of "Intel_Strago" that hopefully covers most of the
> machines out there currently.
> 
> 

> +		.ident = "Intel_Strago based Chromebooks",

> +		.ident = "Cyan Chromebook",

> +		.ident = "Samsung Chromebook 3",

I would do something like below (though I'm fine with current as well).

	.ident = "Intel_Strago based Chromebooks (All models)",
	.ident = "Intel_Strago based Chromebooks (Cyan)",
	.ident = "Samsung Chromebook 3 (Celes)",

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
