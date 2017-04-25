From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add terminate entry for
 dmi_system_id tables
Date: Tue, 25 Apr 2017 12:10:28 +0300
Message-ID: <20170425091028.GM7152@lahna.fi.intel.com>
References: <20170425062205.22627-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:54399 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1428477AbdDYJLG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Apr 2017 05:11:06 -0400
Content-Disposition: inline
In-Reply-To: <20170425062205.22627-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

On Tue, Apr 25, 2017 at 06:22:05AM +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Make sure dmi_system_id tables are NULL terminated.
> 
> Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer
> Chromebook keyboard work again")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I was just going to send similar patch but you were faster :)

Definitely right thing to do, thanks for fixing it.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
