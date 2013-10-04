From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: Bug report - gpio: improve error path in gpiolib
Date: Fri, 4 Oct 2013 10:27:56 +0900
Message-ID: <524E199C.8030108@nvidia.com>
References: <F7C544E1-F25D-4E83-9896-A761ADBEBA93@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16842 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752898Ab3JDB15 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2013 21:27:57 -0400
In-Reply-To: <F7C544E1-F25D-4E83-9896-A761ADBEBA93@goldelico.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Frank Rowand <frank.rowand@sonymobile.com>, NeilBrown Brown <neilb@suse.de>, Belisko Marek <marek.belisko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Nikolaus,

On 10/03/2013 01:22 AM, Dr. H. Nikolaus Schaller wrote:
> Hi Alexandre,
> i think have traced down one problem we have to the latest patch in 3.12-rc:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpiolib.c?id=be1a4b13089b1e18da83a549d49163ccad3c19ba
>
> The problem is that by this patch a desc == NULL now returns -EINVAL while earlier it did return an -EPROBE_DEFER, which I consider the better option.
>
> By this -EINVAL, now some dependent drivers are no longer initialized.
>
> So I't suggest to revert that.

Adding Linus since he authored the patch.

I suppose the behavior should not change indeed. But could you specify 
which use-case now returns -EINVAL instead of -EPROBE_DEFER? It is not 
obvious by just looking at the patch alone.

Thanks,
Alex.


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
