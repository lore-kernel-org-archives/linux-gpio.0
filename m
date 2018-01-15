From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] gpio-wm831x: Use seq_putc() in wm831x_gpio_dbg_show()
Date: Mon, 15 Jan 2018 10:03:00 +0000
Message-ID: <20180115100300.rtvqfaebjm22kcsx@localhost.localdomain>
References: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:44478 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932413AbeAOKDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jan 2018 05:03:09 -0500
Content-Disposition: inline
In-Reply-To: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 09:37:53PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 21:30:09 +0100
> 
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
