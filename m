From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 2/2] pinctrl: intel: fix bug of register offset calculation
Date: Tue, 1 Dec 2015 11:16:45 +0100
Message-ID: <CACRpkdY5Jp25FRpE6hDYeVaS2W2Jp9jkV1amFpFCJkmQi4Nw3w@mail.gmail.com>
References: <1448471391-1115-1-git-send-email-qipeng.zha@intel.com>
	<1448471391-1115-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34101 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754211AbbLAKQq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 05:16:46 -0500
Received: by oies6 with SMTP id s6so755187oie.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 02:16:45 -0800 (PST)
In-Reply-To: <1448471391-1115-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Qi Zheng <qi.zheng@intel.com>

On Wed, Nov 25, 2015 at 6:09 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:

> The group size for registers PADCFGLOCK, HOSTSW_OWN, GPI_IS,
> GPI_IE, are not 24 for Broxton, Add a parameter to allow
> different platform to set correct value.
>
> ---
> change in v3:
>  use community->gpp_size directly, not macro.
>
> change in v2:
>  define gpp_size for sunrisepoint in its private structure.
>
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Patch applied. For 4.5 since I can't figure out if this is
a regression or not.

Yours,
Linus Walleij
